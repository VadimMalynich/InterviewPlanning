package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.User;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SignIn implements Command {
	private static final Logger userLogger = LogManager.getLogger(SignIn.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String login = request.getParameter("login");
		String password = request.getParameter("password");

		UserService userService = ServiceProvider.getInstance().getUserService();

		User user;
		try {
			user = userService.authorization(login, password);
			if (user == null) {
				response.sendRedirect("Controller?command=go_to_sign_in_page&message=message.signIn.incorrect");
				return;
			}
			session.setAttribute("user", user);
			response.sendRedirect("Controller?command=go_to_home_page&message=message.signIn.complete");
		} catch (ServiceException e) {
			userLogger.info(e);
			response.sendRedirect("Controller?command=go_to_sign_in_page&message=message.signIn.incorrect");
		}
	}
}
