<?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname   = "beibei";
    $conn = new mysqli($servername,$username,$password,$dbname);
    if($conn->connect_error){
        die("连接失败".$conn->connect_error);
    }
    $conn->set_charset("utf8");


    $id = isset($_GET["id"]) ? $_GET["id"] :"";
	$qty = isset($_GET["qty"]) ? $_GET["qty"] :"";

	if($id){
		$sql = 'update carlist set qty="'.$qty.'" where id="'.$id.'"';
		$ok = $conn->query($sql);
		if($ok){
// 			$sql = 'select * from carlist where id="'.$id.'"';
// 			$result = $conn->query($sql);
// 			$content = $result->fetch_assoc();
// 			$result->close();
// 			$xiaoji = $content["qty"]*$content["goodsprice"]*$content["goodszhekou"]/10;
			// echo $xiaoji;
			echo "ok";
		}
	}
  
    $conn->close();

?>