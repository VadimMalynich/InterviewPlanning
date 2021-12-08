package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.VacancyService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteVacancy implements Command {
    private static final Logger userLogger = LogManager.getLogger(DeleteVacancy.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer integer = Integer.valueOf(request.getParameter("deleteVacancyId"));

        VacancyService vacancyService = ServiceProvider.getInstance().getVacancyService();

        try {
            vacancyService.delete(integer);
            response.sendRedirect("Controller?command=go_to_home_page&message=message.deleteVacancy.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_home_page&message=message.delete.unsuccessfully");
        }
    }
}
