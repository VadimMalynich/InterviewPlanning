package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Interview;
import by.bsuir.coursework.bean.Platforms;
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

public class GoToEditInterviewPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToEditInterviewPage.class);
    private static final String EDIT_INTERVIEW_ID = "editInterviewId";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_edit_interview_page");

        if (request.getParameter(EDIT_INTERVIEW_ID) != null) {
            session.setAttribute(EDIT_INTERVIEW_ID, Integer.valueOf(request.getParameter(EDIT_INTERVIEW_ID)));
        }

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        Integer editInterviewId = (Integer) session.getAttribute(EDIT_INTERVIEW_ID);

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();
        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();
        try {
            Interview interview = interviewService.getInterview(editInterviewId);
            List<Platforms> platformsList = platformService.getAll();
            session.setAttribute("editInterview", interview);
            session.setAttribute("platformsList", platformsList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/editInterviewPage.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_profile_page&message=message.error.server");
        }
    }
}
