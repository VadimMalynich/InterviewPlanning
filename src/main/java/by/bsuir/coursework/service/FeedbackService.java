package by.bsuir.coursework.service;

import by.bsuir.coursework.bean.Feedback;

import java.util.List;

public interface FeedbackService {
    /**
     * Method for getting all feedbacks
     *
     * @return {@code List<Feedback>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Feedback> getAll() throws ServiceException;

    /**
     * Method for deleting feedback
     *
     * @param id id of feedback
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void delete(Integer id) throws ServiceException;

    /**
     * Method for checking feedback info which feedback entered, and if data will be correct add feedback into database
     *
     * @param feedback            all info that user entered about feedback
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void add(Feedback feedback) throws ServiceException;

    /**
     * Method for validating data before edit feedback in database
     *
     * @param feedback       new info about feedback
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void edit(Feedback feedback) throws ServiceException;

    /**
     * Method for getting all user feedbacks
     *
     * @param id user id
     * @return {@code List<Feedback>} with feedbacks info
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    List<Feedback> getUserFeedbacks(Integer id) throws ServiceException;

    /**
     * Method for get interview feedback
     *
     * @param id interview id
     * @return feedback info
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    Feedback getInterviewFeedback(Integer id) throws ServiceException;
}
