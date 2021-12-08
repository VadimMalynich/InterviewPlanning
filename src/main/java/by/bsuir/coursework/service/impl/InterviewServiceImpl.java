package by.bsuir.coursework.service.impl;

import by.bsuir.coursework.bean.Interview;
import by.bsuir.coursework.dao.*;
import by.bsuir.coursework.dao.utilities.SessionUtil;
import by.bsuir.coursework.service.InterviewService;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.validation.InterviewValidator;

import java.sql.Time;
import java.util.List;

public class InterviewServiceImpl extends SessionUtil implements InterviewService {
    private static final String WRONG_ID = "Wrong id";
    private static final Long HOUR = 3600000L;

    @Override
    public List<Interview> getAll() throws ServiceException {
        List<Interview> list;
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            list = interviewDao.getAll();
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }

    @Override
    public void delete(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException("Wrong id for delete interview");
        }
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            interviewDao.delete(id);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void add(Interview interview) throws ServiceException {
        if (interview == null) {
            throw new ServiceException("No info about interview");
        }
        validateData(interview);
        if (interview.getEndTime() == null) {
            interview.setEndTime(new Time(interview.getStartTime().getTime() + HOUR));
        }
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            interviewDao.add(interview);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void edit(Interview interview) throws ServiceException {
        if (interview == null) {
            throw new ServiceException("No info about interview");
        }
        validateData(interview);
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        if (interview.getEndTime() == null) {
            interview.setEndTime(new Time(interview.getStartTime().getTime() + HOUR));
        }
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            interviewDao.edit(interview);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public Interview getInterview(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException(WRONG_ID);
        }
        Interview interview;
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            interview = interviewDao.getInterview(id);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return interview;
    }

    @Override
    public List<Interview> getVacancyInterviews(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException(WRONG_ID);
        }
        List<Interview> list;
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            list = interviewDao.getVacancyInterviews(id);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }

    @Override
    public List<Interview> getUserInterviews(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException(WRONG_ID);
        }
        List<Interview> list;
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            list = interviewDao.getUserInterviews(id);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }

    @Override
    public List<Interview> getUserVacancyInterviews(Integer userId, Integer vacancyId) throws ServiceException {
        if (userId == null || vacancyId == null) {
            throw new ServiceException(WRONG_ID);
        }
        List<Interview> list;
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            list = interviewDao.getUserVacancyInterviews(userId, vacancyId);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }


    @Override
    public List<Interview> getHappened() throws ServiceException {
        List<Interview> list;
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            list = interviewDao.getHappened();
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }

    @Override
    public List<Interview> searchInterviews(String text, Integer userId) throws ServiceException {
        if (text == null || "".equals(text)) {
            throw new ServiceException("Wrong search text");
        }
        if (userId == null) {
            throw new ServiceException(WRONG_ID);
        }
        List<Interview> list;
        text = "%" + text + "%";
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            list = interviewDao.searchInterviews(text, userId);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }

    @Override
    public List<Interview> filterInterviews(Integer platformId, Integer userId) throws ServiceException {
        if (platformId == null || userId ==null) {
            throw new ServiceException(WRONG_ID);
        }
        List<Interview> list;
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            interviewDao.setSession(getSession());
            list = interviewDao.filterInterviews(platformId, userId);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }

    private void validateData(Interview interview) throws ServiceException {
        if (!InterviewValidator.validateTopic(interview.getTopic())) {
            throw new ServiceException("Wrong topic");
        }
        if (!InterviewValidator.validateDate(interview.getDate(), interview.getStartTime(), interview.getEndTime())) {
            throw new ServiceException("Wrong date");
        }
    }
}
