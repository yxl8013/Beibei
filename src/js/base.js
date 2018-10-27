var login_name;
// ..........登陆显示用户名..........
jQuery(function($){
   login_name = Cookie.getCookie('login_name');
    if(login_name){
        $('.first-li').addClass('login-name').html(`<a href="javascript:;"><i class="glyphicon glyphicon-user"></i>${login_name}</a ><a href="javascript:;" class="tuichu">[ 退出 ]</a>`);
        $('.tuichu').on('click',function(){
            Cookie.removeCookie("login_name",login_name,"/");
            window.location.reload();
        })
    };



//分类栏 获取数据···ajax加载···
    $(".search_class").on("mouseenter",function(){
        $(this).find('.m-bn-con').stop().slideDown(1000);
    }).on("mouseleave",function(){
        $(this).find(".m-bn-con").stop().hide();
    });
    var typename =['热销分类','儿童服饰','婴儿装','婴童鞋','奶粉辅食','纸尿裤','哺育喂养','洗护清洁','热销分类','儿童服饰','婴儿装','婴童鞋','奶粉辅食','热销分类','儿童服饰'];
    $(".search_class").on('mouseenter',function(){
        $(this).find('.typename').html(function(){
            return typename.map(function(item){
                return `<li>${item}</li>`
            }).join("");
        });
        $.get('../api/nav_fenlei.php',function(data){
            data = JSON.parse(data);
            // console.log(data);
            typename_render(data);
        })
    });
    $('.typename').on('mouseover','li',function(){
        let typename = $(this).text();
        $.get('../api/nav_fenlei.php',{typename:typename},function(data){
            data = JSON.parse(data);
            typename_render(data);   
        })
    });
		//跳转
		$('.typelist').on('click',function(){
			location.href ='../html/goodslist.html';
		})
    function typename_render(data){
        $('.typelist').html(function(){
            return data.map(function(item){
                return`<li>
                        <a href="javascript:;">
                            <img src="../${item.imgurl}">
                            <label>${item.name}</label> 
                        </a>
                </li>`
            }).join("");
        })
    };
 // ...........分类菜单栏加载数据结束..........   
	miniCar();
  function miniCar(){
		$div = $('<div/>');
		$div.addClass('fixed-car');
		$div.html(function(){
			return`<ul>
							<li class="minicar"><i class="glyphicon glyphicon-shopping-cart"></i></li>
							<li><i class="glyphicon glyphicon-phone-alt"></i></li>
							<li><i class="glyphicon glyphicon-headphones"></i></li>
							<li class="totop"><i class="glyphicon glyphicon-chevron-up"></i></li>
			</ul>	
			`
		})
		$div.appendTo(document.body);
		$('.totop').on('click',function(){
				let timer=setInterval(function(){
						let curTop=window.scrollY;
						let speed=Math.floor((0-curTop)/10);
						window.scrollBy(0,speed);
						if(window.scrollY==0){
							clearInterval(timer);
						}
				},30)
		})
	}
	
	$('.header-car').on('click',function(){
		location.href="../html/goodscar.html";
	})










// ................底部.........    
})