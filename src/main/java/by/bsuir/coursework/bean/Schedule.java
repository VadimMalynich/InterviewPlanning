package by.bsuir.coursework.bean;

import javax.persistence.*;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "schedule", schema = "interview_db")
public class Schedule extends Entity {

    @Column(name = "timetable", nullable = false, length = 20)
    private String timetable;

    @Transient
    private Integer count;

    public String getTimetable() {
        return timetable;
    }

    public void setTimetable(String timetable) {
        this.timetable = timetable;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Schedule() {
    }

    public Schedule(Integer id) {
        super(id);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Schedule schedule = (Schedule) o;
        return Objects.equals(timetable, schedule.timetable) && Objects.equals(count, schedule.count);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), timetable, count);
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "id=" + getId() +
                ", timetable='" + timetable + '\'' +
                ", count=" + getCount() +
                '}';
    }
}
