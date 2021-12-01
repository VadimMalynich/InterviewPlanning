package by.bsuir.coursework.service;

import by.bsuir.coursework.service.impl.*;

public final class ServiceProvider {

    private static final ServiceProvider instance = new ServiceProvider();

    private ServiceProvider() {
    }

    private final FeedbackService feedbackService = new FeedbackServiceImpl();
    private final InterviewService interviewService = new InterviewServiceImpl();
    private final PlatformService platformService = new PlatformServiceImpl();
    private final UserService userService = new UserServiceImpl();
    private final VacancyService vacancyService = new VacancyServiceImpl();


    public static ServiceProvider getInstance() {
        return instance;
    }

    public FeedbackService getFeedbackService() {
        return feedbackService;
    }

    public InterviewService getInterviewService() {
        return interviewService;
    }

    public PlatformService getPlatformService() {
        return platformService;
    }

    public UserService getUserService() {
        return userService;
    }

    public VacancyService getVacancyService() {
        return vacancyService;
    }
}