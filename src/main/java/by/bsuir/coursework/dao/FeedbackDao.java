package by.bsuir.coursework.dao;

import by.bsuir.coursework.bean.Feedback;
import by.bsuir.coursework.bean.User;
import org.hibernate.query.Query;

import java.util.List;

public class FeedbackDao extends AbstractDao<Integer, Feedback> {
    private static final String GET_ALL = "SELECT * FROM feedback";
    private static final String GET_ALL_USER_FEEDBACKS = "SELECT * FROM feedback WHERE user_id=:id";
    private static final String GET_ALL_INTERVIEW_FEEDBACKS = "SELECT * FROM feedback WHERE interview_id=:id";

    @Override
    public List<Feedback> getAll() throws DaoException {
        try {
            return session.createNativeQuery(GET_ALL).addEntity(User.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void delete(Integer id) throws DaoException {
        try {
            Feedback feedback = session.find(Feedback.class, id);
            session.remove(feedback);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void add(Feedback feedback) throws DaoException {
        try {
            session.save(feedback);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void edit(Feedback feedback) throws DaoException {
        try {
            session.update(feedback);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Feedback> getAllUserFeedbacks(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_ALL_USER_FEEDBACKS).addEntity(Feedback.class);
            query.setParameter("id", id);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Feedback> getAllInterviewFeedbacks(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_ALL_INTERVIEW_FEEDBACKS).addEntity(Feedback.class);
            query.setParameter("id", id);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }
}
