package by.bsuir.coursework.bean;

import javax.persistence.*;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "feedback", schema = "interview_db")
public class Feedback extends Entity {

    @Column(name = "interview_id", nullable = false)
    private Integer interviewId;

    @Column(name = "user_id", nullable = false)
    private Integer userId;

    @Column(name = "description", nullable = false, length = 500)
    private String description;

    @Column(name = "additional_requirements", nullable = false)
    private Boolean additionalRequirements;

    @Column(name = "mark", nullable = false)
    private Byte mark;

    @ManyToOne
    @JoinColumn(name = "interview_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "interview_id_fk"))
    private Interview interviewByInterviewId;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "user_id_fk"))
    private User usersByUserId;


    public Integer getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(Integer interviewId) {
        this.interviewId = interviewId;
    }


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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
        return Objects.equals(interviewId, feedback.interviewId) && Objects.equals(userId, feedback.userId) && Objects.equals(description, feedback.description) && Objects.equals(additionalRequirements, feedback.additionalRequirements) && Objects.equals(mark, feedback.mark) && Objects.equals(interviewByInterviewId, feedback.interviewByInterviewId) && Objects.equals(usersByUserId, feedback.usersByUserId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), interviewId, userId, description, additionalRequirements, mark, interviewByInterviewId, usersByUserId);
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" +getId() +
                ", interviewId=" + interviewId +
                ", userId=" + userId +
                ", description='" + description + '\'' +
                ", additionalRequirements=" + additionalRequirements +
                ", mark=" + mark +
                ", interviewByInterviewId=" + interviewByInterviewId +
                ", usersByUserId=" + usersByUserId +
                '}';
    }

    public Interview getInterviewByInterviewId() {
        return interviewByInterviewId;
    }

    public void setInterviewByInterviewId(Interview interviewByInterviewId) {
        this.interviewByInterviewId = interviewByInterviewId;
    }

    public User getUsersByUserId() {
        return usersByUserId;
    }

    public void setUsersByUserId(User usersByUserId) {
        this.usersByUserId = usersByUserId;
    }
}
