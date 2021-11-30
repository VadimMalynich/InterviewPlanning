package main;

import by.bsuir.coursework.dao.PlatformsDao;
import by.bsuir.coursework.dao.utilities.SessionUtil;

public class Main {
    public static void main(String[] args) {
        SessionUtil util = new SessionUtil();
        PlatformsDao dao = new PlatformsDao();
        util.openSession();
        dao.setSession(util.getSession());
        System.out.println(dao.getSession());
        util.closeSession();
        System.out.println(dao.getSession());
    }
}
