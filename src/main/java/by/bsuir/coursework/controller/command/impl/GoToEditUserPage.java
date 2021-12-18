package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.User;
import by.bsuir.coursework.bean.Vacancy;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.UserService;
import by.bsuir.coursework.service.VacancyService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class GoToEditUserPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToEditUserPage.class);
    private static final String USER_ID = "userId";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_edit_user_page");
        User user = (User) session.getAttribute("user");
        if (request.getParameter(USER_ID) != null) {
            session.setAttribute(USER_ID, Integer.valueOf(request.getParameter(USER_ID)));
        }

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        Integer userId = (Integer) session.getAttribute(USER_ID);

        UserService userService = ServiceProvider.getInstance().getUserService();
        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();

        try {
            User editUser = userService.getUser(userId);
            session.setAttribute("editUser", editUser);
            if(user.getRole().getValue() == 3){
                List<Vacancy> list = vacancyService.getAll();
                session.setAttribute("vacanciesList", list);
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/editUserPage.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_users_page&message=message.error.server");
        }
    }
}
