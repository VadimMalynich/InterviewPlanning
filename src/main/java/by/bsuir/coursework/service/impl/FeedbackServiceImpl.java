package by.bsuir.coursework.service.impl;

import by.bsuir.coursework.bean.Feedback;
import by.bsuir.coursework.dao.DaoException;
import by.bsuir.coursework.dao.DaoFactory;
import by.bsuir.coursework.dao.FeedbackDao;
import by.bsuir.coursework.dao.utilities.SessionUtil;
import by.bsuir.coursework.service.FeedbackService;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.validation.FeedbackValidator;

import java.util.List;

public class FeedbackServiceImpl extends SessionUtil implements FeedbackService {
    @Override
    public List<Feedback> getAll() throws ServiceException {
        List<Feedback> list;
        FeedbackDao feedbackDao = DaoFactory.getInstance().getFeedbackDao();
        try {
            openTransactionSession();
            feedbackDao.setSession(getSession());
            list = feedbackDao.getAll();
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
            throw new ServiceException("Wrong id for delete feedback");
        }
        FeedbackDao feedbackDao = DaoFactory.getInstance().getFeedbackDao();
        try {
            openTransactionSession();
            feedbackDao.setSession(getSession());
            feedbackDao.delete(id);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void add(Feedback feedback) throws ServiceException {
        if (feedback == null) {
            throw new ServiceException("No info about feedback");
        }
        validateAddData(feedback);
        FeedbackDao feedbackDao = DaoFactory.getInstance().getFeedbackDao();
        try {
            openTransactionSession();
            feedbackDao.setSession(getSession());
            feedbackDao.add(feedback);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void edit(Feedback feedback) throws ServiceException {
        if (feedback == null) {
            throw new ServiceException("No info about feedback");
        }
        validateEditData(feedback);
        FeedbackDao feedbackDao = DaoFactory.getInstance().getFeedbackDao();
        try {
            openTransactionSession();
            feedbackDao.setSession(getSession());
            feedbackDao.edit(feedback);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public List<Feedback> getUserFeedbacks(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException("Wrong id for get user feedbacks");
        }
        List<Feedback> list;
        FeedbackDao feedbackDao = DaoFactory.getInstance().getFeedbackDao();
        try {
            openTransactionSession();
            feedbackDao.setSession(getSession());
            list = feedbackDao.getAllUserFeedbacks(id);
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
    public Feedback getInterviewFeedback(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException("Wrong id for get interview feedback");
        }
        Feedback feedback;
        FeedbackDao feedbackDao = DaoFactory.getInstance().getFeedbackDao();
        try {
            openTransactionSession();
            feedbackDao.setSession(getSession());
            feedback = feedbackDao.getInterviewFeedback(id);
            commitTransactionSession();
        } catch (DaoException | IllegalArgumentException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return feedback;
    }

    private void validateAddData(Feedback feedback) throws ServiceException {
        if (FeedbackValidator.validateId(feedback.getUser().getId())) {
            throw new ServiceException("Wrong id");
        }
        if (FeedbackValidator.validateId(feedback.getInterview().getId())) {
            throw new ServiceException("Wrong id");
        }
        if (!FeedbackValidator.validateText(feedback.getDescription())) {
            throw new ServiceException("Wrong description");
        }
        if (FeedbackValidator.validateMark(feedback.getMark())) {
            throw new ServiceException("Wrong mark");
        }
    }

    private void validateEditData(Feedback feedback) throws ServiceException {
        if (!FeedbackValidator.validateText(feedback.getDescription())) {
            throw new ServiceException("Wrong description");
        }
        if (!FeedbackValidator.validateMark(feedback.getMark())) {
            throw new ServiceException("Wrong mark");
        }
    }
}
