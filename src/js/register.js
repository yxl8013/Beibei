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
    // $name.on('focus',function(){
    //     $nametips.html('');
    // })
    $('.regi-btn').on('click',function(){
        let name =$name.val();
        let psw  =$psw.val();
        let code =$code.val();
        let reg = /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/;
        if(!reg.test(name)){
            $nametips.html('请输入正确的手机号!');
            return ;
        };
        $nametips.html('');
        if(code != $getcode.html()){
            $codetips.html('请输入正确的验证码!');
            return;
        }
         $codetips.html("");
        if((psw.trim()).length <= 5){
            $pswtips.html('请输入6-16位贝贝密码!');
            return;
        }
        $pswtips.html('');
        $.get('../api/register.php',{uname:name,psw:psw},function(data){
            if(data =='false'){
                $nametips.html('该手机号已经注册!');
                return;
            };
            if(data == 'true'){
                alert('恭喜您注册成功,马上登陆!');
                location.href=('../html/login.html');
            }
        })



        

    })




// ...............底部.......
})