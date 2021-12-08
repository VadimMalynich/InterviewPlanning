package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.*;
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

public class SearchInterviews implements Command {
    private static final Logger userLogger = LogManager.getLogger(SearchInterviews.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        session.setAttribute("page", "Controller?command=search_interviews");
        String searchRequest = request.getParameter("searchInterviews");

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();
        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();

        try {
            List<Interview> searchInterviewsList = interviewService.searchInterviews(searchRequest, user.getId());
            List<Platforms> platformsList = platformService.getAll();
            session.setAttribute("searchInterview", searchRequest);
            session.setAttribute("searchInterviewsList", searchInterviewsList);
            session.setAttribute("platformsList", platformsList);
            session.removeAttribute("interviewsList");
            session.removeAttribute("filterInterviewsList");
            session.removeAttribute("filterPlatform");
        } catch (ServiceException e) {
            userLogger.error(e);
        }

        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userProfile.jsp");
        requestDispatcher.forward(request, response);
    }
}
