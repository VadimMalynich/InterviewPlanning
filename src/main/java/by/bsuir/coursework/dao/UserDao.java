package by.bsuir.coursework.dao;

import by.bsuir.coursework.bean.User;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class UserDao extends AbstractDao<Integer, User> {
    private static final String GET_ALL = "SELECT * FROM users";
    private static final String AUTHORIZATION = "SELECT * FROM users WHERE login=:login";
    private static final String GET_USER_PASSWORD = "SELECT password FROM users WHERE login=:login";
    private static final String GET_USER_ROLE = "SELECT role FROM users WHERE id=:id";

    @Override
    public List<User> getAll() throws DaoException {
        try {
            return session.createNativeQuery(GET_ALL).addEntity(User.class).list();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void delete(Integer id) throws DaoException {
        try {
            User user = session.find(User.class, id);
            session.remove(user);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void add(User user) throws DaoException {
        try {
            session.save(user);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    @Override
    public void edit(User user) throws DaoException {
        try {
            session.update(user);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public User authorization(String login, Session session) throws DaoException {
        try {
            Query query = session.createNativeQuery(AUTHORIZATION).addEntity(User.class);
            query.setParameter("login", login);
            return (User) query.getSingleResult();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public User getUser(Integer id, Session session) throws DaoException {
        try {
            return session.find(User.class, id);
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public String getUserPassword(String login, Session session) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_USER_PASSWORD);
            query.setParameter("login", login);
            return (String) query.getSingleResult();
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }

    public Integer getUserRole(Integer id, Session session) throws DaoException {
        try {
            Query query = session.createNativeQuery(GET_USER_ROLE);
            query.setParameter("id", id);
            return Integer.valueOf(String.valueOf(query.getSingleResult()));
        } catch (Exception ex) {
            throw new DaoException(ex);
        }
    }
}
