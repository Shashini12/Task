<?php

require 'authentication.php'; // admin authentication check 

// auth check
$user_id = $_SESSION['admin_id'];
$user_name = $_SESSION['name'];
$security_key = $_SESSION['security_key'];
if ($user_id == NULL || $security_key == NULL) {
    header('Location: index.php');
    exit();
}

if (!isset($_GET['task_id'])) {
    die("Invalid request. Task ID is required.");
}

$task_id = $_GET['task_id'];

// Fetch existing task details
$sql = "SELECT * FROM task_info WHERE task_id = ?";
$stmt = $obj_admin->db->prepare($sql);
$stmt->execute([$task_id]);
$row = $stmt->fetch(PDO::FETCH_ASSOC);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_task_info'])) {
    $task_description = $_POST['task_description'] ?? '';
    $t_start_time = $_POST['t_start_time'] ?? '';
    $t_end_time = $_POST['t_end_time'] ?? '';
    $assign_to = $_POST['assign_to'] ?? null;
    $status = $_POST['status'] ?? 0;

    try {
        // Update task information
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
            $upload_dir = "uploads/";

            $file_name = $_FILES['uploaded_file']['name'];
            $file_tmp = $_FILES['uploaded_file']['tmp_name'];
            $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

            if (in_array($file_ext, $allowed_extensions)) {
                $new_file_name = time() . "_" . basename($file_name);
                $destination = $upload_dir . $new_file_name;

                if (move_uploaded_file($file_tmp, $destination)) {
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

        echo "<script>alert('Task updated successfully!'); window.location.href='edit-task.php?task_id=$task_id';</script>";
        exit();
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}

$user_role = $_SESSION['user_role'];
$page_name = "Edit Task";
include("include/sidebar.php");

$sql = "SELECT * FROM task_info WHERE task_id = ?";
$stmt = $obj_admin->db->prepare($sql);
$stmt->execute([$task_id]);
$row = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<div class="row">
    <div class="col-md-12">
        <div class="well well-custom">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="well">
                        <h3 class="text-center bg-primary" style="padding: 7px;">Edit Task</h3><br>
                        <form class="form-horizontal" method="post" enctype="multipart/form-data" autocomplete="off">
                            <div class="form-group">
                                <label class="control-label col-sm-5">Task Title</label>
                                <div class="col-sm-7">
                                    <input type="text" name="task_title" class="form-control" value="<?php echo htmlspecialchars($row['t_title']); ?>" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-5">Task Description</label>
                                <div class="col-sm-7">
                                    <textarea name="task_description" class="form-control" rows="5"><?php echo htmlspecialchars($row['t_description']); ?></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-5">Upload File</label>
                                <div class="col-sm-7">
                                    <input type="file" name="uploaded_file" class="form-control">
                                    <?php if (!empty($row['uploaded_file'])): ?>
                                        <p>View File: <a href="<?php echo htmlspecialchars($row['uploaded_file']); ?>" target="_blank">View File</a></p>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-5">Start Time</label>
                                <div class="col-sm-7">
                                    <input type="text" name="t_start_time" id="t_start_time" class="form-control" value="<?php echo $row['t_start_time']; ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-5">End Time</label>
                                <div class="col-sm-7">
                                    <input type="text" name="t_end_time" id="t_end_time" class="form-control" value="<?php echo $row['t_end_time']; ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-5">Assign To</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="assign_to">
                                        <option value="">Select</option>
                                        <?php
                                        $sql = "SELECT user_id, fullname FROM tbl_admin WHERE user_role = 2";
                                        $info = $obj_admin->manage_all_info($sql);
                                        while ($rows = $info->fetch(PDO::FETCH_ASSOC)) {
                                            echo '<option value="' . $rows['user_id'] . '"' . ($rows['user_id'] == $row['t_user_id'] ? ' selected' : '') . '>' . $rows['fullname'] . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-5">Status</label>
                                <div class="col-sm-7">
                                    <select class="form-control" name="status">
                                        <option value="0" <?php echo ($row['status'] == 0) ? 'selected' : ''; ?>>Incomplete</option>
                                        <option value="1" <?php echo ($row['status'] == 1) ? 'selected' : ''; ?>>In Progress</option>
                                        <option value="2" <?php echo ($row['status'] == 2) ? 'selected' : ''; ?>>Completed</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-5 col-sm-7">
                                    <button type="submit" name="update_task_info" class="btn btn-success-custom">Update Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    flatpickr('#t_start_time', { enableTime: true });
    flatpickr('#t_end_time', { enableTime: true });
</script>
<?php include("include/footer.php"); ?>
