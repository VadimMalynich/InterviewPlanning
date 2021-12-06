package by.bsuir.coursework.bean;

import javax.persistence.*;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "platforms", schema = "interview_db")
public class Platforms extends Entity {

    @Column(name = "name", nullable = false, length = 25)
    private String name;

    @Transient
    private Integer count;

    public Platforms() {
    }

    public Platforms(Integer id) {
        super(id);
    }

    public Platforms(String name) {
        this.name = name;
    }

    public Platforms(Integer id, String name) {
        super(id);
        this.name = name;
    }

    public Platforms(Integer id, String name, Integer count) {
        super(id);
        this.name = name;
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Platforms platforms = (Platforms) o;
        return Objects.equals(name, platforms.name) && Objects.equals(count, platforms.count);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), name, count);
    }

    @Override
    public String toString() {
        return "Platforms{" +
                "id=" + getId() +
                ", name='" + name + '\'' +
                ", count=" + count +
                '}';
    }
}
