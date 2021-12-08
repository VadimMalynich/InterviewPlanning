package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Interview;
import by.bsuir.coursework.bean.User;
import by.bsuir.coursework.bean.Vacancy;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.dao.InterviewDao;
import by.bsuir.coursework.service.InterviewService;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.ServiceProvider;
import by.bsuir.coursework.service.VacancyService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

public class AddInterview implements Command {
    private static final Logger userLogger = LogManager.getLogger(AddInterview.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Integer vacancyId = (Integer) session.getAttribute("vacancyId");

        String addTopic = request.getParameter("addTopic");
        Date addDate = Date.valueOf(request.getParameter("addDate"));
        String tempTime = request.getParameter("addStartTime") + ":00";
        Time addStartTime = Time.valueOf(tempTime);
        tempTime = request.getParameter("addEndTime") + ":00";
        Time addEndTime = Time.valueOf(tempTime);
        Integer addPlatform = Integer.valueOf(request.getParameter("addPlatform"));

        Interview interview = new Interview(vacancyId, user, addTopic, addDate, addStartTime, addEndTime, addPlatform);

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();

        try {
            interviewService.add(interview);
            session.removeAttribute("platformsList");
            session.removeAttribute("vacancyId");
            response.sendRedirect("Controller?command=go_to_home_page&message=message.addInterview.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_add_interview_page&message=message.add.unsuccessfully");
        }
    }
}
