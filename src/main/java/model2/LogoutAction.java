package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LogoutAction 호출");
	}
	
}
