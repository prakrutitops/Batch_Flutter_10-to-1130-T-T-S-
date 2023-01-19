<?php
    include('../connection.php');
 
    $id = $_POST['id'];
    $categorynm = $_POST['category_name'];

    $result = "UPDATE Category SET category_name = '$categorynm' WHERE id= '$id'";

    if(mysqli_query($con,$result))
    {
        echo 'Record Updated Successfully';
    }
    else
    {
        echo 'Something went wrong';
    }
    
?>