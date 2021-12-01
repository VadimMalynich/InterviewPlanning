package by.bsuir.coursework.service.validation;

/**
 * Class for validate ad info before add in database
 */
public class VacancyValidator {
    private static final String EMPTY_STRING = "";
    private static final String EXPERIENCE_REGEX = "^\\d{1,2}([-]\\d{1,2})?$";

    private VacancyValidator() {
    }

    /**
     * Method for validating ad topic
     *
     * @param topic topic of ad
     * @return {@code true} if {@code topic} correct, {@code false} otherwise
     */
    public static boolean validateTopic(String topic) {
        if (topic == null || EMPTY_STRING.equals(topic)) {
            return false;
        }
        return topic.length() <= 50;
    }

    /**
     * Method for validating vacancy experience
     *
     * @param experience experience of vacancy
     * @return {@code true} if {@code experience} correct, {@code false} otherwise
     */
    public static boolean validateExperience(String experience) {
        if (experience == null) {
            return true;
        }
        if (EMPTY_STRING.equals(experience)) {
            return false;
        }
        return experience.matches(EXPERIENCE_REGEX);
    }

    /**
     * Method for validating vacancy description
     *
     * @param description description of vacancy
     * @return {@code true} if {@code description} correct, {@code false} otherwise
     */
    public static boolean validateDescription(String description) {
        if (description == null || EMPTY_STRING.equals(description)) {
            return false;
        }
        return description.length() <= 300;
    }

    /**
     * Method for validating vacancy requirements
     *
     * @param requirements requirements of vacancy
     * @return {@code true} if {@code requirements} correct, {@code false} otherwise
     */
    public static boolean validateRequirements(String requirements) {
        if (requirements == null || EMPTY_STRING.equals(requirements)) {
            return false;
        }
        return requirements.length() <= 500;
    }

    /**
     * Method for validating vacancy additional requirements
     *
     * @param requirements additional requirements of vacancy
     * @return {@code true} if {@code requirements} correct, {@code false} otherwise
     */
    public static boolean validateAdditionalRequirements(String requirements) {
        if(requirements == null){
            return true;
        }
        if (EMPTY_STRING.equals(requirements)) {
            return false;
        }
        return requirements.length() <= 500;
    }
}
