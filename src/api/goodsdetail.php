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


    $id= isset($_GET["id"]) ? $_GET["id"] :"25";
    $sql ='select * from goods where id="'.$id.'"';
    $result = $conn->query($sql);  //得到查询结果集
    $content = $result->fetch_all(MYSQLI_ASSOC);
    $result->close();  //关闭查询结果集
	
	$dataobj = $content[0];//@@@@@@@得到一个该一个商品数据对象
	//获取尺码
	$type   = $dataobj["type"];
	
	$sql = 'select * from size where type ="'.$type.'"';
	$result = $conn->query($sql);  //得到查询结果集
	$content = $result->fetch_all(MYSQLI_ASSOC);
	$result->close();  //关闭查询结果集
	
	$sizearr = $content; //@@@@@@@@得到尺码数组
	//获取颜色
	$sql = 'select * from color where type ="'.$type.'"';
	$result = $conn->query($sql);  //得到查询结果集
	$content = $result->fetch_all(MYSQLI_ASSOC);
	$result->close();  //关闭查询结果集
	$colorarr = $content; //@@@@@@@@得到尺码数组
	//创建一个新数组保存 [对象 数组 数组]
	$data = array();
	$data[0]=$dataobj;
	$data[1] = $sizearr;
	$data[2] = $colorarr;
	
    $data = json_encode($data,JSON_UNESCAPED_UNICODE);
    echo $data;
    $conn->close();




?>