package by.bsuir.coursework.dao;

import by.bsuir.coursework.bean.Interview;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class InterviewDao extends AbstractDao<Integer, Interview> {
    private static final String GET_FUTURE_INTERVIEWS = "SELECT * FROM interview WHERE (date = current_date() AND start_time >= current_time()) OR date > current_date() ORDER BY date, start_time ASC";
    private static final String GET_HAPPENED = "SELECT * FROM interview WHERE happen=1 ORDER BY date, start_time ASC";
    private static final String GET_VACANCY_INTERVIEWS = "SELECT * FROM interview WHERE vacancy_id=:id ORDER BY date, start_time ASC";
    private static final String GET_USER_INTERVIEWS = "SELECT * FROM interview WHERE user_id=:id ORDER BY date, start_time ASC";
    private static final String GET_USER_VACANCY_INTERVIEWS = "SELECT * FROM interview WHERE user_id=:user_id AND  vacancy_id=:vacancy_id ORDER BY date, start_time ASC";
    private static final String GET_INTERVIEWS_VACANCY_COUNT = "SELECT * FROM interview WHERE vacancy_id=:id";
    private static final String GET_INTERVIEWS_PLATFORM_COUNT = "SELECT * FROM interview WHERE platform_id=:id";
    private static final String SEARCH_INTERVIEWS = "SELECT * FROM interview WHERE topic LIKE ";

    @Override
    public List<Interview> getAll() throws DaoException {
        try {
            return session.createNativeQuery(GET_FUTURE_INTERVIEWS).addEntity(Interview.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void delete(Integer id) throws DaoException {
        try {
            Interview interview = session.find(Interview.class, id);
            session.remove(interview);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void add(Interview interview) throws DaoException {
        try {
            session.save(interview);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void edit(Interview interview) throws DaoException {
        try {
            session.update(interview);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Interview> getHappened() throws DaoException {
        try {
            return session.createNativeQuery(GET_HAPPENED).addEntity(Interview.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Interview> getVacancyInterviews(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_VACANCY_INTERVIEWS).addEntity(Interview.class);
            query.setParameter("id", id);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Interview> getUserInterviews(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_USER_INTERVIEWS).addEntity(Interview.class);
            query.setParameter("id", id);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Interview> getUserVacancyInterviews(Integer userId, Integer vacancyId) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_USER_VACANCY_INTERVIEWS).addEntity(Interview.class);
            query.setParameter("user_id", userId);
            query.setParameter("vacancy_id", vacancyId);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public Integer getInterviewsVacancyCount(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_INTERVIEWS_VACANCY_COUNT);
            query.setParameter("id", id);
            return query.list().size();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public Integer getInterviewsPlatformCount(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_INTERVIEWS_PLATFORM_COUNT);
            query.setParameter("id", id);
            return query.list().size();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Interview> searchAds(String text) throws DaoException {
        try {
            Query query = session.createNativeQuery(SEARCH_INTERVIEWS + text).addEntity(Interview.class);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }
}
