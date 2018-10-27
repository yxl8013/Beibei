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

    $uname= isset($_GET["uname"]) ? $_GET["uname"] :"";
    $psw= isset($_GET["psw"]) ? $_GET["psw"] :"";
    if($uname&&$psw){
        $sql ='select * from admin where username="'.$uname.'"';
        $result = $conn->query($sql);  //得到查询结果集
        $num = $result->num_rows;
        $result->close();  //关闭查询结果集
        if($num == 0){
            echo "true";
            $sql = 'insert into admin (username,password) values ("'.$uname.'","'.$psw.'")';
            $conn->query($sql);
        }
        if($num ==1){
            echo "false";
        }
       
    }
    $conn->close();
?>