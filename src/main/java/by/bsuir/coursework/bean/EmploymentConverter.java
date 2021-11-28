package by.bsuir.coursework.bean;

import javax.persistence.AttributeConverter;

public class EmploymentConverter implements AttributeConverter<Employment, Integer> {

    @Override
    public Integer convertToDatabaseColumn(Employment employment) {
        if (employment == null) {
            return null;
        }
        return employment.getValue();
    }

    @Override
    public Employment convertToEntityAttribute(Integer integer) {
        if (integer == null) {
            return null;
        }
        return Employment.getByCode(integer);
    }
}
