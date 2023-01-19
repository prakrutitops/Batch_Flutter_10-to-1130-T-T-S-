<?php
    include('../connection.php');

    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $mobile_no = $_POST['mobile_no'];
    $identifier = $_POST['identifier'];
    
    if($username=="" && $password=="" && $confirm_password=="" && $mobile_no=="")
    {
        echo '0';
    }
    else
    { 
        $insert = "INSERT INTO Registration (username,password,confirm_password,mobile_no,identifier) VALUES ('$username','$password','$confirm_password','$mobile_no','$identifier')";
        $result=mysqli_query($con,$insert);
    }
?>