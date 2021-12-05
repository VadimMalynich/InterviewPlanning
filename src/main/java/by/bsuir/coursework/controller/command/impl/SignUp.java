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

public class SignUp implements Command {
    private static final Logger userLogger = LogManager.getLogger(SignUp.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("citiesList");
        String login = request.getParameter("signUpLogin");
        String password = request.getParameter("signUpPassword");
        String confirmPassword = request.getParameter("signUpConfirmPassword");
        String name = request.getParameter("signUpName");

        User user = new User(login, password, name);

        UserService userService = ServiceProvider.getInstance().getUserService();

        try {
            userService.registration(user, confirmPassword);
            session.removeAttribute("citiesList");
            response.sendRedirect("Controller?command=go_to_home_page&message=message.signUp.complete");
        } catch (ServiceException e) {
            userLogger.info(e);
            response.sendRedirect("Controller?command=go_to_sign_up_page&message=message.error.signUp");
        }
    }
}
