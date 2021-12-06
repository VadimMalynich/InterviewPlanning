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

public class AddPlatform implements Command {
    private static final Logger userLogger = LogManager.getLogger(AddPlatform.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name =request.getParameter("addPlatform");

        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();

        Platforms platforms = new Platforms(name);

        try {
            platformService.add(platforms);
            response.sendRedirect("Controller?command=go_to_platforms_page&message=message.addPlatform.complete");
        } catch (ServiceException e) {
            userLogger.info(e);
            response.sendRedirect("Controller?command=go_to_platforms_page&message=message.add.unsuccessfully");
        }
    }
}
