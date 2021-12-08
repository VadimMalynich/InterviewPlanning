package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.User;
import by.bsuir.coursework.bean.UserRole;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditUser implements Command {
    private static final Logger userLogger = LogManager.getLogger(EditUser.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User previousUser = (User) session.getAttribute("editUser");
        User sessionUser = (User) session.getAttribute("user");

        previousUser.setName(request.getParameter("editName"));
        if (request.getParameter("editRole") != null) {
            previousUser.setRole(UserRole.getByCode(Integer.valueOf(request.getParameter("editRole"))));
        }

        UserService userService = ServiceProvider.getInstance().getUserService();

        if (!"".equals(request.getParameter("editOldPassword")) && !"".equals(request.getParameter("editNewPassword"))) {
            String oldPass = request.getParameter("editOldPassword");
            String newPass = request.getParameter("editNewPassword");
            try {
                userService.edit(previousUser, oldPass, newPass);
            } catch (ServiceException e) {
                userLogger.info(e);
                if ("Entered wrong old password".equals(e.getMessage())) {
                    response.sendRedirect("Controller?command=go_to_edit_user_page&message.editUser.unsuccessfully");
                } else {
                    response.sendRedirect("Controller?command=go_to_edit_user_page&message=message.edit.unsuccessfully");
                }
            }
        } else {
            try {
                userService.edit(previousUser);
            } catch (ServiceException e) {
                userLogger.error(e);
                response.sendRedirect("Controller?command=go_to_edit_user_page&message=message.edit.unsuccessfully");
            }
        }
        session.removeAttribute("citiesList");
        session.removeAttribute("editUser");
        session.removeAttribute("userId");
        if (sessionUser.getRole().getValue() == 0) {
            response.sendRedirect("Controller?command=go_to_users_page&message=message.editUser.complete");
        } else {
            try {
                User user = userService.getUser(sessionUser.getId());
                session.setAttribute("user", user);
            } catch (ServiceException e) {
                userLogger.error(e);
            }
            response.sendRedirect("Controller?command=go_to_home_page&message=message.editUser.complete");
        }
    }
}
