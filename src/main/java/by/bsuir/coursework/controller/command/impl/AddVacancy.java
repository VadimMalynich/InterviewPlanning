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

public class AddVacancy implements Command {
    private static final Logger userLogger = LogManager.getLogger(AddVacancy.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String addTopic = request.getParameter("addTopic");
        String addExperience = request.getParameter("addExperience");
        Integer addEmployment = Integer.valueOf(request.getParameter("addEmployment"));
        Integer addSchedule = Integer.valueOf(request.getParameter("addSchedule"));
        String addDescription = request.getParameter("addDescription");
        String addRequirements = request.getParameter("addRequirements");
        String addAdditional = request.getParameter("addAdditional");

        Vacancy vacancy = new Vacancy(addTopic, addExperience, addEmployment, addSchedule, addDescription,
                addRequirements, addAdditional);

        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();

        try {
            vacancyService.add(vacancy);
            response.sendRedirect("Controller?command=go_to_home_page&message=message.addVacancy.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_add_ad_page&message=message.add.unsuccessfully");
        }
    }
}
