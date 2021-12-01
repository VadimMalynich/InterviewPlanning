package by.bsuir.coursework.service;

import by.bsuir.coursework.bean.Platforms;

import java.util.List;

public interface PlatformService {
    /**
     * Method for getting all platforms
     *
     * @return {@code List<Platforms>} with info that lies in database
     * @throws ServiceException when the error occurred on the dao layer
     */
    List<Platforms> getAll() throws ServiceException;

    /**
     * Method for deleting platform
     *
     * @param id id of platform
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void delete(Integer id) throws ServiceException;

    /**
     * Method for checking platform info which platform entered, and if data will be correct add platform into database
     *
     * @param platform            all info that user entered about platform
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void add(Platforms platform) throws ServiceException;

    /**
     * Method for validating data before edit platform in database
     *
     * @param platform       new info about platform
     * @throws ServiceException when the error occurred on the dao layer or when validate data
     */
    void edit(Platforms platform) throws ServiceException;
}
