package by.bsuir.coursework.controller.command.impl;

import by.bsuir.coursework.bean.Platforms;
import by.bsuir.coursework.controller.command.Command;
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

public class GoToAddInterviewPage implements Command {
    private static final Logger userLogger = LogManager.getLogger(GoToAddInterviewPage.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("page", "Controller?command=go_to_add_interview_page");

        if (request.getParameter("message") != null) {
            request.setAttribute("message", request.getParameter("message"));
        }
        if (request.getParameter("vacancyId") != null) {
            session.setAttribute("vacancyId", Integer.valueOf(request.getParameter("vacancyId")));
        }

        PlatformService platformService = ServiceProvider.getInstance().getPlatformService();

        try {
            List<Platforms> platformsList = platformService.getAll();
            session.setAttribute("platformsList", platformsList);
        } catch (ServiceException e) {
            userLogger.error(e);
        }


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/addInterviewPage.jsp");
        requestDispatcher.forward(request, response);
    }
}
