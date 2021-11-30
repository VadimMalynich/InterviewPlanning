package by.bsuir.coursework.dao;

import by.bsuir.coursework.bean.Vacancy;
import org.hibernate.query.Query;

import java.util.List;

public class VacancyDao extends AbstractDao<Integer, Vacancy> {
    private static final String GET_ALL = "SELECT * FROM vacancy";
    private static final String SEARCH_VACANCY = "SELECT * FROM interview WHERE topic LIKE ";

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

    public List<Vacancy> searchAds(String text) throws DaoException {
        try {
            Query query = session.createNativeQuery(SEARCH_VACANCY + text).addEntity(Vacancy.class);
            return query.list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }
}
