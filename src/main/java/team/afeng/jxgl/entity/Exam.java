package team.afeng.jxgl.entity;

import java.sql.Timestamp;

/**
 * Author: Afeng
 * Date: 2019/12/28
 * Time: 17:07
 * Description:
 */
public class Exam {
    private String tname;
    private String cname;
    private String esite;
    private Timestamp ebtime;
    private Timestamp eetime;
    private int etype;

    @Override
    public String toString() {
        return "Exam{" +
                "tid='" + tname + '\'' +
                ", cid='" + cname + '\'' +
                ", esite='" + esite + '\'' +
                ", ebtime=" + ebtime +
                ", eetime=" + eetime +
                ", etype=" + etype +
                '}';
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getEsite() {
        return esite;
    }

    public void setEsite(String esite) {
        this.esite = esite;
    }

    public Timestamp getEbtime() {
        return ebtime;
    }

    public void setEbtime(Timestamp ebtime) {
        this.ebtime = ebtime;
    }

    public Timestamp getEetime() {
        return eetime;
    }

    public void setEetime(Timestamp eetime) {
        this.eetime = eetime;
    }

    public int getEtype() {
        return etype;
    }

    public void setEtype(int etype) {
        this.etype = etype;
    }
}
