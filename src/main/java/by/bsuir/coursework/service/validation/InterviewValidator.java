package by.bsuir.coursework.service.validation;

import java.sql.Date;
import java.sql.Time;
import java.util.Calendar;

public class InterviewValidator {
    private static final String EMPTY_STRING = "";

    private InterviewValidator() {
    }

    /**
     * Method for validating interview topic
     *
     * @param topic topic of interview
     * @return {@code true} if {@code topic} correct, {@code false} otherwise
     */
    public static boolean validateTopic(String topic) {
        if (topic == null || EMPTY_STRING.equals(topic)) {
            return false;
        }
        return topic.length() <= 50;
    }

    /**
     * Method for validate interview date
     *
     * @param date the day when the interview will take place
     * @param startTime the time when the interview will start
     * @param endTime the time when the interview will end
     * @return {@code true} if {@code topic} correct, {@code false} otherwise
     */
    public static boolean validateDate(Date date, Time startTime, Time endTime) {
        if (date == null || startTime == null) {
            return false;
        }
        Long time = Calendar.getInstance().getTimeInMillis();
        if (date.compareTo(new Date(time)) < 0) {
            return false;
        }
        if (date.compareTo(new Date(time)) == 0 && startTime.compareTo(new Time(time)) <= 0) {
            return false;
        }
        if (endTime != null && endTime.compareTo(startTime) <= 0) {
            return false;
        }
        return true;
    }
}
