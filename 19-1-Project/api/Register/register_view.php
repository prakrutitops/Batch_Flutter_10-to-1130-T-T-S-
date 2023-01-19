<?php
    include('../connection.php');

    $username=$_REQUEST["username"];
    $password=$_REQUEST["password"];
    $mobileno=$_REQUEST["mobile_no"];

    $select="select * from Registration where username='$username' and password='$password' and mobile_no='$mobileno'";
    $result=mysqli_query($con,$select);

    $num=mysqli_num_rows($result);

    if($num>0)
    {
        $fetch=mysqli_fetch_object($result);
        echo json_encode(['code'=>200]);
    }
    else
    {
        echo "0";
    }
?>