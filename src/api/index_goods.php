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


    $sql = 'select * from goods';
    $result = $conn->query($sql);  //得到查询结果集
    $content = $result->fetch_all(MYSQLI_ASSOC);

    $result->close();  //关闭查询结果集
    $idxs = array_rand($content,60);
    $newarr = array();
    for($i=0;$i<count($idxs);$i++){
        $newarr[$i] = $content[$idxs[$i]];
    }
    $data = json_encode($newarr,JSON_UNESCAPED_UNICODE);
    echo $data;
    $conn->close();





?>