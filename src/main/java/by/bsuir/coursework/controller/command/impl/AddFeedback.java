package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Feedback;
import by.bsuir.coursework.bean.User;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.FeedbackService;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddFeedback implements Command {
    private static final Logger userLogger = LogManager.getLogger(AddFeedback.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Integer interviewId = (Integer) session.getAttribute("interviewId");

        String addTopic = request.getParameter("addReview");
        Byte addMark = Byte.valueOf(request.getParameter("addMark"));
        Boolean addRespond = Boolean.valueOf(request.getParameter("addRespond"));

        Feedback feedback = new Feedback(interviewId, user, addTopic, addRespond, addMark);

        FeedbackService feedbackService = ServiceProvider.getInstance().getFeedbackService();

        try {
            feedbackService.add(feedback);
            session.removeAttribute("interviewsList");
            session.removeAttribute("interviewId");
            response.sendRedirect("Controller?command=go_to_interviewer_feedbacks_page&message=message.addFeedback.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_add_feedback_page&message=message.add.unsuccessfully");
        }
    }
}
