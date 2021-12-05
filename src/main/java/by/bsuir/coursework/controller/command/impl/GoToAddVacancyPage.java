package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.controller.command.Command;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class GoToAddVacancyPage implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_add_vacancy_page");

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/addVacancyPage.jsp");
        requestDispatcher.forward(request, response);
    }
}
