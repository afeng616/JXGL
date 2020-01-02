/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : db_jxgl

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 02/01/2020 22:35:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_attendance
-- ----------------------------
DROP TABLE IF EXISTS `tb_attendance`;
CREATE TABLE `tb_attendance`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `date` date NOT NULL COMMENT '日期',
  `cid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `type` tinyint(4) NOT NULL COMMENT '类型',
  INDEX `aid`(`id`) USING BTREE,
  CONSTRAINT `aid` FOREIGN KEY (`id`) REFERENCES `tb_stuinfo` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_attendance
-- ----------------------------
INSERT INTO `tb_attendance` VALUES ('3117005390', '2019-09-20', 'c010', 1);

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `cid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `cname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `chours` tinyint(4) NOT NULL COMMENT '课程学时',
  `ccredit` tinyint(4) NOT NULL COMMENT '课程学分',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES ('c001', 'C语言程序设计', 48, 3);
INSERT INTO `tb_course` VALUES ('c002', 'C++程序设计', 48, 3);
INSERT INTO `tb_course` VALUES ('c004', '高等数学', 82, 5);
INSERT INTO `tb_course` VALUES ('c005', '体育', 48, 3);
INSERT INTO `tb_course` VALUES ('c006', '大学生健康教育', 16, 1);
INSERT INTO `tb_course` VALUES ('c007', '形式与政策', 16, 1);
INSERT INTO `tb_course` VALUES ('c009', '大学物理', 48, 3);
INSERT INTO `tb_course` VALUES ('c010', '大学英语', 48, 3);

-- ----------------------------
-- Table structure for tb_exam
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam`  (
  `tid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师id',
  `cid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `esite` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试地点',
  `ebtime` timestamp(0) NOT NULL COMMENT '考试时间',
  `eetime` timestamp(0) NOT NULL COMMENT '考试时间',
  `etype` tinyint(4) NOT NULL COMMENT '考试类型',
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `teacher_id`(`tid`) USING BTREE,
  INDEX `sid`(`id`) USING BTREE,
  CONSTRAINT `course_id` FOREIGN KEY (`cid`) REFERENCES `tb_course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sid` FOREIGN KEY (`id`) REFERENCES `tb_stuinfo` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_id` FOREIGN KEY (`tid`) REFERENCES `tb_teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_exam
-- ----------------------------
INSERT INTO `tb_exam` VALUES ('t001', 'c001', '综合实验楼303', '2019-11-11 09:30:00', '2019-11-11 11:30:00', 2, '3117005390');
INSERT INTO `tb_exam` VALUES ('t002', 'c002', '综合实验楼302', '2019-11-20 14:40:00', '2019-11-20 16:40:00', 2, '3117005390');
INSERT INTO `tb_exam` VALUES ('t006', 'c004', '北主楼204', '2019-10-23 09:30:00', '2019-10-23 11:30:00', 1, '3117005390');
INSERT INTO `tb_exam` VALUES ('t004', 'c010', '北主楼401', '2019-10-14 09:30:00', '2019-10-14 11:30:00', 1, '3117005390');

-- ----------------------------
-- Table structure for tb_score
-- ----------------------------
DROP TABLE IF EXISTS `tb_score`;
CREATE TABLE `tb_score`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `cid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `cscore` tinyint(4) NOT NULL COMMENT '课程成绩',
  `tid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `id`(`id`) USING BTREE,
  INDEX `csid`(`cid`) USING BTREE,
  INDEX `t_id`(`tid`) USING BTREE,
  CONSTRAINT `csid` FOREIGN KEY (`cid`) REFERENCES `tb_course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `tb_stuinfo` (`number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_id` FOREIGN KEY (`tid`) REFERENCES `tb_teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_score
-- ----------------------------
INSERT INTO `tb_score` VALUES ('3117005390', 'c001', 79, 't001');
INSERT INTO `tb_score` VALUES ('3117005390', 'c002', 70, 't002');
INSERT INTO `tb_score` VALUES ('3117005390', 'c004', 78, 't006');
INSERT INTO `tb_score` VALUES ('3117005390', 'c010', 65, 't004');

-- ----------------------------
-- Table structure for tb_stuinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_stuinfo`;
CREATE TABLE `tb_stuinfo`  (
  `number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profession` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classnum` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_stuinfo
-- ----------------------------
INSERT INTO `tb_stuinfo` VALUES ('3117004401', '陈捷怡', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004403', '郭炜锋', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004413', '岑兆安', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004416', '黄仁政', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004431', '甘益鹏', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004458', '谢振才', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004460', '陈德深', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004474', '何伟华', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004493', '马剑锋', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004494', '苏良健', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004508', '马镇涛', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004514', '江基锋', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004517', '张丹枫', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004518', '区旭辉', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004523', '杨腾辉', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004528', '尹凯生', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004529', '许水明', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004544', '林利强', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004547', '刘烈均', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004551', '梁国威', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004558', '伍圣权', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004574', '俞东亮', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004583', '刘弘YAN', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004590', '吴嘉鑫', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004596', '古日岗', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004599', '李昊燃', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004600', '杨森', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004605', '王华晖', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004611', '李逸', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004635', '莫文滔', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004639', '余达明', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004641', '李锦强', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004644', '陈叔同', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004654', '余卓奕', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004661', '杨浩钧', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004694', '林伟源', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004700', '黄锦威', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004705', '林杰城', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004717', '黄锦润', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117004726', '李宇阳', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117005094', '宁志勇', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117005149', '贺浦桐', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117005209', '张植元', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117005286', '陈旭', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117005332', '朱健峰', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3117005390', '吴海锋', '男', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3217004556', '陈贞宝', '女', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3217004593', '张慧敏', '女', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3217004637', '陈雅洁', '女', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3217004666', '邓碧莹', '女', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3217004669', '张晓', '女', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');
INSERT INTO `tb_stuinfo` VALUES ('3217004682', '谭嘉君', '女', '电子信息工程（信息安全）', '170806', '计算机学院', '正常');

-- ----------------------------
-- Table structure for tb_stuuser
-- ----------------------------
DROP TABLE IF EXISTS `tb_stuuser`;
CREATE TABLE `tb_stuuser`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号即账号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `lastAlterTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '上次修改密码时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_stuuser
-- ----------------------------
INSERT INTO `tb_stuuser` VALUES ('3117004401', '3117004401', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004403', '3117004403', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004413', '3117004413', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004416', '3117004416', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004431', '3117004431', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004458', '3117004458', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004460', '3117004460', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004474', '3117004474', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004493', '3117004493', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004494', '3117004494', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004508', '3117004508', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004514', '3117004514', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004517', '3117004517', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004518', '3117004518', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004523', '3117004523', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004528', '3117004528', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004529', '3117004529', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004544', '3117004544', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004547', '3117004547', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004551', '3117004551', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004558', '3117004558', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004574', '3117004574', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004583', '3117004583', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004590', '3117004590', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004596', '3117004596', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004599', '3117004599', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004600', '3117004600', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004605', '3117004605', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004611', '3117004611', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004635', '3117004635', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004639', '3117004639', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004641', '3117004641', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004644', '3117004644', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004654', '3117004654', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004661', '3117004661', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004694', '3117004694', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004700', '3117004700', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004705', '3117004705', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004717', '3117004717', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117004726', '3117004726', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117005094', '3117005094', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117005149', '3117005149', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117005209', '3117005209', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117005286', '3117005286', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117005332', '3117005332', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3117005390', '3117005390', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3217004556', '3217004556', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3217004593', '3217004593', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3217004637', '3217004637', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3217004666', '3217004666', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3217004669', '3217004669', '2019-12-27 11:12:54');
INSERT INTO `tb_stuuser` VALUES ('3217004682', '3217004682', '2019-12-27 11:12:54');

-- ----------------------------
-- Table structure for tb_tchuser
-- ----------------------------
DROP TABLE IF EXISTS `tb_tchuser`;
CREATE TABLE `tb_tchuser`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号即账号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `lastAlterTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '上次修改密码时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tchuser
-- ----------------------------
INSERT INTO `tb_tchuser` VALUES ('t001', 't001', '2019-12-31 16:49:36');
INSERT INTO `tb_tchuser` VALUES ('t002', 't002', '2019-12-31 16:49:36');
INSERT INTO `tb_tchuser` VALUES ('t003', 't003', '2019-12-31 16:49:36');
INSERT INTO `tb_tchuser` VALUES ('t004', 't004', '2019-12-31 16:49:36');
INSERT INTO `tb_tchuser` VALUES ('t005', 't005', '2019-12-31 16:49:36');
INSERT INTO `tb_tchuser` VALUES ('t006', 't006', '2019-12-31 16:49:36');
INSERT INTO `tb_tchuser` VALUES ('t007', 't007', '2019-12-31 16:49:36');
INSERT INTO `tb_tchuser` VALUES ('t008', 't008', '2019-12-31 16:49:36');

-- ----------------------------
-- Table structure for tb_teach
-- ----------------------------
DROP TABLE IF EXISTS `tb_teach`;
CREATE TABLE `tb_teach`  (
  `tid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师id',
  `cid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `csite` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授课地点',
  `ctime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授课时间',
  `cw` tinyint(4) NOT NULL COMMENT '周次',
  `content` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂无',
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `tb_course` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tid` FOREIGN KEY (`tid`) REFERENCES `tb_teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_teach
-- ----------------------------
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '11', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t001', 'c001', '北主楼101', '31', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '12', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t002', 'c002', '北主楼202', '32', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 15, '暂无');
INSERT INTO `tb_teach` VALUES ('t003', 'c005', '马观适体育馆', '33', 16, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '21', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '41', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t006', 'c004', '北主楼303', '42', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t007', 'c006', '吕志和礼堂', '45', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t008', 'c007', '吕志和礼堂', '35', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t008', 'c007', '吕志和礼堂', '35', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t008', 'c007', '吕志和礼堂', '35', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t008', 'c007', '吕志和礼堂', '35', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 13, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 14, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 15, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 15, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 15, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 16, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 16, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 16, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 17, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 17, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 17, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '13', 18, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '53', 18, '暂无');
INSERT INTO `tb_teach` VALUES ('t005', 'c009', '北主楼403', '54', 18, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 1, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 2, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 3, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 4, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 5, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 6, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 7, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 8, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 9, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 10, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 11, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '22', 12, '暂无');
INSERT INTO `tb_teach` VALUES ('t004', 'c010', '北主楼505', '52', 12, '暂无');

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `tid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师id',
  `tname` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `faculty` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作部门/学院',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES ('t001', '老师甲', '计算机学院', '男');
INSERT INTO `tb_teacher` VALUES ('t002', '老师乙', '计算机学院', '女');
INSERT INTO `tb_teacher` VALUES ('t003', '老师丙', '体育部', '男');
INSERT INTO `tb_teacher` VALUES ('t004', '老师丁', '外国语学院', '男');
INSERT INTO `tb_teacher` VALUES ('t005', '老师戊', '物理学院', '女');
INSERT INTO `tb_teacher` VALUES ('t006', '老师己', '数学学院', '男');
INSERT INTO `tb_teacher` VALUES ('t007', '老师庚', '计算机学院', '男');
INSERT INTO `tb_teacher` VALUES ('t008', '老师辛', '马克思主义学院', '女');

-- ----------------------------
-- Table structure for tb_warn
-- ----------------------------
DROP TABLE IF EXISTS `tb_warn`;
CREATE TABLE `tb_warn`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `semester` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学期',
  `classnum` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级',
  `type` tinyint(4) NOT NULL COMMENT '预警类型',
  INDEX `wid`(`id`) USING BTREE,
  CONSTRAINT `wid` FOREIGN KEY (`id`) REFERENCES `tb_stuinfo` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_warn
-- ----------------------------
INSERT INTO `tb_warn` VALUES ('3117005390', '2018-2019', '170806', 1);

SET FOREIGN_KEY_CHECKS = 1;
