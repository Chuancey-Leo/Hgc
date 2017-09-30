package org.wingstudio.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.wingstudio.entity.User;
import org.wingstudio.service.UserService;
import org.wingstudio.util.CryptographyUtil;

import javax.annotation.Resource;


/**
 *
 * @author liao
 *
 */
public class MyRealm extends AuthorizingRealm{

	@Resource
	private UserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
			throws AuthenticationException {
		String userName=(String)token.getPrincipal();
		User user=userService.getByUserName(userName);
		if(user!=null){
			// 当前用户信息存到session中
			SecurityUtils.getSubject().getSession().setAttribute("currentUser", user);
			AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(
					user.getUserName(),user.getPassword(),"liaochuanhu");
			return authcInfo;
		}else {
			return null;
		}
	}
}
