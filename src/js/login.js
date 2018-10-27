
jQuery(function(){
    $name = $("#username");
    $psw  = $("#password");
    $code = $('#code');
    $nametips =$('.name-tips');
    $codetips =$('.code-tips');
    $pswtips =$('.psw-tips');
    $getcode = $code.next();

    $getcode.on('click',function(){
        let num = getRandomNum(1000,9999);
        $(this).html(num);
    });
    $('.login-btn').on('click',function(){
        let name =$name.val();
        let psw  =$psw.val();
        let code =$code.val();
        let reg = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;
        if(!reg.test(name)){
            $nametips.html('手机号格式不正确!');
            return ;
        };
        $nametips.html('');
        if(code != $getcode.html()){
            $codetips.html('请输入正确的验证码!');
            return;
        }
        $codetips.html("");
        if((psw.trim()).length == 0){
            $pswtips.html('密码不能为空哦!');
            return;
        }
        $pswtips.html('');
        $.get('../api/login.php',{uname:name,psw:psw},function(data){
            if(data == "no"){
                $nametips.html('该手机号还没注册!');
            };
            if(data =="false"){
                $pswtips.html('密码不正确哦!');
            }
            if(data == "true"){
                //设置登录名cookie
                Cookie.setCookie("login_name",name,"","/")

                alert("登陆成功,去首页看一看吧!");
                location.href = '../index.html';
            }
        })

    })




    // .................底部.......
})