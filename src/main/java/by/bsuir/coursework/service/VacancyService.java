package by.bsuir.coursework.service;

import by.bsuir.coursework.bean.Employment;
import by.bsuir.coursework.bean.Feedback;
import by.bsuir.coursework.bean.Schedule;
import by.bsuir.coursework.bean.Vacancy;

import java.util.List;

public interface VacancyService {
    /**
     * Method for getting all vacancies
     *
     * @return {@code List<Vacancy>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Vacancy> getAll() throws ServiceException;

    /**
     * Method for deleting vacancy
     *
     * @param id id of vacancy
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void delete(Integer id) throws ServiceException;

    /**
     * Method for checking vacancy info which vacancy entered, and if data will be correct add vacancy into database
     *
     * @param vacancy            all info that user entered about vacancy
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void add(Vacancy vacancy) throws ServiceException;

    /**
     * Method for validating data before edit vacancy in database
     *
     * @param vacancy       new info about vacancy
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void edit(Vacancy vacancy) throws ServiceException;

    /**
     * Method for get vacancy
     *
     * @param id vacancy id
     * @return vacancy info
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    Vacancy getVacancy(Integer id) throws ServiceException;

    /**
     * Method for search vacancies by vacancy topic
     *
     * @param text the text that the user entered for the search
     * @return {@code List<Vacancy>} with vacancies that satisfy the condition
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Vacancy> searchVacancies(String text) throws ServiceException;

    /**
     * Method for get all employments
     *
     * @return {@code List<Employment>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Employment> getEmployments() throws ServiceException;

    /**
     * Method for get all schedules
     *
     * @return {@code List<Schedule>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Schedule> getSchedules() throws ServiceException;
}
