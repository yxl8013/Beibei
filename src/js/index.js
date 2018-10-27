jQuery(function($){
    //轮播图开始.......初始化..//
    $lis = $(".banner-item");
    $len = $lis.length;
    var idx =0;
    $lis.eq(idx).css('opacity',1).siblings('').css('opacity',0);
    var move =()=>{
        setInterval(function(){
            idx ++ ;
            showPic();
        },3600)
    } 
    move();
    var showPic = ()=>{
         if(idx > $len-1){
            idx = 0;
        }else if(idx < 0){
            idx = $len-1;
        }
        $lis.eq(idx).animate({'opacity':1},2000).siblings().animate({'opacity':0},2000);
    }    

// ................结束...
    //加载 随机商品
    $.get('../api/index_goods.php',function(data){
        data = JSON.parse(data);
        render(data);
    })
    var $goodslist=$('.goodslist');
    function render(data){
        let res = data.map(function(item){
            return `<li data-id="${item.id}">
                    <a href="javascript:;">
                        <img src="../${item.imgurl}" />
                        <p>${item.name}</p>
                        <div>
                            <span>¥ ${(item.price*item.zhekou/10).toFixed(2)}</span>
                            <span>¥ ${item.price}</span>
                            <span> ${item.zhekou}折</span>
                        </div>
                    </a>
                </li>`
        }).join("");
        $goodslist.html(res);
    }

    //右侧热卖推荐.....
    $.get('../api/index_hot.php',function(data){
            data = JSON.parse(data);
            hot_render(data);
        });
    $('.tab').on('mouseover','li',function(){
        let typename = $(this).text();
        $.get('../api/index_hot.php',{typename:typename},function(data){
            data = JSON.parse(data);
            hot_render(data);
        })

    })
    function hot_render(data){
        let res = data.map(function(item){
            return `<li data-id=${item.id}>
                        <a href="javascript:;">
                            <img src="../${item.imgurl}"  alt="热卖推荐" />
                            <div>
                                <p>${item.name}</p>
                                <p><span>¥ ${(item.price*item.zhekou/10).toFixed(2)}</span><i>¥ ${item.price}</i></p>  
                            </div>  
                        </a>
                    </li>`
        }).join('');
        $('.hot-show').html(res);
    }
	//点击nav-bottom向列表页传递类型
	let $types = $('#nav-bottom').find('a').slice(0,9);
	$types.on('click',function(){
		let type = $(this).html();
		let str = "type="+type;
		str = encodeURI(str);
		// console.log(str);
		location.href ='../html/goodslist?'+str;
	});

	//点击首页商品到详情页
	$('.goodslist').on('click','li',function(){
		let id =$(this)[0].dataset.id;
		location.href = '../html/goodsdetail.html?id='+id;
	});
	//右侧热卖点击
	$('.hot-show').on('click','li',function(){
		let id =$(this)[0].dataset.id;
		location.href = '../html/goodsdetail.html?id='+id;
	});
	// ...............跳转结束....................

















// ........底部........
})