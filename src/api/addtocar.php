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

	$username = isset($_GET["username"]) ? $_GET["username"] : null;
	$goodsid = isset($_GET["goodsid"]) ? $_GET["goodsid"] :"";
	$qty = isset($_GET["qty"]) ? $_GET["qty"] :"";
	$type = isset($_GET["type"]) ? $_GET["type"] :"";
	$color = isset($_GET["color"]) ? $_GET["color"] :"";
	$size = isset($_GET["size"]) ? $_GET["size"] :"";
	$goodsname = isset($_GET["goodsname"]) ? $_GET["goodsname"] :"";
	$goodsimgurl = isset($_GET["goodsimgurl"]) ? $_GET["goodsimgurl"] :"";
	$goodsprice = isset($_GET["goodsprice"]) ? $_GET["goodsprice"] :"";
	$goodszhekou = isset($_GET["goodszhekou"]) ? $_GET["goodszhekou"] :"";
	
	if($username){
		$sql = 'select * from carlist where username="'.$username.' "and goodsid="'.$goodsid.'" and color="'.$color.'" and size="'.$size.'"';
		$result = $conn->query($sql);
		$num = $result->num_rows;
		if($num ==0){
			$sql = 'insert into carlist (username,goodsid,qty,color,size,goodsname,goodsimgurl,goodsprice,goodszhekou,type)
				values("'.$username.'","'.$goodsid.'","'.$qty.'","'.$color.'","'.$size.'","'.$goodsname.'","'.$goodsimgurl.'","'.$goodsprice.'","'.$goodszhekou.'","'.$type.'")';
			$conn->query($sql);
			echo "ok";
		};
		if($num ==1){
			$obj = $result->fetch_all(MYSQLI_ASSOC)[0];
			$qty = $qty+$obj['qty'];
			$sql = 'update carlist set qty="'.$qty.'" where username="'.$username.' "and goodsid="'.$goodsid.'" and color="'.$color.'" and size="'.$size.'"';
			$conn->query($sql);
			echo "ok";
		}
		$result->close();
	}
	
	
	$conn->close();

?>