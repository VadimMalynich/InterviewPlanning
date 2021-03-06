package by.bsuir.coursework.bean;

import java.io.Serializable;

public enum UserRole implements Serializable {
    ADMINISTRATOR(0), DIRECTOR(1), INTERVIEWER(2), USER(3);
    private final Integer value;

    UserRole(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public static UserRole getByCode(Integer role) {
        for (UserRole g : UserRole.values()) {
            if (g.value.equals(role)) {
                return g;
            }
        }
        return null;
    }
}
