<?php
    include('../connection.php');
    
    $ID = $_POST['data'];
    
    $delete1 = "DELETE FROM Category_Images WHERE c_id = '$ID'";
    mysqli_query($con,$delete1);
?>