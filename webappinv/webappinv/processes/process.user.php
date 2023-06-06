<?php
session_start();
include '../classes/class.user.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : '';
$status = isset($_GET['status']) ? $_GET['status'] : '';

switch ($action) {
    case 'new':
        create_new_user();
        break;
    case 'update':
        update_user();
        break;
    case 'status':
        change_user_status();
        break;
    case 'updatepassword':
        change_user_password();
        break;
    case 'updateemail':
        change_user_email();
        break;
}

function create_new_user()
{
    $user = new User();
    $email = $_POST['email'];
    $lastname = ucwords($_POST['lastname']);
    $firstname = ucwords($_POST['firstname']);
    $access = ucwords($_POST['access']);
    $password = $_POST['password'];
    $confirmpassword = $_POST['confirmpassword'];
    $password = md5($password);

    // Check if any of the fields is blank
    if (empty($email) || empty($lastname) || empty($firstname) || empty($access) || empty($password) || empty($confirmpassword)) {
        $_SESSION['error'] = "Please fill in all fields.";
        header('location: ../index.php?page=settings&subpage=users&action=new');
        return;
    }

    $result = $user->new_user($email, $password, $lastname, $firstname, $access);
    if ($result) {
        $id = $user->get_user_id($email);
        header('location: ../index.php?page=settings&subpage=users&action=profile&id=' . $id);
    }
}

function update_user()
{
    $user = new User();
    $user_id = $_POST['userid'];
    $lastname = ucwords($_POST['lastname']);
    $firstname = ucwords($_POST['firstname']);
    $access = ucwords($_POST['access']);

    // Check if any of the fields is blank
    if (empty($lastname) || empty($firstname) || empty($access)) {
        $_SESSION['error'] = "Please fill in all fields.";
        header('location: ../index.php?page=settings&subpage=users&action=update&id=' . $user_id);
        return;
    }

    $result = $user->update_user($lastname, $firstname, $access, $user_id);
    if ($result) {
        header('location: ../index.php?page=settings&subpage=users&action=profile&id=' . $user_id);
    }
}

function change_user_status()
{
    $user = new User();
    $id = isset($_GET['id']) ? $_GET['id'] : '';
    $status = isset($_GET['status']) ? $_GET['status'] : '';

    // Check if any of the fields is blank
    if (empty($id) || empty($status)) {
        $_SESSION['error'] = "Missing required parameters.";
        header('location: ../index.php?page=settings&subpage=users&action=profile&id=' . $id);
        return;
    }

    $result = $user->change_user_status($id, $status);
    if ($result) {
        header('location: ../index.php?page=settings&subpage=users&action=profile&id=' . $id);
    }
}

function change_user_password()
{
    $user = new User();
    $id = $_POST['userid'];
    $current_password = $_POST['crpassword'];
    $new_password = md5($_POST['npassword']);
    $confirm_password = $_POST['copassword'];

    // Check if any of the fields is blank
    if (empty($current_password) || empty($new_password) || empty($confirm_password)) {
        $_SESSION['error'] = "Please fill in all fields.";
        header('location: ../index.php?page=settings&subpage=users&action=changepassword&id=' . $id);
        return;
    }

    $result = $user->change_password($id, $new_password);
    if ($result) {
        header('location: ../index.php?page=settings&subpage=users&action=profile&id=' . $id);
    }
}

function change_user_email()
{
    $user = new User();
    $id = $_POST['userid'];
    $current_email = $_POST['useremail'];
    $new_email = $_POST['newemail'];
    $current_password = $_POST['crpassword'];

    // Check if any of the fields is blank
    if (empty($current_email) || empty($new_email) || empty($current_password)) {
        $_SESSION['error'] = "Please fill in all fields.";
        header('location: ../index.php?page=settings&subpage=users&action=changeemail&id=' . $id);
        return;
    }

    $result = $user->change_email($id, $new_email);
    if ($result) {
        header('location: ../index.php?page=settings&subpage=users&action=profile&id=' . $id);
    }
}


// Display error message if exists
if (isset($_SESSION['error'])) {
    $error = $_SESSION['error'];
    unset($_SESSION['error']);
}
?>
