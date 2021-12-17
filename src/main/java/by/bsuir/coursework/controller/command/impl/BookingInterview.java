package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.User;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.InterviewService;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BookingInterview implements Command {
    private static final Logger userLogger = LogManager.getLogger(BookingInterview.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Integer vacancyId = (Integer) session.getAttribute("vacancyId");
        Integer interviewId = Integer.valueOf(request.getParameter("interviewId"));

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();

        try {
            interviewService.bookingInterview(interviewId, user.getId());
            response.sendRedirect("Controller?command=go_to_interviews_page&vacancyId=" + vacancyId + "&message=message.booking.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_interviews_page&vacancyId=" + vacancyId + "&message=message.booking.unsuccessfully");
        }
    }
}
