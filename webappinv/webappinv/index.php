<?php
/* include the class file (global - within application) */
include_once 'classes/class.user.php';
include_once 'classes/class.product.php';
include_once 'classes/class.receive.php';
include_once 'classes/class.release.php';
include_once 'classes/class.inventory.php';
include 'config/config.php';

$page = (isset($_GET['page']) && $_GET['page'] != '') ? $_GET['page'] : '';
$subpage = (isset($_GET['subpage']) && $_GET['subpage'] != '') ? $_GET['subpage'] : '';
$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';
$id = (isset($_GET['id']) && $_GET['id'] != '') ? $_GET['id'] : '';

$user = new User();
$product = new Product();
$receive = new Receive();
$release = new Release();
$inventory = new Inventory();
if(!$user->get_session()){
	header("location: login.php");
}
$user_id = $user->get_user_id($_SESSION['user_email']);
$user_id_login = $user->get_user_id($_SESSION['user_email']);
$user_access_level = $user->get_user_access($user_id_login);
?>
<!DOCTYPE html>
<html>
<head>
    <title>RBC Clothing</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Assistant&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/custom.css?<?php echo time();?>">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Add Chart.js library -->
</head>
<body>
<div id="container">
    <div id="header">
      <h2>RBC Clothing</h2>
    </div>
    <div id="wrapper">
            <div id="menu">
                <a href="index.php">Home</a> | 
                <a href="index.php?page=receive">Receiving</a> | 
                <a href="index.php?page=release">Releasing</a> |
                <a href="index.php?page=inventory">Inventory</a> |
                <a href="index.php?page=settings">Settings</a> | 
                <a href="logout.php" class="move-right">Log Out</a> 
                <span class="move-right"><?php //echo $user->get_user_lastname($user_id).', '.$user->get_user_firstname($user_id);?>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</span> 
            </div>
            <div id="content">
                <?php
                switch($page){
                            case 'settings':
                                require_once 'settings-module/index.php';
                            break; 
                            case 'receive':
                                require_once 'receive-module/index.php';
                            break; 
                            case 'inventory':
                                require_once 'inventory-module/index.php';
                            break; 
                            case 'release':
                                require_once 'release-module/index.php';
                            break; 
                            default:
                                ?>
                                <div id="chartContainer">
                                    <canvas id="barChart"></canvas>
                                </div>

                                <script>
                                    var chartLabels = ['stocks', 'sales', 'inventory'];
                                    var chartData = [10, 20, 30, 15];

                                    var ctx = document.getElementById('barChart').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: chartLabels,
                                            datasets: [{
                                                label: 'Clothes Sales',
                                                data: chartData,
                                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                                borderColor: 'rgba(75, 192, 192, 1)',
                                                borderWidth: 1
                                            }]
                                        },
                                        options: {
                                            responsive: true,
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
                                </script>
                                <?php
                            break; 
                        }
                ?>
            </div>
    </div>
</div>
</body>
</html>
