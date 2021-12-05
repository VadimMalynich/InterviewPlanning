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
        commands.put(CommandName.GO_TO_EDIT_USER_PAGE, new GoToEditUserPage());
        commands.put(CommandName.EDIT_USER, new EditUser());
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