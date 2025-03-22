package crud.until;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class config {
	static final SimpleDateFormat Date_Formater = new SimpleDateFormat("yyyy-MM-dd");
    public static Date toDate(String date, String pattern) {
        try {
            Date_Formater.applyPattern(pattern);
            return Date_Formater.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

    }

    public static String toString(Date date, String pattern) {
        Date_Formater.applyPattern(pattern);
        return Date_Formater.format(date);
    }
}
