/**
 * Created by danr on 2016/11/29.
 */
//    搜索框的隐藏和显示


$('a[data-toggle="tab"]').hover(function(){
    $(this).tab('show');
});


$(function(){
    function footerPosition(){
        // $("footer").removeClass("fixed-bottom");
        var contentHeight = document.body.clientHeight,//网页正文全文高度
            winHeight = window.innerHeight;//可视窗口高度，不包括浏览器顶部工具栏
        if(!(contentHeight > winHeight)){
            //当网页正文高度小于可视窗口高度时，为footer添加类fixed-bottom
            $("footer").addClass("fixed-bottom");
        } else {
            $("footer").removeClass("fixed-bottom");
        }
    }
    footerPosition();
    $(window).resize(footerPosition);
});

var myToTopToggle = setInterval(ToTopToggle, 50);//控制显示
var myBackTop;//控制返回顶部
var toTopFlag = true;
var scrollTop;//滚动条距离顶部的距离

//显示或隐藏返回顶部按钮
function ToTopToggle() {
    //兼容各大浏览器
    scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
    if (scrollTop <= 200) {
        document.getElementById("scroll").style.display = "none";
    }
    else {
        document.getElementById("scroll").style.display = "block";
    }
}

//设置平滑滚动到顶部的触发器
function IntervalBackTop() {
    if (toTopFlag) {
        toTopFlag = false;
        myBackTop = setInterval(ScrollBackTop, 50);
    }
}

//平滑滚动到顶部
function ScrollBackTop() {
    scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
    if (scrollTop <= 20) {
        clearInterval(myBackTop);
        if (document.body.scrollTop != 0) {
            document.body.scrollTop = 0;
        }
        else if (document.documentElement.scrollTop != 0) {
            document.documentElement.scrollTop = 0;
        }
        else {
            window.pageYOffset = 0;
        }
        toTopFlag = true;
    }
    else {
        if (document.body.scrollTop != 0) {
            document.body.scrollTop = document.body.scrollTop - 100;
        }
        else if (document.documentElement.scrollTop != 0) {
            document.documentElement.scrollTop = document.documentElement.scrollTop - 100;
        }
        else {
            window.pageYOffset = window.pageYOffset - 100;
        }

    }
}

//顶部缩小后点击，菜单消失
/*$("#navbar-collapse").blur(function () {
     setTimeout(function () {
     $("#nav-container").collapse('hide');
     }, 100);
 });*/


