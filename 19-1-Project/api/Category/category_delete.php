<?php
    include('../connection.php');
    
    $ID = $_POST['data'];

    $delete = "DELETE FROM Category WHERE id = '$ID'";
    mysqli_query($con,$delete);
?>