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

public class FilterVacanciesBySchedule implements Command {
    private static final Logger userLogger = LogManager.getLogger(FilterVacanciesBySchedule.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Integer typeId = Integer.valueOf(request.getParameter("filterIdType"));
        session.setAttribute("page", "Controller?command=filter_vacancies_by_schedule&filterIdType=" + typeId);

        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();

        try {
            List<Vacancy> vacancies = vacancyService.filterBySchedule(typeId);
            List<Schedule> scheduleList = vacancyService.getSchedules();
            List<Employment> employmentList = vacancyService.getEmployments();
            String scheduleType = scheduleList.get(typeId-1).getTimetable();
            session.setAttribute("filterByScheduleList", vacancies);
            session.setAttribute("scheduleList", scheduleList);
            session.setAttribute("employmentList", employmentList);
            session.setAttribute("filterSchedule", scheduleType);
            session.removeAttribute("vacanciesList");
            session.removeAttribute("searchVacanciesList");
            session.removeAttribute("searchVacancy");
            session.removeAttribute("filterByEmploymentList");
            session.removeAttribute("filterEmployment");
        } catch (ServiceException e) {
            userLogger.error(e);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
        requestDispatcher.forward(request, response);
    }
}
