package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Platforms;
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

public class EditPlatform implements Command {
    private static final Logger userLogger = LogManager.getLogger(EditPlatform.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("platformId"));
        String name = request.getParameter("editPlatform");

        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();
        Platforms platforms = new Platforms(id, name);

        try {
            platformService.edit(platforms);
            response.sendRedirect("Controller?command=go_to_types_page&message=message.editPlatform.complete");
        } catch (ServiceException e) {
            userLogger.info(e);
            response.sendRedirect("Controller?command=go_to_types_page&message=message.edit.unsuccessfully");
        }
    }
}
