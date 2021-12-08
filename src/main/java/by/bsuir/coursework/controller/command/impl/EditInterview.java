package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Interview;
import by.bsuir.coursework.bean.Vacancy;
import by.bsuir.coursework.controller.command.Command;
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

public class EditInterview implements Command {
    private static final Logger userLogger = LogManager.getLogger(EditInterview.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String editTopic = request.getParameter("editTopic");
        Date editDate = Date.valueOf(request.getParameter("editDate"));
        String tempTime = request.getParameter("editStartTime");
        if (tempTime.lastIndexOf(":") == 2) {
            tempTime += ":00";
        }
        Time editStartTime = Time.valueOf(tempTime);
        tempTime = request.getParameter("editEndTime");
        if (tempTime.lastIndexOf(":") == 2) {
            tempTime += ":00";
        }
        Time editEndTime = Time.valueOf(tempTime);
        Integer editPlatform = Integer.valueOf(request.getParameter("editPlatform"));
        Interview prevInterview = (Interview) session.getAttribute("editInterview");

        Interview interview = new Interview(prevInterview.getId(), prevInterview.getVacancy().getId(),
                prevInterview.getUser(), editTopic, editDate, editStartTime, editEndTime, editPlatform);

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();

        try {
            interviewService.edit(interview);
            session.removeAttribute("editInterview");
            session.removeAttribute("editInterviewId");
            response.sendRedirect("Controller?command=go_to_profile_page&message=message.editInterview.complete");
        } catch (ServiceException e) {
            userLogger.error(e);
            response.sendRedirect("Controller?command=go_to_edit_interview_page&message=message.edit.unsuccessfully");
        }
    }
}
