package by.bsuir.coursework.service.impl;

import by.bsuir.coursework.bean.Employment;
import by.bsuir.coursework.bean.Schedule;
import by.bsuir.coursework.bean.Vacancy;
import by.bsuir.coursework.dao.*;
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
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            interviewDao.setSession(getSession());
            list = vacancyDao.getAll();
            for (Vacancy v : list) {
                v.setInterviewsCount(interviewDao.getInterviewsVacancyCount(v.getId()));
            }
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
    public Vacancy getVacancy(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException("Wrong id");
        }
        Vacancy vacancy;
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            interviewDao.setSession(getSession());
            vacancy = vacancyDao.getVacancy(id);
            vacancy.setInterviewsCount(interviewDao.getInterviewsVacancyCount(vacancy.getId()));
            commitTransactionSession();
        } catch (DaoException | IllegalArgumentException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
        return vacancy;
    }

    @Override
    public List<Vacancy> searchVacancies(String text) throws ServiceException {
        if (text == null || "".equals(text)) {
            throw new ServiceException("Wrong search text");
        }
        List<Vacancy> list;
        text = "%" + text + "%";
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            interviewDao.setSession(getSession());
            list = vacancyDao.searchVacancy(text);
            for (Vacancy v : list) {
                v.setInterviewsCount(interviewDao.getInterviewsVacancyCount(v.getId()));
            }
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
    public List<Vacancy> filterBySchedule(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException("Wrong id for filter vacancies by schedule");
        }
        List<Vacancy> list;
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            interviewDao.setSession(getSession());
            list = vacancyDao.filterBySchedule(id);
            for (Vacancy v : list) {
                v.setInterviewsCount(interviewDao.getInterviewsVacancyCount(v.getId()));
            }
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
    public List<Vacancy> filterByEmployments(Integer id) throws ServiceException {
        if (id == null) {
            throw new ServiceException("Wrong id for filter vacancies by employment");
        }
        List<Vacancy> list;
        VacancyDao vacancyDao = DaoFactory.getInstance().getVacancyDao();
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            vacancyDao.setSession(getSession());
            interviewDao.setSession(getSession());
            list = vacancyDao.filterByEmployments(id);
            for (Vacancy v : list) {
                v.setInterviewsCount(interviewDao.getInterviewsVacancyCount(v.getId()));
            }
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
            for (Schedule s : list) {
                s.setCount(vacancyDao.getSchedulesCount(s.getId()));
            }
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
        if("".equals(vacancy.getExperience())){
            vacancy.setExperience(null);
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
        if("".equals(vacancy.getAdditionalRequirements())){
            vacancy.setAdditionalRequirements(null);
        }
        if (!VacancyValidator.validateAdditionalRequirements(vacancy.getAdditionalRequirements())) {
            throw new ServiceException("Wrong additional requirements");
        }
    }
}
