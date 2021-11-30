package by.bsuir.coursework.dao;

import by.bsuir.coursework.bean.Platforms;
import org.hibernate.query.Query;

import java.util.List;

public class PlatformsDao extends AbstractDao<Integer, Platforms> {
    private static final String GET_ALL = "SELECT * FROM platforms";
    private static final String GET_PLATFORM = "SELECT name FROM platforms WHERE id=:id";

    @Override
    public List<Platforms> getAll() throws DaoException {
        try {
            return session.createNativeQuery(GET_ALL).addEntity(Platforms.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void add(Platforms platforms) throws DaoException {
        try {
            session.save(platforms);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void delete(Integer id) throws DaoException {
        try {
            Platforms platform = session.find(Platforms.class, id);
            session.remove(platform);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void edit(Platforms platform) throws DaoException {
        try {
            session.update(platform);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public String getPlatform(Integer id) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_PLATFORM);
            query.setParameter("id", id);
            return (String) query.getSingleResult();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }
}
