<?php
    include('../connection.php');
 
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $mobile_no = $_POST['mobile_no'];

    $result = "UPDATE Registration SET password = '$password', confirm_password = '$confirm_password' WHERE mobile_no='$mobile_no'";

    if(mysqli_query($con,$result))
    {
        echo 'Record Updated Successfully';
    }
    else
    {
        echo 'Something went wrong';
    }
?>