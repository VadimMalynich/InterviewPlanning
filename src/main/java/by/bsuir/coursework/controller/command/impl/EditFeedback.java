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

public class EditFeedback implements Command {
    private static final Logger userLogger = LogManager.getLogger(EditFeedback.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Feedback prevFeedback = (Feedback) session.getAttribute("editFeedback");

        String editReview = request.getParameter("editReview");
        Byte editMark = Byte.valueOf(request.getParameter("editMark"));
        Boolean editRespond = Boolean.valueOf(request.getParameter("editRespond"));

        Feedback feedback = new Feedback(prevFeedback.getId(), prevFeedback.getInterview(), user, editReview, editRespond, editMark);

        FeedbackService feedbackService = ServiceProvider.getInstance().getFeedbackService();

        try {
            feedbackService.edit(feedback);
            session.removeAttribute("interviewsList");
            session.removeAttribute("interviewId");
            session.removeAttribute("editFeedback");
            response.sendRedirect("Controller?command=go_to_interviewer_feedbacks_page&message=message.editFeedback.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_edit_feedback_page&message=message.edit.unsuccessfully");
        }
    }
}
