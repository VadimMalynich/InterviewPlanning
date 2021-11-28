package by.bsuir.coursework.bean;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "interview", schema = "interview_db")
public class Interview extends Entity {

    @Column(name = "vacancy_id", nullable = false)
    private Integer vacancyId;

    @Column(name = "user_id", nullable = false)
    private Integer userId;

    @Column(name = "topic", nullable = false, length = 50)
    private String topic;

    @Column(name = "date", nullable = false)
    private Date date;

    @Column(name = "start_time", nullable = false)
    private Time startTime;

    @Column(name = "end_time", nullable = false)
    private Time endTime;

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JoinColumn(name = "platform_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "platform_id_fk"))
    private Platforms platform;

    @Column(name = "happen", nullable = true)
    private Boolean happen;

    private Vacancy vacancyByVacancyId;
    private User usersByUserId;


    public Integer getVacancyId() {
        return vacancyId;
    }

    public void setVacancyId(Integer vacancyId) {
        this.vacancyId = vacancyId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Platforms getPlatform() {
        return platform;
    }

    public void setPlatform(Platforms platform) {
        this.platform = platform;
    }

    public Boolean getHappen() {
        return happen;
    }

    public void setHappen(Boolean happen) {
        this.happen = happen;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Interview interview = (Interview) o;
        return Objects.equals(vacancyId, interview.vacancyId) && Objects.equals(userId, interview.userId) && Objects.equals(topic, interview.topic) && Objects.equals(date, interview.date) && Objects.equals(startTime, interview.startTime) && Objects.equals(endTime, interview.endTime) && Objects.equals(platform, interview.platform) && Objects.equals(happen, interview.happen) && Objects.equals(vacancyByVacancyId, interview.vacancyByVacancyId) && Objects.equals(usersByUserId, interview.usersByUserId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), vacancyId, userId, topic, date, startTime, endTime, platform, happen, vacancyByVacancyId, usersByUserId);
    }

    @Override
    public String toString() {
        return "Interview{" +
                "id=" + getId() +
                ", vacancyId=" + vacancyId +
                ", userId=" + userId +
                ", topic='" + topic + '\'' +
                ", date=" + date +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", platform=" + platform +
                ", happen=" + happen +
                ", vacancyByVacancyId=" + vacancyByVacancyId +
                ", usersByUserId=" + usersByUserId +
                '}';
    }

    @ManyToOne
    @JoinColumn(name = "vacancy_id", referencedColumnName = "id", nullable = false)
    public Vacancy getVacancyByVacancyId() {
        return vacancyByVacancyId;
    }

    public void setVacancyByVacancyId(Vacancy vacancyByVacancyId) {
        this.vacancyByVacancyId = vacancyByVacancyId;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    public User getUsersByUserId() {
        return usersByUserId;
    }

    public void setUsersByUserId(User usersByUserId) {
        this.usersByUserId = usersByUserId;
    }

}
