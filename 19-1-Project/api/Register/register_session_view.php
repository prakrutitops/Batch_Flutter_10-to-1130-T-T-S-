<?php
    include('../connection.php');

    $mobileno=$_REQUEST["data"];
    
    $select="SELECT * from Registration where mobile_no='$mobileno'";
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
    
        array_push($response, $value);
    }
    echo json_encode($response);
?>