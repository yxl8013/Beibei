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


    $type= isset($_GET["typename"]) ? $_GET["typename"] :"童装";

    $sql ='select * from goods where type="'.$type.'" limit 1,6';
    $result = $conn->query($sql);  //得到查询结果集
    $content = $result->fetch_all(MYSQLI_ASSOC);
    $result->close();  //关闭查询结果集
    $data = json_encode($content,JSON_UNESCAPED_UNICODE);
    echo $data;
    $conn->close();








?>