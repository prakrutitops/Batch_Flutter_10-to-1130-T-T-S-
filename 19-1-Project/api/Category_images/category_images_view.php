<?php
    include('../connection.php');

    $cid=$_REQUEST["data"];
    
    $select="SELECT * from Category_Images where c_id='$cid'";
   // $select="select * from Category_Images";
    $result=mysqli_query($con,$select);
 
    $response= array();
         
    while ($row = mysqli_fetch_array($result))
    {
        $value = array();
        $value["id"] = $row["id"];
        $value["c_id"] = $row["c_id"];
        $value["c_images"] = $row["c_images"];
    
        array_push($response, $value);
    }
    echo json_encode($response);
?>