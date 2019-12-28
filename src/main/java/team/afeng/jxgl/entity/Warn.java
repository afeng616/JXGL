package team.afeng.jxgl.entity;

/**
 * Author: Afeng
 * Date: 2019/12/28
 * Time: 19:21
 * Description:
 */
public class Warn {
    private String number;
    private String name;
    private String semester;
    private String classnum;
    private int type;

    @Override
    public String toString() {
        return "Warn{" +
                "number='" + number + '\'' +
                ", name='" + name + '\'' +
                ", semester='" + semester + '\'' +
                ", classnum='" + classnum + '\'' +
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

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getClassnum() {
        return classnum;
    }

    public void setClassnum(String classnum) {
        this.classnum = classnum;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
