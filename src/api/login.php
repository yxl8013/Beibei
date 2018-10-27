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
        if($num == 0){
            echo "no";
        }
        if($num ==1){
            $content= $result->fetch_assoc();
            if($content["password"]== $psw){
                echo "true" ;
            }else{
                echo "false";
            }
        }
        $result->close();  //关闭查询结果集
    }
    
    $conn->close();
?>