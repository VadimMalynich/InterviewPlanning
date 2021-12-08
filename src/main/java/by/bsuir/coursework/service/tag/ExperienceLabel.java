package by.bsuir.coursework.service.tag;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.text.MessageFormat;

@SuppressWarnings("serial")
public class ExperienceLabel extends TagSupport {
    private static final Logger userLogger = LogManager.getLogger(ExperienceLabel.class);
    private String experience;
    private String bundle;

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public void setBundle(String bundle) {
        this.bundle = bundle;
    }

    @Override
    public int doStartTag() throws JspException {
        MessageManager manager = MessageManager.getByCode(bundle);
        StringBuilder str = new StringBuilder();
        str.append("<li class=\"mb-3\"><h5><em class=\"fa fa-vcard\"></em> ").
                append(manager.getString("label.experience")).append(":");
        if (experience == null || "".equals(experience)) {
            str.append(manager.getString("label.emptyExperience"));
        } else if (!experience.contains("-")) {
            int exp = Integer.parseInt(experience);
            if (exp == 1) {
                str.append(MessageFormat.format(manager.getString("label.experienceFirst"), exp));
            } else if (exp >= 2 && exp <= 4) {
                str.append(MessageFormat.format(manager.getString("label.experienceSecond"), exp));
            } else {
                str.append(MessageFormat.format(manager.getString("label.experienceThird"), exp));
            }
        } else {
            int a = Integer.parseInt(experience.substring(0, experience.indexOf("-")));
            int b = Integer.parseInt(experience.substring(experience.indexOf("-") + 1));
            str.append(MessageFormat.format(manager.getString("label.intervalExperience"), a, b));
        }
        str.append("</h5></li>");
        try {
            pageContext.getOut().write(String.valueOf(str));
        } catch (IOException e) {
            userLogger.error(e);
        }
        return SKIP_BODY;
    }
}
