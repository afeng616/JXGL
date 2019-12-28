package team.afeng.jxgl.entity;

/**
 * Author: Afeng
 * Date: 2019/12/28
 * Time: 17:56
 * Description:
 */
public class Score {
    private String tname;
    private String cname;
    private int chours;
    private int ccredit;
    private int cscore;

    @Override
    public String toString() {
        return "Score{" +
                "tname='" + tname + '\'' +
                ", cname='" + cname + '\'' +
                ", chours=" + chours +
                ", ccredit=" + ccredit +
                ", cscore=" + cscore +
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

    public int getChours() {
        return chours;
    }

    public void setChours(int chours) {
        this.chours = chours;
    }

    public int getCcredit() {
        return ccredit;
    }

    public void setCcredit(int ccredit) {
        this.ccredit = ccredit;
    }

    public int getCscore() {
        return cscore;
    }

    public void setCscore(int cscore) {
        this.cscore = cscore;
    }
}
