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
import java.util.List;

public class GoToFeedbacksPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToFeedbacksPage.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_feedbacks_page");

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }

        FeedbackService feedbackService = ServiceProvider.getInstance().getFeedbackService();

        try {
            List<Feedback> feedbacks = feedbackService.getAll();
            session.setAttribute("feedbackList", feedbacks);
        } catch (ServiceException e) {
            userLogger.error(e);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/feedbacksPage.jsp");
        requestDispatcher.forward(request, response);
    }
}
