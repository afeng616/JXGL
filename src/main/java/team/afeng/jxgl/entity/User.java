package team.afeng.jxgl.entity;

/**
 * Author: Afeng
 * Date: 2019/12/22
 * Time: 9:54
 * Description:
 */
public class User {
    private String id;
    private String password;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
