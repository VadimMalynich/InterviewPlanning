package by.bsuir.coursework.bean;

import javax.persistence.AttributeConverter;

public class ScheduleConverter implements AttributeConverter<Schedule, Integer> {

    @Override
    public Integer convertToDatabaseColumn(Schedule schedule) {
        if (schedule == null) {
            return null;
        }
        return schedule.getValue();
    }

    @Override
    public Schedule convertToEntityAttribute(Integer integer) {
        if (integer == null) {
            return null;
        }
        return Schedule.getByCode(integer);
    }
}
