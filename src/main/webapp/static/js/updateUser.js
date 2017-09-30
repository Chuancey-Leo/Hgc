function update()
{
	var userName=document.getElementById("user").value;  
    var pwd=document.getElementById("mypwd").value;  
    var repwd=document.getElementById("remypwd").value;
    
    var matchResult=true; 
    if (userName == "" || pwd == "" || repwd == "") {
    	sweetAlert("请确认是否有空缺项！");
		matchResult = false;
	} else if (userName.length < 0 || userName.length > 20) {
		sweetAlert("用户名长度应在1到20个字符之间！");
		matchResult = false;
	} else if (pwd.length < 0 || pwd.length > 20 || repwd.length < 0 || repwd.length > 20) {
		sweetAlert("密码或重复密码长度应在1到20个字符之间！");
		matchResult = false;
	} else if (pwd != repwd) {
		sweetAlert("密码和重复密码不同，请重新输入！！");
		matchResult = false;
	}
	return matchResult;
}

