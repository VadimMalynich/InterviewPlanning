package by.bsuir.coursework.service.impl;

import by.bsuir.coursework.bean.Employment;
import by.bsuir.coursework.bean.Schedule;
import by.bsuir.coursework.bean.Vacancy;
import by.bsuir.coursework.dao.DaoException;
import by.bsuir.coursework.dao.DaoFactory;
import by.bsuir.coursework.dao.VacancyDao;
import by.bsuir.coursework.dao.utilities.SessionUtil;
import by.bsuir.coursework.service.ServiceException;
import by.bsuir.coursework.service.VacancyService;
import by.bsuir.coursework.service.validation.VacancyValidator;

import java.util.List;

public class VacancyServiceImpl extends SessionUtil implements VacancyService {
    @Override
    public List<Vacancy> getAll() throws ServiceException {
        List<Vacancy> list;
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            list = vacancyDao.getAll();
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
            throw new ServiceException("Wrong id for delete vacancy");
        }
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            vacancyDao.delete(id);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void add(Vacancy vacancy) throws ServiceException {
        if (vacancy == null) {
            throw new ServiceException("No info about vacancy");
        }
        validateData(vacancy);
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            vacancyDao.add(vacancy);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void edit(Vacancy vacancy) throws ServiceException {
        if (vacancy == null) {
            throw new ServiceException("No info about vacancy");
        }
        validateData(vacancy);
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            vacancyDao.edit(vacancy);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public List<Vacancy> searchVacancies(String text) throws ServiceException {
        if (text == null || "".equals(text)) {
            throw new ServiceException("Wrong search text");
        }
        List<Vacancy> list;
        text = "%" + text + "%";
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            list = vacancyDao.searchVacancy(text);
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
    public List<Employment> getEmployments() throws ServiceException {
        List<Employment> list;
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            list = vacancyDao.getEmployments();
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
    public List<Schedule> getSchedules() throws ServiceException {
        List<Schedule> list;
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            list = vacancyDao.getSchedules();
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return list;
    }

    private void validateData(Vacancy vacancy) throws ServiceException {
        if (!VacancyValidator.validateTopic(vacancy.getTopic())) {
            throw new ServiceException("Wrong topic");
        }
        if (!VacancyValidator.validateExperience(vacancy.getExperience())) {
            throw new ServiceException("Wrong experience");
        }
        if (!VacancyValidator.validateDescription(vacancy.getDescription())) {
            throw new ServiceException("Wrong description");
        }
        if (!VacancyValidator.validateRequirements(vacancy.getRequirements())) {
            throw new ServiceException("Wrong requirements");
        }
        if (!VacancyValidator.validateAdditionalRequirements(vacancy.getAdditionalRequirements())) {
            throw new ServiceException("Wrong additional requirements");
        }
    }
}
