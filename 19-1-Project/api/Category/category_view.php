<?php
    include('../connection.php');
        
    $select= "SELECT * FROM Category ORDER BY Category.id DESC";
    $result = mysqli_query($con,$select);
    
    $response= array();
         
    while ($row = mysqli_fetch_array($result))
    {
        $value = array();
        $value["id"] = $row["id"];
        $value["category_name"] = $row["category_name"];
        $value["category_img"] = $row["category_img"];
    
        array_push($response, $value);
    }
    echo json_encode($response);
?>