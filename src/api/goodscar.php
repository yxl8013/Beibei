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

	
    $username= isset($_GET["username"]) ? $_GET["username"] :"13288888888";
		if($username){
			//查询该用户的购物车的所有内容
			$sql ='select * from carlist where username="'.$username.'" order by addtime desc';
			$result = $conn->query($sql);  //得到查询结果集
			$content = $result->fetch_all(MYSQLI_ASSOC);
			$result->close();  //关闭查询结果集
			// var_dump($content);
			//得到所有内容的所有商品类型数组
			$types=array();
			$y=0;
			for($i=0;$i<count($content);$i++){
				if(!in_array($content[$i]["type"],$types)){
					$types[$y]=$content[$i]["type"];
					$y++;
				}	
			}
			// var_dump($types);
			//根据内容类型再查询拿数据,达到分组目的.
			$bigarr = array();
			

			for($i=0;$i<count($types);$i++){
				// var_dump($types[$i]);
				$sql ='select * from carlist where username = "'.$username.'" and type="'.$types[$i].'" order by addtime desc';
				$result = $conn->query($sql);  //得到查询结果集
				$smallarr = $result->fetch_all(MYSQLI_ASSOC);
				$result->close();
				$bigarr[$i]=$smallarr;
			}
			
			
			
			
			//最终返回的是该用户的所有购物车商品,按商品类型分类成一个个数组  [[{},{}],[{},{}]]
			$data = json_encode($bigarr,JSON_UNESCAPED_UNICODE);
			echo $data;
			
			
		}

    $conn->close();

?>