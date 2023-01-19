<?php 
	include 'connection.php';	

    $upload_path = 'Images/';
    
    $upload_url = 'https://'.$_SERVER['SERVER_NAME'] . "/Ewishes/" . $upload_path;
	
    $name = $_REQUEST['name'];
    $id = $_REQUEST['id'];

    $fileinfo = pathinfo($_FILES["profile_pic"]["name"]);

    $extension = $fileinfo["extension"];

    $random = 'image_' . rand(1000,9999);

    $file_url = $upload_url . $random . '.' . $extension;

    $file_path = $upload_path . $random . '.'. $extension; 
			
    $category_img = "https://amisha1299.000webhostapp.com/Ewishes/";
    
    move_uploaded_file($_FILES["profile_pic"]["tmp_name"],$file_path);

    $result = "UPDATE Category SET category_img ='$category_img$file_path' where id='$id'";
    mysqli_query($con,$result);
?>