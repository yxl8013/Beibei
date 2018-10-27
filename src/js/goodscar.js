jQuery(function($){
	$('.fixed-car').remove();
	let username = Cookie.getCookie("login_name");
	
	if(username){
		$.get('../api/goodscar.php',{username:username},function(data){
			data =JSON.parse(data);
			// console.log(data);
			if(data.length == 0){
				//空空如也
				$('.car-content').html(function(){
					$div = $('<div/>');
					$div.addClass('kongcar');
					$div.html(`<p>你的购物车还是空的,赶紧去挑选商品吧!</p>
										<p><a href="../index.html">去看看正在特卖的品牌商品吧.</a></p>
					`)
					return $div;
				})
			}else{
				render(data);
				fixed();
			}
		})
	}else{
		//空空如也
		$('.car-content').html(function(){
			$div = $('<div/>');
			$div.addClass('kongcar');
			$div.html(`<p>你的购物车还是空的,赶紧去挑选商品吧!</p>
								<p><a href="../index.html">去看看正在特卖的品牌商品吧.</a></p>
			`)
			return $div;
		})
	}
	//渲染页面函数
	function render(data){
		let total=0;
		let num = 0;
		let result = data.map(function(arr){
			num += Number(arr.length);
			let xj=0;
			let res;
			let arr_item =`<tr class="kong"></tr>
									<tr class="dianjia">
										<td colspan="7">
											<input type="checkbox" class="checkitem" checked="checked">
											<span class="dianjia-name"><a href="javascript:;">贝贝${arr[0].type}品牌特惠</a></span>
										</td>
									</tr>`;
			let res_item = arr.map(function(item){
				xj += Number((item.goodsprice*item.goodszhekou*item.qty/10));
				return`
					<tr class="car-item" data-id="${item.id}" data-type="${item.type}">
						<td><input type="checkbox" class="check-item" checked="checked"></td>
						<td>
								<a href="javascript:;"><img src="../${item.goodsimgurl}"></a>
								<a href="javascript:;">${item.goodsname}</a>
						</td>
						<td>
							<p>${item.color} ${item.size}</p>
						</td>
						<td class="price">
							<p class="danjia">${(item.goodsprice*item.goodszhekou/10).toFixed(2)}</p>
							<p>${(item.goodsprice*1).toFixed(2)}</p>
						</td>
						<td>
							<div class="qty">
								<a href="javascript:;" class="less"></a>
								<input type="text" value="${item.qty}" class="num">
								<a href="javascript:;" class="puls"></a>
							</div>
						</td>
						<td><span class="qtyPrice">${(item.goodsprice*item.goodszhekou*item.qty/10).toFixed(2)}</span></td>
						<td><a href="javascript:;" class="del">删除</a></td>
					</tr>
				`
			}).join("");
			let res_end =`<tr class="xj" data-type=${arr[0].type}><td colspan="7"><span>小计</span><span class="xj-price">${xj.toFixed(2)}</span></td></tr>`;
			total += xj;
			res = arr_item + res_item+ res_end;
			return res;
		}).join("");
		$(".car-list").html(result);
		$('.goodsqty').html(num);
		$('.total').html(' ¥ '+total.toFixed(2));
	}
	//事件委托绑定删除事件
	//单条删除
	$('.car-list').on('click',".del",function(){
		let id =$(this).closest('tr')[0].dataset.id;
		$.get('../api/removeCar.php',{username:username,id:id},function(data){
			if(data=="true"){
				$.get('../api/goodscar.php',{username:username},function(data){
					data =JSON.parse(data);
					render(data);});
			}
		})
	});
	//清空购物车
	$('.delAll').on('click',function(){
		$.get('../api/removeCar.php',{username:username,delall:"true"},function(data){
			if(data=="true"){
			window.location.reload();
			}
		})
	});
	//数量加减
	$('.car-list').on('click','.puls',function(){
		let qty = $(this).prev().val();
		let id = $(this).closest('tr')[0].dataset.id;
		let price = $(this).closest('tr').find('.danjia').text();
		// console.log(price);
		qty++;
		if(qty>=99){
			qty = 99;
		}
		$.get('../api/updata_qty.php',{id:id,qty:qty},(data)=>{
				if(data=="ok"){
					$(this).prev().val(qty);
					let xj = (qty*price*1).toFixed(2);
					$(this).closest('tr').find('.qtyPrice').text(xj);
					let type = $(this).closest('tr')[0].dataset.type;
					let $type_items = $('tr[data-type="'+type+'"]').not('.xj');
					// console.log($type_items);
					let $xj_tr = $('tr[data-type="'+type+'"]').filter('.xj');
					let xj_value =0;
					$type_items.find('.qtyPrice').each(function(idx,item){
								xj_value += $(item).text()*1;
					});
					$xj_tr.find('.xj-price').text(xj_value.toFixed(2));
					let total=0;
					$('.xj-price').each(function(idx,item){
						total+= $(item).text()*1;
					});
					$('.total').html(' ¥ '+total.toFixed(2));
				}
		})
	})
	$('.car-list').on('click','.less',function(){
		let qty = $(this).next().val();
		let id = $(this).closest('tr')[0].dataset.id;
		let price = $(this).closest('tr').find('.danjia').text();
		
		qty--;
		if(qty<=1){
			qty = 1;
		}
		$.get('../api/updata_qty.php',{id:id,qty:qty},(data)=>{
				if(data=="ok"){
					$(this).next().val(qty);
					let xj = (qty*price*1).toFixed(2);
					$(this).closest('tr').find('.qtyPrice').text(xj);	
					let type = $(this).closest('tr')[0].dataset.type;
					let $type_items = $('tr[data-type="'+type+'"]').not('.xj');
					// console.log($type_items);
					let $xj_tr = $('tr[data-type="'+type+'"]').filter('.xj');
					let xj_value =0;
					$type_items.find('.qtyPrice').each(function(idx,item){
								xj_value += $(item).text()*1;
					});
					$xj_tr.find('.xj-price').text(xj_value.toFixed(2));
					let total=0;
					$('.xj-price').each(function(idx,item){
						total+= $(item).text()*1;
					});
					$('.total').html(' ¥ '+total.toFixed(2));	
				}
		})
	})
	// ....................................
	function fixed(){
		$enter = $('.enter');
		let enter_top = $enter[0].offsetTop;
		// console.log(enter_top);
		if(enter_top>window.innerHeight){
			$enter.addClass('fixed');
		}
		window.onscroll = function(){
			if(enter_top>window.innerHeight){
				$enter.addClass('fixed');
			}
			if(window.scrollY >(enter_top-window.innerHeight)){
				$enter.removeClass('fixed');
			}
		}
	}
	
// ...............底部.......
})