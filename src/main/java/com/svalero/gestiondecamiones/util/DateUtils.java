package com.svalero.gestiondecamiones.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static com.svalero.gestiondecamiones.util.Constantes.DATE_PATTERN;

public class DateUtils {

    /* Para pasar de Date a String*/
    public static String format(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_PATTERN);
        return dateFormat.format(date);

    }
    /* Para pasar de String a Date*/
    public static  Date parse(String date) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_PATTERN);
        return new Date(dateFormat.parse(date).getTime());

    }

}
