package by.bsuir.coursework.dao;

import by.bsuir.coursework.bean.Employment;
import by.bsuir.coursework.bean.Interview;
import by.bsuir.coursework.bean.Schedule;
import by.bsuir.coursework.bean.Vacancy;
import org.hibernate.query.Query;

import java.util.List;

public class VacancyDao extends AbstractDao<Integer, Vacancy> {
    private static final String GET_ALL = "SELECT * FROM vacancy";
    private static final String SEARCH_VACANCY = "SELECT * FROM interview WHERE topic LIKE :text";
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

    public List<Vacancy> searchVacancy(String text) throws DaoException {
        try {
            Query query = session.createNativeQuery(SEARCH_VACANCY).addEntity(Interview.class);
            query.setParameter("text", text);
            return query.list();
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
