package by.bsuir.coursework.dao.utilities;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.File;

public class HibernateUtil {
    private static final Logger userLogger = LogManager.getLogger(HibernateUtil.class);
    private static final SessionFactory SESSION_FACTORY = buildSessionFactory();

    private HibernateUtil() {
    }

    private static SessionFactory buildSessionFactory() {
        try {
            return new Configuration().configure(/*new File("src/main/resources/hibernate.cfg.xml")*/).buildSessionFactory();
        } catch (Exception e) {
            userLogger.fatal(e);
            throw new ExceptionInInitializerError(e);
        }
    }

    public static SessionFactory getSessionFactory() {
        return SESSION_FACTORY;
    }

    public static void open() {
        buildSessionFactory();
    }

    public static void close() {
        getSessionFactory().close();
    }
}
