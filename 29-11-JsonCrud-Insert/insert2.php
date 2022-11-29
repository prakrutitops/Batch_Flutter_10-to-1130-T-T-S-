<?php
    include('connect2.php');

    $uname= $_POST["username"];
    $pass= $_POST["password"];
    $email= $_POST["email"];
    
    if($uname=="" && $pass=="" &&$email=="")
    {
        echo '0';
    }
    else
    {
        $sql ="Insert into register (username,password,email) values('$uname','$pass','$email')";
        $ex=mysqli_query($con,$sql);
    }

?>