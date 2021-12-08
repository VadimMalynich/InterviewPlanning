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

public class GoToEditVacancyPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToEditVacancyPage.class);
    private static final String EDIT_VACANCY_ID = "editVacancyId";


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_edit_vacancy_page");

        if (request.getParameter(EDIT_VACANCY_ID) != null) {
            session.setAttribute(EDIT_VACANCY_ID, Integer.valueOf(request.getParameter(EDIT_VACANCY_ID)));
        }

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        Integer editVacancyId = (Integer) session.getAttribute(EDIT_VACANCY_ID);

        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();
        try {
            Vacancy vacancy = vacancyService.getVacancy(editVacancyId);
            session.setAttribute("editVacancy", vacancy);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/editVacancyPage.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_profile_page&message=message.error.server");
        }
    }
}
