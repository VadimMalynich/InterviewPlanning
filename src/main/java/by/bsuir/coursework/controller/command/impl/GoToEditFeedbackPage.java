package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Feedback;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.FeedbackService;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class GoToEditFeedbackPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToEditFeedbackPage.class);
    private static final String INTERVIEW_ID = "interviewId";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_edit_feedback_page");

        if (request.getParameter(INTERVIEW_ID) != null) {
            session.setAttribute(INTERVIEW_ID, Integer.valueOf(request.getParameter(INTERVIEW_ID)));
        }

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        Integer interviewId = (Integer) session.getAttribute(INTERVIEW_ID);

        FeedbackService feedbackService = ServiceProvider.getInstance().getFeedbackService();

        try {
            Feedback feedback = feedbackService.getInterviewFeedback(interviewId);
            session.setAttribute("editFeedback", feedback);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/editFeedbackPage.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_interviewer_feedbacks_page&message=message.error.server");
        }
    }
}
