<?php

    include('connect2.php');
    
    $sql ="select * from register";
    
    $r= mysqli_query($con,$sql);
    $response=array();
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"];
        $value["username"]=$row["username"];
        $value["password"]=$row["password"];
        $value["email"]=$row["email"];
        
        array_push($response,$value);
    }
    
    echo json_encode($response);
    mysqli_close($con);

?>