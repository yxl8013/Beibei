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

	$delall = isset($_GET["delall"]) ? $_GET["delall"] :"";
    $id = isset($_GET["id"]) ? $_GET["id"] :"";
	$username = isset($_GET["username"]) ? $_GET["username"] :"";
	if($delall == "true"){
		$sql = 'delete from carlist where username ="'.$username.'"';
		$isok = $conn->query($sql);
	}else{
		$sql = 'delete from carlist where username ="'.$username.'" and id="'.$id.'"';
		$isok = $conn->query($sql);
	};
	if($isok){
		echo "true";

	}
    $conn->close();





?>