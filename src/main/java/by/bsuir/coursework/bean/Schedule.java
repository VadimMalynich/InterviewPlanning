package by.bsuir.coursework.bean;

import java.io.Serializable;

public enum Schedule implements Serializable {
    FULL_DAY(1), REMOTELY(2), FLEXIBLE(3), SHIFT(4);
    private final Integer value;

    Schedule(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public static Schedule getByCode(Integer type) {
        for (Schedule g : Schedule.values()) {
            if (g.value.equals(type)) {
                return g;
            }
        }
        return null;
    }
}
