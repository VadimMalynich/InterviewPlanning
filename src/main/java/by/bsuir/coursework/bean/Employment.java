package by.bsuir.coursework.bean;

import javax.persistence.*;
import java.util.Objects;

@javax.persistence.Entity
@Table(name = "employment", schema = "interview_db")
public class Employment extends Entity {

    @Column(name = "type", nullable = false, length = 25)
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Employment() {
    }

    public Employment(Integer id) {
        super(id);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Employment that = (Employment) o;
        return Objects.equals(type, that.type);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), type);
    }

    @Override
    public String toString() {
        return "Employment{" +
                "id=" + getId() +
                ", type='" + type + '\'' +
                '}';
    }
}
