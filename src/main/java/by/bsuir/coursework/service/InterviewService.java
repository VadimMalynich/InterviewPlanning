package by.bsuir.coursework.service;

import by.bsuir.coursework.bean.Interview;

import java.util.List;

public interface InterviewService {
    /**
     * Method for getting all interviews
     *
     * @return {@code List<Interview>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> getAll() throws ServiceException;

    /**
     * Method for deleting interview
     *
     * @param id id of interview
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void delete(Integer id) throws ServiceException;

    /**
     * Method for checking interview info which interview entered, and if data will be correct add interview into database
     *
     * @param interview all info that user entered about interview
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void add(Interview interview) throws ServiceException;

    /**
     * Method for validating data before edit interview in database
     *
     * @param interview new info about interview
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void edit(Interview interview) throws ServiceException;

    /**
     * Method for getting all user past interviews
     *
     * @return {@code List<Interview>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> getPastUserInterviews(Integer id) throws ServiceException;

    /**
     * Method for get interview
     *
     * @param id interview id
     * @return interview info
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    Interview getInterview(Integer id) throws ServiceException;

    /**
     * Method for getting all vacancy interviews
     *
     * @return {@code List<Interview>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> getVacancyInterviews(Integer id) throws ServiceException;

    /**
     * Method for getting all user interviews
     *
     * @return {@code List<Interview>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> getInterviewerInterviews(Integer id) throws ServiceException;

    /**
     * Method for getting all user vacancy interviews
     *
     * @return {@code List<Interview>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> getUserVacancyInterviews(Integer userId, Integer vacancyId) throws ServiceException;

    /**
     * Method for getting all happened interviews
     *
     * @return {@code List<Interview>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> getHappened() throws ServiceException;

    /**
     * Method for search interviews by interview topic
     *
     * @param text   the text that the user entered for the search
     * @param userId id of user
     * @return {@code List<Interview>} with interviews that satisfy the condition
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> searchInterviews(String text, Integer userId) throws ServiceException;

    /**
     * Method for filter interviews by interview platform
     *
     * @param platformId id of platform
     * @param userId     id of user
     * @return {@code List<Interview>} with interviews that satisfy the condition
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> filterInterviews(Integer platformId, Integer userId) throws ServiceException;

    void bookingInterview(Integer interviewId, Integer userId) throws ServiceException;

    void cancelBooking(Integer interviewId) throws ServiceException;

    /**
     * Method for getting all user interviews
     *
     * @return {@code List<Interview>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Interview> getUserInterviews(Integer id) throws ServiceException;
}
