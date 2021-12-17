package by.bsuir.coursework.bean;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "users", schema = "interview_db")
public class User extends Entity {

    @Column(name = "login", nullable = false, length = 254, unique = true)
    private String login;

    @Column(name = "password", nullable = false, length = 50)
    private String password;

    @Column(name = "name", nullable = false, length = 23)
    private String name;

    @Convert(converter = RoleConverter.class)
    @Column(name = "role", nullable = false)
    private UserRole role;

    @ManyToOne(cascade = CascadeType.DETACH, fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JoinColumn(name = "vacancy_id", nullable = true, foreignKey = @ForeignKey(name = "user_vacancy_id_fk"))
    private Vacancy vacancy;

    public User() {
    }

    public User(Integer id) {
        super(id);
    }

    public User(String login, String password) {
        super();
        this.login = login;
        this.password = password;
    }

    public User(String login, String password, String name) {
        this.login = login;
        this.password = password;
        this.name = name;
    }

    public User(String login, String password, String name, Integer vacancy) {
        this.login = login;
        this.password = password;
        this.name = name;
        this.vacancy = new Vacancy(vacancy);
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancy) {
        this.vacancy = vacancy;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        User user = (User) o;
        return Objects.equals(login, user.login) && Objects.equals(password, user.password) && Objects.equals(name, user.name) && role == user.role && Objects.equals(vacancy, user.vacancy);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), login, password, name, role, vacancy);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + getId() +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", role=" + role +
                ", vacancyId=" + vacancy +
                '}';
    }
}
