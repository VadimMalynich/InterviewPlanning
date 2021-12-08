package by.bsuir.coursework.dao;

import by.bsuir.coursework.bean.*;
import org.hibernate.query.Query;

import java.util.List;

public class VacancyDao extends AbstractDao<Integer, Vacancy> {
    private static final String GET_ALL = "SELECT * FROM interview_db.vacancy ORDER BY id DESC";
    private static final String GET_VACANCY = "SELECT * FROM vacancy WHERE id=:id";
    private static final String SEARCH_VACANCY = "SELECT * FROM vacancy WHERE topic LIKE :text";
    private static final String FILTER_BY_SCHEDULE = "SELECT * FROM vacancy WHERE schedule_id=:id";
    private static final String FILTER_BY_EMPLOYMENTS = "SELECT * FROM vacancy WHERE employment_id=:id";
    private static final String GET_SCHEDULES_COUNT = "SELECT * FROM vacancy WHERE schedule_id=:id";
    private static final String GET_EMPLOYMENTS = "SELECT * FROM employment";
    private static final String GET_SCHEDULES = "SELECT * FROM schedule";

    @Override
    public List<Vacancy> getAll() throws DaoException {
        try {
            return session.createNativeQuery(GET_ALL).addEntity(Vacancy.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void delete(Integer id) throws DaoException {
        try {
            Vacancy vacancy = session.find(Vacancy.class, id);
            session.remove(vacancy);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void add(Vacancy vacancy) throws DaoException {
        try {
            session.save(vacancy);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void edit(Vacancy vacancy) throws DaoException {
        try {
            session.update(vacancy);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public Vacancy getVacancy(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_VACANCY).addEntity(Vacancy.class);
            query.setParameter("id", id);
            return (Vacancy) query.getSingleResult();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Vacancy> searchVacancy(String text) throws DaoException {
        try {
            Query query = session.createNativeQuery(SEARCH_VACANCY).addEntity(Vacancy.class);
            query.setParameter("text", text);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Vacancy> filterBySchedule(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(FILTER_BY_SCHEDULE).addEntity(Vacancy.class);
            query.setParameter("id", id);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Vacancy> filterByEmployments(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(FILTER_BY_EMPLOYMENTS).addEntity(Vacancy.class);
            query.setParameter("id", id);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public Integer getSchedulesCount(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_SCHEDULES_COUNT);
            query.setParameter("id", id);
            return query.list().size();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Employment> getEmployments() throws DaoException {
        try {
            return session.createNativeQuery(GET_EMPLOYMENTS).addEntity(Employment.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public List<Schedule> getSchedules() throws DaoException {
        try {
            return session.createNativeQuery(GET_SCHEDULES).addEntity(Schedule.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }
}
