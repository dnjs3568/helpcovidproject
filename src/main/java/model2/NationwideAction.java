package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.HealthCenterDAO;
import model1.HealthCenterTO;

public class NationwideAction {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("NationwideAction 호출");
		
		ArrayList<HealthCenterTO> centerLists = new ArrayList<HealthCenterTO>();

		HealthCenterDAO dao = new HealthCenterDAO();
		centerLists = dao.centerList();
		
		request.setAttribute("centerLists", centerLists);
	}
	
}
