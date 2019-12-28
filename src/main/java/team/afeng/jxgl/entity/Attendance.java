package team.afeng.jxgl.entity;

import java.sql.Date;

/**
 * Author: Afeng
 * Date: 2019/12/28
 * Time: 19:33
 * Description:
 */
public class Attendance {
    private String number;
    private String name;
    private Date date;
    private String cname;
    private int type;

    @Override
    public String toString() {
        return "Attendance{" +
                "number='" + number + '\'' +
                ", name='" + name + '\'' +
                ", date=" + date +
                ", cname='" + cname + '\'' +
                ", type=" + type +
                '}';
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
