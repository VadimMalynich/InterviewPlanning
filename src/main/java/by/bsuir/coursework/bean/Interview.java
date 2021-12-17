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

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JoinColumn(name = "vacancy_id", referencedColumnName = "id", nullable = false,  foreignKey = @ForeignKey(name = "vacancy_id_fk"))
    private Vacancy vacancy;

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JoinColumn(name = "interviewer_id", referencedColumnName = "id", nullable = false, foreignKey = @ForeignKey(name = "interviewer_id_fk"))
    private User interviewer;

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

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = true, foreignKey = @ForeignKey(name = "user_id_fk"))
    private User user;

    public Interview() {
    }

    public Interview(Integer id) {
        super(id);
    }

    public Interview(Integer vacancyId, User interviewer, String topic, Date date, Time startTime, Time endTime, Integer platformId) {
        this.vacancy = new Vacancy(vacancyId);
        this.interviewer = interviewer;
        this.topic = topic;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.platform = new Platforms(platformId);
    }

    public Interview(Integer id, Integer vacancyId, User interviewer, String topic, Date date, Time startTime, Time endTime, Integer platformId) {
        super(id);
        this.vacancy = new Vacancy(vacancyId);
        this.interviewer = interviewer;
        this.topic = topic;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.platform = new Platforms(platformId);
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancyByVacancyId) {
        this.vacancy = vacancyByVacancyId;
    }

    public User getInterviewer() {
        return interviewer;
    }

    public void setInterviewer(User usersByUserId) {
        this.interviewer = usersByUserId;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Interview interview = (Interview) o;
        return Objects.equals(vacancy, interview.vacancy) && Objects.equals(interviewer, interview.interviewer) && Objects.equals(topic, interview.topic) && Objects.equals(date, interview.date) && Objects.equals(startTime, interview.startTime) && Objects.equals(endTime, interview.endTime) && Objects.equals(platform, interview.platform) && Objects.equals(happen, interview.happen) && Objects.equals(user, interview.user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), vacancy, interviewer, topic, date, startTime, endTime, platform, happen, user);
    }

    @Override
    public String toString() {
        return "Interview{" +
                "id=" + getId() +
                ", vacancyId=" + vacancy.getId() +
                ", interviewerId=" + interviewer.getId() +
                ", topic='" + topic + '\'' +
                ", date=" + date +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", platform=" + platform +
                ", happen=" + happen +
                ", userId=" + user +
                '}';
    }
}
