package team.afeng.jxgl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("team.afeng.jxgl.mapper")
public class JxglApplication {

    public static void main(String[] args) {
        SpringApplication.run(JxglApplication.class, args);
    }

}
