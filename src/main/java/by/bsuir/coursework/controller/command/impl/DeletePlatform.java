package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.PlatformService;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeletePlatform implements Command {
    private static final Logger userLogger = LogManager.getLogger(DeletePlatform.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("deletePlatformId"));

        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();

        try {
            platformService.delete(id);
            response.sendRedirect("Controller?command=go_to_platforms_page&message=message.deletePlatform.complete");
        } catch (ServiceException e) {
            userLogger.info(e);
            response.sendRedirect("Controller?command=go_to_platforms_page&message=message.deletePlatform.unsuccessfully");
        }
    }
}
