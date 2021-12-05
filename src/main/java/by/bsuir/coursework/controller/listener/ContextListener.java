package by.bsuir.coursework.controller.listener;

import by.bsuir.coursework.dao.utilities.HibernateUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {
    private static final Logger userLogger = LogManager.getLogger(ContextListener.class);

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        HibernateUtil.open();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        HibernateUtil.close();
    }
}
