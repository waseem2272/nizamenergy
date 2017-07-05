package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;

import bal.AndroidBal;

@WebServlet("/FoVarificationListController")
public class FoVarificationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(FoVarificationListController.class);

	public FoVarificationListController() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String action = request.getParameter("action");
			String userIdString = request.getParameter("userId");
			String userType = request.getParameter("userType");
			JSONObject json = new JSONObject();
			String status = "", message = "";
			if (action != null && !action.isEmpty()
					&& action.equals("varificationList")) {
				if (userIdString != null && !userIdString.equals("0")) {
					int userId = Integer.parseInt(userIdString);
					if (userType.equals("FO")) {
						status = "ok";
						
						// for verifies data
						json.put("verifies", AndroidBal.getAllAcceptedEligibilityByFO(userId));

					} else {
						status = "error";
						message = "userType not defined";
					}
				} else {
					status = "error";
					message = "userId not defined";
				}
			} else {
				status = "error";
				message = "action not defined";
			}
			json.put("status", status);
			json.put("message", message);
			out.print(json);
		} catch (JSONException e) {
			logger.error(e);
			e.printStackTrace();
		}
	}

}
