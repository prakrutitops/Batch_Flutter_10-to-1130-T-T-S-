<?php
    
    include('connect2.php');
    
    $uname=$_REQUEST["u1"];
    $pass=$_REQUEST["p1"];
    
    $sql="select * from register where username='$uname' and password ='$pass'";
    
    
    $ex=mysqli_query($con,$sql);
    
    $no=mysqli_num_rows($ex);
    
    
    if($no>0)
    {
    $fet=mysqli_fetch_object($ex);
    echo json_encode(['code'=>200]);
    }
    else
    {
    echo "0";
    }

?>