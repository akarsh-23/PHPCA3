<?php 
    if ($_SESSION['user']['role'] == null){
        header('location:' . BASE_URL . 'index.php');
    }
?>