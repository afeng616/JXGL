-- 创建数据库
create database if not exists db_jxgl;

use db_jxgl;

#-------------------------------------#
--            数据表说明   					 --
#-------------------------------------#
-- 登录表tb_user(id, password, lastAlterTime)
-- 学生表tb_numinfo(number, name, sex, profession, classnum, college, status)
-- 教师表tb_teacher(tid, tname, faculty)
-- 课程表tb_course(cid, cname, chours, ccredit)
-- 授课表tb_teach(tid, cid, csite, ctime)
-- 成绩表tb_score(id, cid, cscore)
#-------------------------------------#


-- 创建数据表 登录表
create table if not EXISTS `tb_user`(
		`id` varchar(10) not null PRIMARY KEY comment '学号即账号',
		`password` varchar(20) not null comment '密码',
		`lastAlterTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP comment '上次修改密码时间',
		constraint `uid` foreign key(`id`) references `tb_stuinfo`(`number`)
)charset=utf8;

-- 创建数据表 教师表
create table if not exists `tb_teacher`(
		`tid` varchar(10) not null primary key comment '教师id',
		`tname` varchar(6) not null comment '教师姓名',
		`faculty` varchar(32) not null comment '工作部门/学院'
)charset=utf8;
-- 创建数据表 课程表
create table if not exists `tb_course`(
		`cid` varchar(4) not null PRIMARY key comment '课程id',
		`cname` varchar(32) not null comment '课程名称',
		`chours` tinyint not null comment '课程学时',
		`ccredit` tinyint not null comment '课程学分'
)charset=utf8;
-- 创建数据表 授课表
create table if not exists `tb_teach`(
		`tid` varchar(10) not null comment '教师id',
		`cid` varchar(4) not null comment '课程id',
		`csite` varchar(10) not null comment '授课地点',
		`ctime` varchar(20) not null comment '授课时间',
		constraint `tid` foreign key(`tid`) references `tb_teacher`(`tid`),
		constraint `cid` foreign key(`cid`) references `tb_course`(`cid`)
)charset=utf8;

-- 创建数据表 成绩表
create table if not exists `tb_score`(
		`id` varchar(10) not null comment '学生id',
		`cid` varchar(4) not null comment '课程id',
		`cscore` tinyint not null comment '课程成绩',
		constraint `id` foreign key(`id`) references `tb_stuinfo`(`number`),
		constraint `csid` foreign key(`cid`) references `tb_course`(`cid`)
)charset=utf8;
 
 -- 为登录表插入数据(学号密码相同)
insert into tb_user(`id`, `password`)
		select number, number from tb_stuinfo;
 
 
 
 
 
 
 
 
 
 
 
 
 
 