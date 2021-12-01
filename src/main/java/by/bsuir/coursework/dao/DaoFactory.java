package by.bsuir.coursework.dao;

public class DaoFactory {
    private static final DaoFactory instance = new DaoFactory();
    private final FeedbackDao feedbackDao = new FeedbackDao();
    private final InterviewDao interviewDao = new InterviewDao();
    private final PlatformsDao platformsDao = new PlatformsDao();
    private final UserDao userDao = new UserDao();
    private final VacancyDao vacancyDao = new VacancyDao();

    private DaoFactory() {
    }

    public static DaoFactory getInstance() {
        return instance;
    }

    public FeedbackDao getFeedbackDao() {
        return feedbackDao;
    }

    public InterviewDao getInterviewDao() {
        return interviewDao;
    }

    public PlatformsDao getPlatformsDao() {
        return platformsDao;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public VacancyDao getVacancyDao() {
        return vacancyDao;
    }
}
