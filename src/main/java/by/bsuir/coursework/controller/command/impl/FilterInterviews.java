package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.*;
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

public class FilterInterviews implements Command {
    private static final Logger userLogger = LogManager.getLogger(FilterInterviews.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Integer typeId = Integer.valueOf(request.getParameter("filterIdType"));
        session.setAttribute("page", "Controller?command=filter_interviews&filterIdType=" + typeId);

        InterviewService interviewService = ServiceProvider.getInstance().getInterviewService();
        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();

        try {
            List<Interview> interviewList = interviewService.filterInterviews(typeId, user.getId());
            List<Platforms> platformsList = platformService.getAll();
            String platformName = platformsList.get(typeId - 1).getName();

            session.setAttribute("filterInterviewsList", interviewList);
            session.setAttribute("filterPlatform", platformName);
            session.setAttribute("platformsList", platformsList);
            session.removeAttribute("interviewsList");
            session.removeAttribute("searchInterview");
            session.removeAttribute("searchInterviewsList");
        } catch (ServiceException e) {
            userLogger.error(e);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userProfile.jsp");
        requestDispatcher.forward(request, response);
    }
}
