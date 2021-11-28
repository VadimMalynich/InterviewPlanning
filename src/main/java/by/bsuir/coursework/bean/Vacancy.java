package by.bsuir.coursework.bean;

import javax.persistence.*;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "vacancy", schema = "interview_db")
public class Vacancy extends Entity {

    @Column(name = "topic", nullable = false, length = 50)
    private String topic;

    @Column(name = "experience", nullable = true, length = 7)
    private String experience;

    @Convert(converter = EmploymentConverter.class)
    @JoinColumn(name = "employment_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "employment_id_fk"))
    private Employment employment;

    @Convert(converter = ScheduleConverter.class)
    @JoinColumn(name = "schedule_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "schedule_id_fk"))
    private Schedule schedule;

    @Column(name = "description", nullable = false, length = 300)
    private String description;

    @Column(name = "requirements", nullable = false, length = 500)
    private String requirements;

    @Column(name = "additional_requirements", nullable = true, length = 500)
    private String additionalRequirements;

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getAdditionalRequirements() {
        return additionalRequirements;
    }

    public void setAdditionalRequirements(String additionalRequirements) {
        this.additionalRequirements = additionalRequirements;
    }

    public Employment getEmployment() {
        return employment;
    }

    public void setEmployment(Employment employment) {
        this.employment = employment;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Vacancy vacancy = (Vacancy) o;
        return Objects.equals(topic, vacancy.topic) && Objects.equals(experience, vacancy.experience) && employment == vacancy.employment && schedule == vacancy.schedule && Objects.equals(description, vacancy.description) && Objects.equals(requirements, vacancy.requirements) && Objects.equals(additionalRequirements, vacancy.additionalRequirements);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), topic, experience, employment, schedule, description, requirements, additionalRequirements);
    }

    @Override
    public String toString() {
        return "Vacancy{" +
                "id=" + getId() +
                ", topic='" + topic + '\'' +
                ", experience='" + experience + '\'' +
                ", employment=" + employment +
                ", schedule=" + schedule +
                ", description='" + description + '\'' +
                ", requirements='" + requirements + '\'' +
                ", additionalRequirements='" + additionalRequirements + '\'' +
                '}';
    }
}
