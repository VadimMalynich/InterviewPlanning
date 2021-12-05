package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Vacancy;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.VacancyService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class GoToVacancyPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToVacancyPage.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_ad_page&adIdInfo=" + request.getParameter("adIdInfo"));
        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        Integer integer = Integer.valueOf(request.getParameter("vacancyId"));

        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();

        try {
            Vacancy vacancy = vacancyService.getVacancy(integer);
            if (vacancy == null) {
                response.sendRedirect("Controller?command=go_to_home_page&message=message.error.openAd");
            } else {
                session.setAttribute("vacancyPageInfo", vacancy);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/vacancyPage.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_home_page&message=message.error.server");
        }
    }
}
