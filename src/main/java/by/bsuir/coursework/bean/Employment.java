package by.bsuir.coursework.bean;

import java.io.Serializable;

public enum Employment implements Serializable {
    FULL(1), INTERNSHIP(2), PART_TIME(3), PROJECT(4);
    private final Integer value;

    Employment(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public static Employment getByCode(Integer type) {
        for (Employment g : Employment.values()) {
            if (g.value.equals(type)) {
                return g;
            }
        }
        return null;
    }
}
