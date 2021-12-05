package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteUser implements Command {
    private static final Logger userLogger = LogManager.getLogger(DeleteUser.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.valueOf(request.getParameter("deleteUserId"));

        UserService userService = ServiceProvider.getInstance().getUserService();

        try {
            userService.delete(id);
            response.sendRedirect("Controller?command=go_to_users_page&message=message.deleteUser.complete");
        } catch (ServiceException e) {
            userLogger.info(e);
            response.sendRedirect("Controller?command=go_to_users_page&message=message.deleteUser.unsuccessfully");
        }
    }
}
