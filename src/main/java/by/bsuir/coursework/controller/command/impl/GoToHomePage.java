package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Employment;
import by.bsuir.coursework.bean.Schedule;
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
import java.util.List;

public class GoToHomePage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToHomePage.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_home_page");
        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        if (request.getParameter("locale") != null) {
            session.setAttribute("locale", request.getParameter("locale"));
        }
        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();

        try {
            List<Vacancy> vacancies = vacancyService.getAll();
            List<Schedule> scheduleList = vacancyService.getSchedules();
            List<Employment> employmentList = vacancyService.getEmployments();
            session.setAttribute("vacanciesList", vacancies);
            session.setAttribute("scheduleList", scheduleList);
            session.setAttribute("employmentList", employmentList);
//            session.removeAttribute("searchAdsList");
//            session.removeAttribute("searchAd");
//            session.removeAttribute("filterClothesType");
//            session.removeAttribute("filterAdsList");
        } catch (ServiceException e) {
            userLogger.error(e);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
        requestDispatcher.forward(request, response);
    }
}
