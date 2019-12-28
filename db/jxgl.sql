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
-- 授课表tb_teach(tid, cid, csite, ctime, cw, content)
-- 成绩表tb_score(id, cid, cscore)
-- 考试表tb_exam(tid, cid, esite, etime, etype)
-- 预警表tb_warn(id, semester, class, type)
-- 考勤表tb_attendance(id, date, cid, type)
#-------------------------------------#

-- 创建数据表 预警表
create table if not exists `tb_warn`(
		`id` varchar(10) not null comment '学生id',
		`semester` varchar(10) not null comment '学期',
		`class` varchar(6) not null comment '班级',
		`type` tinyint not null comment '预警类型',
		constraint `wid` foreign key(`id`) references `tb_stuinfo`(`number`)
			on delete cascade on update cascade
)charset=utf8;
-- 创建数据表 考勤表
create table if not exists `tb_attendance`(
		`id` varchar(10) not null comment '学生id',
		`date` date not null comment '日期',
		`cid` varchar(4) not null comment '课程id',
		`type` tinyint not null comment '类型',
		constraint `aid` foreign key(`id`) references `tb_stuinfo`(`number`)
			on DELETE cascade on update cascade
)charset=utf8;


--  "courses": [{"cname": "Web技术开发", "teacher": "曹彩凤", "site": "北主楼101", "content": "如何学好Web开发", "time": "0102"}]
select cname, tname, csite, content, ctime from tb_course 
		inner join tb_teach on tb_teach.cid=tb_course.cid 
		inner join tb_teacher on tb_teacher.tid=tb_teach.tid
		where cw=1;
	
-- 考试清单查询
select tname, cname, esite, ebtime, eetime, etype from tb_exam
		inner join tb_teacher on tb_teacher.tid=tb_exam.tid
		inner join tb_course on tb_course.cid=tb_exam.cid
		where id='3117005390' order by `ebtime` asc; 
-- 成绩清单查询
select tname, cname, chours, ccredit, cscore from tb_score
		inner join tb_course on tb_course.cid=tb_score.cid
		inner join 
		where id='3117005390';

-- 创建数据表 考试表
create table if not exists `tb_exam`(
		`tid` varchar(10) not null comment '教师id',
		`cid` varchar(4) not null primary key comment '课程id',
		`esite` varchar(10) not null comment '考试地点',
		`ebtime` timestamp not null comment '考试时间',
		`eetime` timestamp not null comment '考试时间',
		`etype` tinyint not null comment '考试类型',
		constraint `teacher_id` foreign key(`tid`) references `tb_teacher`(`tid`)
			on delete cascade on update cascade,
		constraint `course_id` foreign key(`cid`) references `tb_course`(`cid`)
			on delete cascade on update cascade		
)charset=utf8;
-- 修改成绩表
alter table tb_score add column `tid` varchar(10);
alter table tb_score add constraint `t_id` foreign key(`tid`) references `tb_teacher`(`tid`)
	on update cascade on delete cascade;

-- 修改考试安排表
alter table tb_exam add column `id` varchar(10);
alter table tb_exam add constraint `sid` foreign key(`id`) references `tb_stuinfo`(`number`)
	on update cascade on delete cascade;
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
		`cw` tinyint not null comment '周次',
		constraint `tid` foreign key(`tid`) references `tb_teacher`(`tid`),
		constraint `cid` foreign key(`cid`) references `tb_course`(`cid`)
)charset=utf8;
-- 授课表content字段补充
alter table tb_teach add column `content` varchar(20) default "暂无";
-- 创建数据表 成绩表
create table if not exists `tb_score`(
		`id` varchar(10) not null comment '学生id',
		`cid` varchar(4) not null comment '课程id',
		`cscore` tinyint not null comment '课程成绩',
		constraint `id` foreign key(`id`) references `tb_stuinfo`(`number`),
		constraint `csid` foreign key(`cid`) references `tb_course`(`cid`)
)charset=utf8; 
-- 创建数据表 登录表
create table if not EXISTS `tb_user`(
		`id` varchar(10) not null PRIMARY KEY comment '学号即账号',
		`password` varchar(20) not null comment '密码',
		`lastAlterTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP comment '上次修改密码时间',
		constraint `uid` foreign key(`id`) references `tb_stuinfo`(`number`)
)charset=utf8;
 
-- 考试清单构建insert into tb_exam values
		("t001", "c001", "综合实验楼303", "2019-11-11 9:30", "2019-11-11 11:30", 2),
		("t002", "c002", "综合实验楼302", "2019-11-20 14:40", "2019-11-20 16:40", 2),
		("t006", "c004", "北主楼204", "2019-10-23 9:30", "2019-10-23 11:30", 1),
		("t004", "c010", "北主楼401", "2019-10-14 9:30", "2019-10-14 11:30", 1);
 
-- 为登录表插入数据(学号密码相同)
insert into tb_user(`id`, `password`)
		select number, number from tb_stuinfo;
-- 修改用户表约束
ALTER TABLE tb_user DROP FOREIGN KEY uid;
ALTER TABLE tb_user add constraint `uid` FOREIGN KEY(`id`) references `tb_stuinfo`(`number`) ON DELETE CASCADE ON UPDATE CASCADE;
-- 减少数据库数据
delete from tb_stuinfo where `classnum` != '170806';
	
		
-- 教师清单构建
insert into tb_teacher values
		("t001", "老师甲", "计算机学院"),
		("t002", "老师乙", "计算机学院"),
		("t003", "老师丙", "体育部"),
		("t004", "老师丁", "外国语学院"),
		("t005", "老师戊", "物理学院"),
		("t006", "老师己", "数学学院"),
		("t007", "老师庚", "计算机学院"),
		("t008", "老师辛", "马克思主义学院")

-- 课程清单构建
insert into tb_course VALUES
		("c001", "C语言程序设计", 48, 3),
		("c002", "C++程序设计", 48, 3),
		("c004", "高等数学", 82, 5),
		("c005", "体育", 48, 3),
		("c006", "大学生健康教育", 16, 1),
		("c007", "形式与政策", 8, 1),
		("c009", "大学物理", 48, 3),
		("c010", "大学英语", 48, 3);

-- 授课清单构建
insert into tb_teach values
		("t001", "c001", "北主楼101", "11", 1),
		("t002", "c002", "北主楼202", "12", 1),
		("t003", "c005", "马观适体育馆", "33", 4),
		("t006", "c004", "北主楼303", "43", 1),
		("t007", "c006", "吕志和礼堂", "45", 4),
		("t008", "c007", "吕志和礼堂", "35", 11),
		("t005", "c009", "北主楼403", "22", 12),
		("t004", "c010", "北主楼505", "51", 12)

-- 循环插入数据
drop procedure try_insert;
create procedure try_insert()
	begin
		declare i int default 1;
			while i <= 12
			do
				insert into tb_teach values
				("t004", "c010", "北主楼505", "22", i),
				("t004", "c010", "北主楼505", "52", i);
				set i=i+1;
			end while;
		commit;
	end;
call try_insert();

-- 成绩清单构建
insert into tb_score values
		("3117005390", "c001", 79),
		("3117005390", "c002", 70),
		("3117005390", "c004", 78),
		("3117005390", "c010", 65);






























