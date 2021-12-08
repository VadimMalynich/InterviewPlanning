package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Vacancy;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.VacancyService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditVacancy implements Command {
    private static final Logger userLogger = LogManager.getLogger(EditVacancy.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String editTopic = request.getParameter("editTopic");
        String editExperience = request.getParameter("editExperience");
        Integer editEmployment = Integer.valueOf(request.getParameter("editEmployment"));
        Integer editSchedule = Integer.valueOf(request.getParameter("editSchedule"));
        String editDescription = request.getParameter("editDescription");
        String editRequirements = request.getParameter("editRequirements");
        String editAdditional = request.getParameter("editAdditional");
        Integer vacancyId = (Integer) session.getAttribute("editVacancyId");

        Vacancy vacancy = new Vacancy(vacancyId ,editTopic, editExperience, editEmployment, editSchedule, editDescription,
                editRequirements, editAdditional);

        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();

        try {
            vacancyService.edit(vacancy);
            session.removeAttribute("editVacancy");
            session.removeAttribute("editVacancyId");
            response.sendRedirect("Controller?command=go_to_home_page&message=message.editVacancy.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_edit_vacancy_page&message=message.edit.unsuccessfully");
        }
    }
}
