jQuery(function($){
	//加载商品数据
	var param = location.search;
	param = param.slice(1);
	let id = param.split('=')[1]?param.split('=')[1] :25;
	//get请求
	$.get('../api/goodsdetail.php',{id:id},function(data){
		data = JSON.parse(data);
		var dataobj = data[0];
		var sizeArr = data[1];
		var colorArr = data[2];
		render(dataobj,colorArr,sizeArr);
		//放大镜
		$('.pic-box').xZoom({
			width:400,
			height:400
		});
		//给颜色尺码点击加钩子
		$colors = $('.color').children('span');
		$colors.on('click',function(){
			$($colors).removeClass('gou');
			$(this).addClass('gou');	
		});
		$sizes = $('.size').children('span');
		$sizes.on('click',function(){
			$($sizes).removeClass('gou');
			$(this).addClass('gou');
		});
		let typename = dataobj.type;
		$.get('../api/goodsdetail_same.php',{typename:typename},function(data){
			data = JSON.parse(data);
			renderSame(data);
		}),
		//点击添加购物车
		$('.addtoCar').on('click',function(){
			let username = Cookie.getCookie("login_name");
			let curColor;
			let curSize;
			let qty = $('.qty').children('span').text();//获取数量
			if(username){
				//获取选择的颜色和码数 
				$colors.each(function(idx,item){
					if($(item).hasClass('gou')){
						curColor= $(item).text();
					}
				});
				$sizes.each(function(idx,item){
					if($(item).hasClass('gou')){
						curSize= $(item).text();
					}
				});
				// console.log(curColor,curSize,dataobj.id,dataobj.imgurl,dataobj.price,dataobj.zhekou);
				if(!(curSize&&curColor)){alert('请选择商品');return;};
				$.get('../api/addtocar.php',
					{
						username:username,
						goodsid:dataobj.id,
						qty:qty,
						color:curColor,
						size:curSize,
						goodsname:dataobj.name,
						goodsimgurl:dataobj.imgurl,
						goodsprice:dataobj.price,
						goodszhekou:dataobj.zhekou,
						type:dataobj.type
					},function(data){
						if(data=="ok"){
							flyCar();
							// alert("加入成功");
							// location.href="../html/goodscar.html";
						}
					})
				
				
				
			}else{
				location.href = '../html/login.html';
			}
		})
	});
	//数量加减
	$('.plus').on('click',function(){
		let qty = $('.qty').children('span').text();
		qty++;
		if(qty>=99){
			qty=99;
		}
		$('.qty').children('span').text(qty);
	});
	$('.less').on('click',function(){
		let qty = $('.qty').children('span').text();
		qty--;
		if(qty<=1){
			qty= 1;
		}
		$('.qty').children('span').text(qty);
	});
	
	
	
	
	
	//渲染页面函数
	function render(obj,colorArr,sizeArr){
		$('.detail-box').children('.pic-box').children('img').prop('src',`../${obj.imgurl}`)
		.next().find('img').prop('src',`../${obj.imgurl}`);
		
		$('.content-box').children('.title').html(`<span>贝贝自营</span>${obj.name}`);
		
		$('.buy').find('span').html(`¥${(obj.price*obj.zhekou/10).toFixed(2)}`);
		$('.red-save').children('span').eq(0).html(`¥${(obj.price*obj.zhekou/10).toFixed(2)}`).next().html(obj.price)
		.next().html(`折扣<br>${(obj.zhekou*1).toFixed(1)}折`).next().html(`您节省了<br>${(obj.price-obj.price*obj.zhekou/10).toFixed(2)}`)
		$('.color').html(function(){
			let res = `<i>${colorArr[0].name}</i>`;
			res += colorArr.map(function(item){
				return `<span><img src="../${obj.imgurl}">${item.color}</span>`;
			}).join("");
			return res;
		});
		$('.size').html(function(){
			let res = `<i>${sizeArr[0].name}</i>`;
			res += sizeArr.map(function(item){
				return `<span>${item.size}</span>`;
			}).join("");
			return res;
		});
	}
	//渲染相似推荐盒子函数
	function renderSame(data){
		let res=data.map(function(item){
			return`<li data-id="${item.id}">
						<a href="javascript:;">
							<img src="../${item.imgurl}">
							<p>${item.name}</p>
							<div><span>¥ ${(item.price*item.zhekou/10).toFixed(2)}</span><i>${item.zhekou}折包邮</i></div>
						</a>
				</li>`
		}).join("");
		$('.goodslist').html(res);
	}
	//点击推荐跳转
	$('.goodslist').on('click','li',function(){
		let id =$(this)[0].dataset.id;
		location.href = '../html/goodsdetail.html?id='+id;
	})
	//飞入购物车
	function flyCar(){
		$.get('../api/goodsdetail.php',{id:id},function(data){
			data = JSON.parse(data);
			dataobj =data[0];
			$flyimg = $('<img/>');
			$flyimg.prop("src",`../${dataobj.imgurl}`).addClass('fly-img');
			let curtop = $('.addtoCar').offset().top + 50 ;
			let curtop2 = curtop - 150;
			let curleft = $('.addtoCar').offset().left +45;
			$flyimg.css({'top':curtop,'left':curleft});
			$flyimg.appendTo(document.body);
			
			let target_top = $('.minicar').offset().top;
			let target_left = $('.minicar').offset().left;
			$flyimg.animate({opacity:1,top:curtop2},300,function(){
				$flyimg.animate({top:target_top,left:target_left},500,function(){
					$flyimg.remove();
					location.href = '../html/goodscar.html';
				})
			})

			
			
		});
	}
	
	
// ...............底部......	
});