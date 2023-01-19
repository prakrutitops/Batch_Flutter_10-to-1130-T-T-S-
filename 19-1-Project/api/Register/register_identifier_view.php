<?php
    include('../connection.php');

    $username=$_REQUEST["username"];
    $password=$_REQUEST["password"];
    $mobileno=$_REQUEST["mobile_no"];
    
    $select="SELECT * from Registration where username='$username' and password='$password' and mobile_no='$mobileno'";
    $result=mysqli_query($con,$select);
 
    $response= array();
         
    while ($row = mysqli_fetch_array($result))
    {
        $value = array();
        $value["id"] = $row["id"];
        $value["username"] = $row["username"];
        $value["password"] = $row["password"];
        $value["confirm_password"] = $row["confirm_password"];
        $value["mobile_no"] = $row["mobile_no"];
        $value["identifier"] = $row["identifier"];
    
        array_push($response, $value);
    }
    echo json_encode($response);
?>