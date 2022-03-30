package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model1.UserDAO;
import model1.UserTO;

public class UserDeleteAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserDeleteAction 호출");
	}
	
}
