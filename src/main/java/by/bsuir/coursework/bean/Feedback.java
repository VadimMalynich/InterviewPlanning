package by.bsuir.coursework.bean;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "feedback", schema = "interview_db")
public class Feedback extends Entity {

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JoinColumn(name = "interview_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "interview_id_fk"))
    private Interview interview;

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "user_id_fk"))
    private User users;

    @Column(name = "description", nullable = false, length = 500)
    private String description;

    @Column(name = "additional_requirements", nullable = false)
    private Boolean additionalRequirements;

    @Column(name = "mark", nullable = false)
    private Byte mark;

    public Interview getInterview() {
        return interview;
    }

    public void setInterview(Interview interview) {
        this.interview = interview;
    }

    public User getUsers() {
        return users;
    }

    public void setUsers(User user) {
        this.users = user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getAdditionalRequirements() {
        return additionalRequirements;
    }

    public void setAdditionalRequirements(Boolean additionalRequirements) {
        this.additionalRequirements = additionalRequirements;
    }

    public Byte getMark() {
        return mark;
    }

    public void setMark(Byte mark) {
        this.mark = mark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Feedback feedback = (Feedback) o;
        return Objects.equals(interview, feedback.interview) && Objects.equals(users, feedback.users) && Objects.equals(description, feedback.description) && Objects.equals(additionalRequirements, feedback.additionalRequirements) && Objects.equals(mark, feedback.mark);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), interview, users, description, additionalRequirements, mark);
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" +getId() +
                ", description='" + description + '\'' +
                ", additionalRequirements=" + additionalRequirements +
                ", mark=" + mark +
                ", interviewByInterviewId=" + interview +
                ", usersByUserId=" + users +
                '}';
    }
}
