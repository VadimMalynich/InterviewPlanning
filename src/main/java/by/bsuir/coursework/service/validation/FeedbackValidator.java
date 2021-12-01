package by.bsuir.coursework.service.validation;

/**
 * Class for validate feedback data before add in database
 */
public class FeedbackValidator {
    private static final String EMPTY_STRING = "";

    private FeedbackValidator() {
    }

    /**
     * Method for validating user or interview id
     *
     * @param id id of user or ad
     * @return {@code true} if {@code id} incorrect, {@code false} otherwise
     */
    public static boolean validateId(Integer id) {
        return id == null;
    }

    /**
     * Method for validating comment text
     *
     * @param text comment text
     * @return {@code true} if {@code text} correct, {@code false} otherwise
     */
    public static boolean validateText(String text) {
        if (text == null || EMPTY_STRING.equals(text)) {
            return false;
        }
        return text.length() < 500;
    }

    /**
     * Method for validate feedback mark
     *
     * @param mark assessment based on the results of the interview
     * @return {@code true} if {@code mark} incorrect, {@code false} otherwise
     */
    public static boolean validateMark(Byte mark) {
        return mark == null || mark < 1 || mark > 10;
    }
}
