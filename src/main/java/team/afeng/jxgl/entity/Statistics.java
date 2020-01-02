package team.afeng.jxgl.entity;

/**
 * Author: Afeng
 * Date: 2020/1/2
 * Time: 21:53
 * Description:
 */
public class Statistics {
    private String cid;
    private String cname;
    private String tname;
    private int failed;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
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

    public int getFailed() {
        return failed;
    }

    public void setFailed(int failed) {
        this.failed = failed;
    }
}
