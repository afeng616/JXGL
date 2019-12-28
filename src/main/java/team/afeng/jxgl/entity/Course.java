package team.afeng.jxgl.entity;

/**
 * Author: Afeng
 * Date: 2019/12/28
 * Time: 14:04
 * Description:
 */
public class Course {
    private String cname;
    private String tname;
    private String csite;
    private String content;
    private int ctime;

    @Override
    public String toString() {
        return "Course{" +
                "cname='" + cname + '\'' +
                ", tname='" + tname + '\'' +
                ", csite='" + csite + '\'' +
                ", content='" + content + '\'' +
                ", ctime=" + ctime +
                '}';
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getCsite() {
        return csite;
    }

    public void setCsite(String csite) {
        this.csite = csite;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCtime() {
        return ctime;
    }

    public void setCtime(int ctime) {
        this.ctime = ctime;
    }
}
