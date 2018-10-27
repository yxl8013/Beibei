jQuery(function($){
	//截取参数 如果存在
	var param = location.search;
	param = param.slice(1);
	param = param.split('=')[1];
	if(param){
		//发起商品类型请求
		// console.log(param);
		param=decodeURI(param);
		$.get('../api/goodslist.php',{type:param},function(data){
			data = JSON.parse(data);
			render(data);
			$(".pages").html('');
		})
	}else{
		//否则默认加载所有商品数据
		$.get('../api/goodslist.php',function(data){
			data = JSON.parse(data);
			var pages = data[0];
			var dataobj = data[1];
			var pageidx = data[2];
			// console.log(data);
			render(dataobj);
			createPages(pages,pageidx);
		});
	}
	var typename = "";
	let priceup = false;
	let timeup  = true;
	$sort = $('.sortbox').children('a');
	$sort.on('click',function(){
		$sort.removeClass('red');
		$(this).addClass('red');
		if(this==$sort[0]){
			typename = "";
			$.get('../api/goodslist.php',function(data){
				data = JSON.parse(data);
				var pages = data[0];
				var dataobj = data[1];
				var pageidx = data[2];
				render(dataobj);
				createPages(pages,pageidx);
			});
		}
		if(this==$sort[1]){
			timeup = !timeup;
			let str = timeup + "";
			$.get('../api/goodslist.php',{timeup:str,type:typename},function(data){
				data = JSON.parse(data);
				if(typeof data[0] != "object"){
					var pages = data[0];
					var dataobj = data[1];
					var pageidx = data[2];
					createPages(pages,pageidx);
					render(dataobj);
				}else{
					render(data);
				}
				
			})
			
		}
		if(this==$sort[2]){
			priceup = !priceup;
			let str = priceup + "";
			$.get('../api/goodslist.php',{priceup:str,type:typename},function(data){
				data = JSON.parse(data);
				if(typeof data[0] != "object"){
					var pages = data[0];
					var dataobj = data[1];
					var pageidx = data[2];
					createPages(pages,pageidx);
					render(dataobj);
				}else{
					render(data);
				}
				
			});
		}
	});
	
	//根据类型加载商品数据
		var $types = $('#nav-bottom').find('a').slice(0,9);
		$types.on('click',function(){
			var type = $(this).html();
			typename = type;
			$.get('../api/goodslist.php',{type:typename},function(data){
				data = JSON.parse(data);
				render(data);
				$(".pages").html('');
			})
		})
		
		

	//创建分页的函数
	function createPages(qty,curpage){
	
		$pages = $('<div></div>');
		$pages.addClass('pages');
		for(let i=0;i<qty;i++){
			$span=$('<span></span>');
			if(i == curpage*1-1){
				$span.addClass('active');
			}
			$span.html(i+1).appendTo($pages);
		}
		$pages.appendTo($('.goodsbox'));
		//分页点击事件
		$('.pages').on('click','span',function(){
			// $('.pages').children().removeClass('active');
			// $(this).addClass('active');
			let idx = $(this).html()*1;
			// console.log(idx);
			
			$.get('../api/goodslist.php',{pageidx:idx},function(data){
				// console.log(data)
				data = JSON.parse(data);
				if(typeof data[2] == "string"){
					var pages = data[0];
					var dataobj = data[1];
					var pageidx = data[2];
					// console.log(pageidx)
					createPages(pages,pageidx);
				}
				// console.log(data);
				render(dataobj);
				
			})	
		})
	};
	//跳转详情页
	$('.goodslist').on('click','li',function(){
		let id =$(this)[0].dataset.id;
		location.href = '../html/goodsdetail.html?id='+id;
	})
	
	
	
	//渲染页面函数
	function render(data){
		$goodslist = $('.goodslist');
		let res= data.map(function(item){
			return `<li data-id="${item.id}"> 
					<i></i>
					<a href="javascript:;">
						<img src="../${item.imgurl}" >
						<span>${item.name}</span>
						<div>¥ ${item.price}</div>
					</a>
			</li>`
		}).join("");
		$goodslist.html(res);
	};
	
// ............底部.....	
})