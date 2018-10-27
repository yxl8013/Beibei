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

    $type= isset($_GET["type"]) ? $_GET["type"] : "";
	
    $pageidx= isset($_GET["pageidx"]) ? $_GET["pageidx"] : 1 ;
	$start = ($pageidx*1-1)*28;
	$end = $pageidx*28;
	// var_dump($start);
    $priceup = isset($_GET["priceup"]) ? $_GET["priceup"] :"";
    $timeup = isset($_GET["timeup"]) ? $_GET["timeup"] :"";
	//默认返回数据 排序
	if($type==""){
		//查数量得出分页的数量
		$sql ='select * from goods';
		$result = $conn->query($sql);  //得到查询结果集
		$pages = $result->num_rows/28; 
		$pages =ceil($pages);//得到页的总数
		$result->close();  //关闭查询结果集
		if($priceup ==""){
			$sql ='select * from goods limit '. $start.','.$end.'';
		};
		if($priceup=="true"){
			$sql= 'select * from goods order by price limit '. $start.','.$end.'';
		};
		if($priceup =="false"){
			$sql= 'select * from goods order by price desc limit '. $start.','.$end.'';
		};
		if($timeup=="true"){
			$sql= 'select * from goods order by addtime limit '. $start.','.$end.'';
		};
		if($timeup =="false"){
			$sql= 'select * from goods order by addtime desc limit '. $start.','.$end.'';
		};
		
		$result = $conn->query($sql);  //得到查询结果集
		$content = $result->fetch_all(MYSQLI_ASSOC);
		$result->close();  //关闭查询结果集
		$data = array();
		$data[0]= $pages;
		$data[1]= $content;
		$data[2]= $pageidx;
		$data = json_encode($data,JSON_UNESCAPED_UNICODE);
		echo $data;
	};
	//根据type返回数据 排序
	if($type){
		if($priceup ==""){
			$sql ='select * from goods where type="'.$type.'"';
		};
		if($priceup=="true"){
			$sql ='select * from goods where type="'.$type.'"order by price';
		};
		if($priceup =="false"){
			$sql ='select * from goods  where type="'.$type.'"order by price desc';
		};
		if($timeup =="true"){
			$sql ='select * from goods  where type="'.$type.'"order by addtime';
		};
		if($timeup =="false"){
			$sql ='select * from goods where type="'.$type.'"order by addtime desc';
		};
		
		$result = $conn->query($sql);  //得到查询结果集
		$content = $result->fetch_all(MYSQLI_ASSOC);
		$result->close();  //关闭查询结果集
		$data = json_encode($content,JSON_UNESCAPED_UNICODE);
		echo $data;
	};
	
	//关闭数据库
    $conn->close();
?>