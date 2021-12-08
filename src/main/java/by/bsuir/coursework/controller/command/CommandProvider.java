package by.bsuir.coursework.controller.command;

import by.bsuir.coursework.controller.command.impl.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

public class CommandProvider {
    private static final Logger userLogger = LogManager.getLogger(CommandProvider.class);

    private Map<CommandName, Command> commands = new HashMap<>();

    public CommandProvider() {
        commands.put(CommandName.GO_TO_SIGN_IN_PAGE, new GoToSignInPage());
        commands.put(CommandName.GO_TO_SIGN_UP_PAGE, new GoToSignUpPage());
        commands.put(CommandName.SIGN_IN, new SignIn());
        commands.put(CommandName.SIGN_UP, new SignUp());
        commands.put(CommandName.EN_US, new ChangeLocale());
        commands.put(CommandName.RU_RU, new ChangeLocale());
        commands.put(CommandName.LOGOUT, new Logout());
        commands.put(CommandName.GO_TO_USERS_PAGE, new GoToUsersPage());
        commands.put(CommandName.DELETE_USER, new DeleteUser());
        commands.put(CommandName.EDIT_USER, new EditUser());
        commands.put(CommandName.GO_TO_EDIT_USER_PAGE, new GoToEditUserPage());
        commands.put(CommandName.GO_TO_HOME_PAGE, new GoToHomePage());
        commands.put(CommandName.GO_TO_VACANCY_PAGE, new GoToVacancyPage());
        commands.put(CommandName.GO_TO_ADD_VACANCY_PAGE, new GoToAddVacancyPage());
        commands.put(CommandName.ADD_VACANCY, new AddVacancy());
        commands.put(CommandName.GO_TO_EDIT_VACANCY_PAGE, new GoToEditVacancyPage());
        commands.put(CommandName.EDIT_VACANCY, new EditVacancy());
        commands.put(CommandName.DELETE_VACANCY, new DeleteVacancy());
        commands.put(CommandName.GO_TO_INTERVIEWS_PAGE, new GoToInterviewsPage());
        commands.put(CommandName.GO_TO_EDIT_INTERVIEW_PAGE, new GoToEditInterviewPage());
        commands.put(CommandName.GO_TO_ADD_INTERVIEW_PAGE, new GoToAddInterviewPage());
        commands.put(CommandName.EDIT_INTERVIEW, new EditInterview());
        commands.put(CommandName.ADD_INTERVIEW, new AddInterview());
        commands.put(CommandName.DELETE_INTERVIEW, new DeleteInterview());
        commands.put(CommandName.GO_TO_PLATFORMS_PAGE, new GoToPlatformsPage());
        commands.put(CommandName.ADD_PLATFORM, new AddPlatform());
        commands.put(CommandName.DELETE_PLATFORM, new DeletePlatform());
        commands.put(CommandName.EDIT_PLATFORM, new EditPlatform());
        commands.put(CommandName.SEARCH_VACANCIES, new SearchVacancies());
        commands.put(CommandName.FILTER_VACANCIES_BY_EMPLOYMENT, new FilterVacanciesByEmployment());
        commands.put(CommandName.FILTER_VACANCIES_BY_SCHEDULE, new FilterVacanciesBySchedule());
        commands.put(CommandName.SEARCH_INTERVIEWS, new SearchInterviews());
        commands.put(CommandName.FILTER_INTERVIEWS, new FilterInterviews());
        commands.put(CommandName.GO_TO_PROFILE_PAGE, new GoToProfilePage());
        commands.put(CommandName.GO_TO_FEEDBACKS_PAGE, new GoToFeedbacksPage());
        commands.put(CommandName.GO_TO_INTERVIEWER_FEEDBACKS_PAGE, new GoToInterviewerFeedbacksPage());
        commands.put(CommandName.GO_TO_ADD_FEEDBACK_PAGE, new GoToAddFeedbackPage());
        commands.put(CommandName.ADD_FEEDBACK, new AddFeedback());
        commands.put(CommandName.GO_TO_EDIT_FEEDBACK_PAGE, new GoToEditFeedbackPage());
        commands.put(CommandName.EDIT_FEEDBACK, new EditFeedback());
        commands.put(CommandName.WRONG_REQUEST, new WrongRequest());
    }

    public Command takeCommand(String name) {
        CommandName commandName;
        Command command;

        try {
            commandName = CommandName.valueOf(name.toUpperCase());
            command = commands.get(commandName);
        } catch (IllegalArgumentException | NullPointerException e) {
            String errorMessage = "Wrong command: " + name;
            userLogger.debug(errorMessage);
            command = commands.get(CommandName.WRONG_REQUEST);
        }

        return command;
    }
}