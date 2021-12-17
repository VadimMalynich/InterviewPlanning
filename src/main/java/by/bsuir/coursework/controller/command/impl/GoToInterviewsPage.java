package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Interview;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class GoToInterviewsPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToInterviewsPage.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (request.getParameter("vacancyId") != null) {
            session.setAttribute("vacancyId", Integer.valueOf(request.getParameter("vacancyId")));
        }

        session.setAttribute("page", "Controller?command=go_to_interviews_page");
        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        Integer integer = (Integer) session.getAttribute("vacancyId");

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();

        try {
            List<Interview> interviewList = interviewService.getVacancyInterviews(integer);
            if (interviewList.isEmpty()) {
                response.sendRedirect("Controller?command=go_to_home_page&message=message.error.openInterviews");
            } else {
                session.setAttribute("interviewsList", interviewList);
                session.removeAttribute("searchInterview");
                session.removeAttribute("searchInterviewsList");
                session.removeAttribute("filterInterviewsList");
                session.removeAttribute("filterPlatform");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/interviewsPage.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_home_page&message=message.error.server");
        }
    }
}
