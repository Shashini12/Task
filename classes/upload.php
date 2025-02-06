<?php
require '../authentication.php'; // Ensure authentication
require 'connection.php'; // Include database connection
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_GET['task_id'])) {
    $task_id = $_GET['task_id'];
    // Retrieve form data
    $task_description = $_POST['task_description'] ?? '';
    $t_start_time = $_POST['t_start_time'] ?? '';
    $t_end_time = $_POST['t_end_time'] ?? '';
    $assign_to = $_POST['assign_to'] ?? null;
    $status = $_POST['status'] ?? 0;

    try {
        // Update task information in the database
        $sql = "UPDATE task_info 
                SET t_description = ?, 
                    t_start_time = ?, 
                    t_end_time = ?, 
                    t_user_id = ?, 
                    status = ? 
                WHERE task_id = ?";
        $stmt = $obj_admin->db->prepare($sql);
        $stmt->execute([$task_description, $t_start_time, $t_end_time, $assign_to, $status, $task_id]);

        // Handle file upload
        if (isset($_FILES['uploaded_file']) && $_FILES['uploaded_file']['error'] == 0) {
            $allowed_extensions = ['doc', 'docx', 'xls', 'xlsx', 'pdf', 'jpg', 'jpeg'];
            $upload_dir = "uploads/"; // Ensure this folder exists and has write permissions

            // Extract file extension
            $file_name = $_FILES['uploaded_file']['name'];
            $file_tmp = $_FILES['uploaded_file']['tmp_name'];
            $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

            if (in_array($file_ext, $allowed_extensions)) {
                $new_file_name = time() . "_" . basename($file_name); // Rename file
                $destination = $upload_dir . $new_file_name;

                if (move_uploaded_file($file_tmp, $destination)) {
                    // Update file path in the database
                    $sql = "UPDATE task_info SET uploaded_file = ? WHERE task_id = ?";
                    $stmt = $obj_admin->db->prepare($sql);
                    $stmt->execute([$destination, $task_id]);
                } else {
                    echo "Error uploading file.";
                }
            } else {
                echo "Invalid file type.";
            }
        }

        echo "Task updated successfully!";
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
} else {
    echo "Invalid request.";
}
?>
