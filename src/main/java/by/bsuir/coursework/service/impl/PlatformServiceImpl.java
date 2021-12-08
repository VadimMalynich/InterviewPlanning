package by.bsuir.coursework.service.impl;

import by.bsuir.coursework.bean.Platforms;
import by.bsuir.coursework.dao.DaoException;
import by.bsuir.coursework.dao.DaoFactory;
import by.bsuir.coursework.dao.InterviewDao;
import by.bsuir.coursework.dao.PlatformsDao;
import by.bsuir.coursework.dao.utilities.SessionUtil;
import by.bsuir.coursework.service.PlatformService;
import by.bsuir.coursework.service.ServiceException;

import java.util.List;

public class PlatformServiceImpl extends SessionUtil implements PlatformService {
    @Override
    public List<Platforms> getAll() throws ServiceException {
        List<Platforms> list;
        PlatformsDao platformsDao = DaoFactory.getInstance().getPlatformsDao();
        InterviewDao interviewDao = DaoFactory.getInstance().getInterviewDao();
        try {
            openTransactionSession();
            platformsDao.setSession(getSession());
            interviewDao.setSession(getSession());
            list = platformsDao.getAll();
            for (Platforms p : list) {
                p.setCount(interviewDao.getInterviewsPlatformCount(p.getId()));
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
            throw new ServiceException("Wrong id for delete platform");
        }
        PlatformsDao platformsDao = DaoFactory.getInstance().getPlatformsDao();
        try {
            openTransactionSession();
            platformsDao.setSession(getSession());
            platformsDao.delete(id);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void add(Platforms platform) throws ServiceException {
        validateData(platform);
        PlatformsDao platformsDao = DaoFactory.getInstance().getPlatformsDao();
        try {
            openTransactionSession();
            platformsDao.setSession(getSession());
            platformsDao.add(platform);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    @Override
    public void edit(Platforms platform) throws ServiceException {
        validateData(platform);
        PlatformsDao platformsDao = DaoFactory.getInstance().getPlatformsDao();
        try {
            openTransactionSession();
            platformsDao.setSession(getSession());
            platformsDao.edit(platform);
            commitTransactionSession();
        } catch (DaoException e) {
            rollbackTransactionSession();
            throw new ServiceException(e);
        } finally {
            closeSession();
        }
    }

    private void validateData(Platforms platform) throws ServiceException {
        if (platform == null) {
            throw new ServiceException("platform doesn't exist");
        }
        if (platform.getName() == null || "".equals(platform.getName())) {
            throw new ServiceException("Wrong platform name");
        }
        if (platform.getName().length() > 25) {
            throw new ServiceException("Incorrect platform name");
        }
    }
}
