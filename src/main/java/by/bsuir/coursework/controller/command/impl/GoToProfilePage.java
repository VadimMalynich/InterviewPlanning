package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Interview;
import by.bsuir.coursework.bean.Platforms;
import by.bsuir.coursework.bean.User;
import by.bsuir.coursework.controller.command.Command;
import by.bsuir.coursework.service.InterviewService;
import by.bsuir.coursework.service.PlatformService;
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

public class GoToProfilePage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToProfilePage.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_profile_page");

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }

        User user = (User) session.getAttribute("user");

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();
        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();
        try {
            List<Interview> interviewList = interviewService.getUserInterviews(user.getId());
            List<Platforms> platformsList = platformService.getAll();
            session.setAttribute("interviewsList", interviewList);
            session.setAttribute("platformsList", platformsList);
            session.removeAttribute("searchInterview");
            session.removeAttribute("searchInterviewsList");
            session.removeAttribute("filterInterviewsList");
            session.removeAttribute("filterPlatform");
        } catch (ServiceException e) {
            userLogger.error(e);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userProfile.jsp");
        requestDispatcher.forward(request, response);
    }
}
