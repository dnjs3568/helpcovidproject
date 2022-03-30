package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteAction1 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("WriteAction1 호출");
	}

}
