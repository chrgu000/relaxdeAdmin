/*
Navicat MySQL Data Transfer

Source Server         : ikuang_new
Source Server Version : 50628
Source Host           : sh-cdb-mwf0h7ig.sql.tencentcdb.com:62879
Source Database       : relaxed

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2019-03-22 15:53:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fa_activity
-- ----------------------------
DROP TABLE IF EXISTS `fa_activity`;
CREATE TABLE `fa_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `weigh` int(10) NOT NULL COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='活动管理';

-- ----------------------------
-- Records of fa_activity
-- ----------------------------
INSERT INTO `fa_activity` VALUES ('1', '/uploads/20180929/66d1124d2d42990b62508ba7edb112d3.png', '大转盘', '每日大奖直接拿', '', '1538186734', 'normal', '3');
INSERT INTO `fa_activity` VALUES ('2', '/uploads/20180929/72282e613ded005dcae1ef4e2e78e27a.png', '兑奖换彩票', '今天是个黄道吉日', 'https://h5.18178.net/#/lottery', '1538187009', 'hidden', '2');
INSERT INTO `fa_activity` VALUES ('3', '/uploads/20181115/e9081a40364205ed180c44ceee551e37.png', '免费抽iPhone Xs', '大转盘，转出你的爱', '', '1538187120', 'normal', '1');

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', 'admin', 'Admin', '07dc622b631c23e59f9256b9f43afa9c', 'LgKbRy', '/assets/img/avatar.png', 'admin@fastadmin.net', '0', '1553156888', '1492186163', '1553156888', '2b128c7b-8114-4f0f-8d6d-6ca1fc6f2813', 'normal');
INSERT INTO `fa_admin` VALUES ('6', 'picc', 'picc', '60ed75352cc01367541f403527b76f8a', 'KznH0k', '/assets/img/avatar.png', 'picc@ikuang.info', '0', '1553233989', '1552617904', '1553233989', 'd8f8f36c-ad25-4687-a6e4-50570ae00cca', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES ('1', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"8fe68eb11682259248bfe2f4b83862cb\",\"username\":\"admin\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552554491');
INSERT INTO `fa_admin_log` VALUES ('2', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,13,14,11,10,8,12,3\",\"changeid\":\"13\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555148');
INSERT INTO `fa_admin_log` VALUES ('3', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,13,14,11,10,8,12,3\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555151');
INSERT INTO `fa_admin_log` VALUES ('4', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"13,6,14,10,11,8,12,3\",\"changeid\":\"11\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555158');
INSERT INTO `fa_admin_log` VALUES ('5', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"3,13,6,14,11,10,8,12\",\"changeid\":\"3\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555163');
INSERT INTO `fa_admin_log` VALUES ('6', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"13,6,14,11,10,8,3,12\",\"changeid\":\"12\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555169');
INSERT INTO `fa_admin_log` VALUES ('7', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"13,6,14,11,10,8,3,12\",\"changeid\":\"12\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555173');
INSERT INTO `fa_admin_log` VALUES ('8', '1', 'admin', '/relaxed/public/index.php/admin/turntable/edit/ids/12?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190314\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"100\",\"weigh\":\"1\"},\"ids\":\"12\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555196');
INSERT INTO `fa_admin_log` VALUES ('9', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"13,6,14,11,10,8,12,3\",\"changeid\":\"3\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555248');
INSERT INTO `fa_admin_log` VALUES ('10', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"12,8,3,10,11,14,6,13\",\"changeid\":\"3\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555253');
INSERT INTO `fa_admin_log` VALUES ('11', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"12,8,3,10,11,14,6,13\",\"changeid\":\"3\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555256');
INSERT INTO `fa_admin_log` VALUES ('12', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"12,8,3,10,11,14,6,13\",\"changeid\":\"8\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555259');
INSERT INTO `fa_admin_log` VALUES ('13', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"8,12,3,10,11,14,6,13\",\"changeid\":\"8\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555263');
INSERT INTO `fa_admin_log` VALUES ('14', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"3,12,8,10,11,14,6,13\",\"changeid\":\"3\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555267');
INSERT INTO `fa_admin_log` VALUES ('15', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,12,3,8,11,14,6,13\",\"changeid\":\"10\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555270');
INSERT INTO `fa_admin_log` VALUES ('16', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"3005ddca2da4118791698163ed6b1a3f\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555283');
INSERT INTO `fa_admin_log` VALUES ('17', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,3,8,12,11,14,13,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555304');
INSERT INTO `fa_admin_log` VALUES ('18', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,3,8,12,11,14,13,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555322');
INSERT INTO `fa_admin_log` VALUES ('19', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,3,8,12,11,14,13,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555325');
INSERT INTO `fa_admin_log` VALUES ('20', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,3,8,12,11,14,13,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555329');
INSERT INTO `fa_admin_log` VALUES ('21', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"3,10,8,12,11,14,6,13\",\"changeid\":\"10\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555332');
INSERT INTO `fa_admin_log` VALUES ('22', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,8,12,3,11,14,6,13\",\"changeid\":\"3\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555336');
INSERT INTO `fa_admin_log` VALUES ('23', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,3,8,12,11,14,13,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555403');
INSERT INTO `fa_admin_log` VALUES ('24', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"10,3,8,12,11,14,13,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555406');
INSERT INTO `fa_admin_log` VALUES ('25', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"3,10,8,12,11,14,6,13\",\"changeid\":\"10\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555410');
INSERT INTO `fa_admin_log` VALUES ('26', '1', 'admin', '/relaxed/public/index.php/admin/turntable/edit/ids/13?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190314\\/51d9751b01230485990b16f99f5d9b08.png\",\"name\":\"\\u8c22\\u8c22\\u53c2\\u4e0e\",\"pid\":\"4\",\"num\":\"1\",\"face_value\":\"-1\",\"value\":\"-1\",\"probability\":\"5839\",\"weigh\":\"1\"},\"ids\":\"13\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555419');
INSERT INTO `fa_admin_log` VALUES ('27', '1', 'admin', '/relaxed/public/index.php/admin/turntable/edit/ids/6?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181101\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"50\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"50\",\"value\":\"50\",\"probability\":\"50\",\"weigh\":\"2\"},\"ids\":\"6\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555425');
INSERT INTO `fa_admin_log` VALUES ('28', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"14,13,12,11,10,8,3,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555486');
INSERT INTO `fa_admin_log` VALUES ('29', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"13,14,12,11,10,8,6,3\",\"changeid\":\"14\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555493');
INSERT INTO `fa_admin_log` VALUES ('30', '1', 'admin', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"13,12,11,10,8,14,6,3\",\"changeid\":\"14\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552555501');
INSERT INTO `fa_admin_log` VALUES ('31', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login', '登录', '{\"__token__\":\"887401f31a17b1fb5ef8ec7afea5c207\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '1552557775');
INSERT INTO `fa_admin_log` VALUES ('32', '1', 'admin', '/relaxed/public/index.php/admin/index/login', '登录', '{\"__token__\":\"e5300020708a9611721f060e4a540d39\",\"username\":\"admin\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '1552557788');
INSERT INTO `fa_admin_log` VALUES ('33', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"d4f18246e604174b0bfedf5ac609ce26\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552559406');
INSERT INTO `fa_admin_log` VALUES ('34', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"292aa380e4bae4160757cf11e5f48854\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552559409');
INSERT INTO `fa_admin_log` VALUES ('35', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"a88b4bdf3a598afce0ed8f228756854d\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552559412');
INSERT INTO `fa_admin_log` VALUES ('36', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"cfe7929ccef5da7d3547bd7f8a46a6c4\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552559420');
INSERT INTO `fa_admin_log` VALUES ('37', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"b1e179b7c152f782aae77c2923baf2b0\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552559444');
INSERT INTO `fa_admin_log` VALUES ('38', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login', '登录', '{\"__token__\":\"fa15f5bc579c90074115d4860d4db813\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552611956');
INSERT INTO `fa_admin_log` VALUES ('39', '1', 'admin', '/relaxed/public/index.php/admin/index/login', '登录', '{\"__token__\":\"fed9d2319e14db965c3fcc0091dfc15e\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552611963');
INSERT INTO `fa_admin_log` VALUES ('40', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"games\",\"title\":\"\\u6e38\\u620f\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552613050');
INSERT INTO `fa_admin_log` VALUES ('41', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552613051');
INSERT INTO `fa_admin_log` VALUES ('42', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"gslideshow\",\"title\":\"\\u6e38\\u620f\\u8f6e\\u64ad\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552613111');
INSERT INTO `fa_admin_log` VALUES ('43', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552613113');
INSERT INTO `fa_admin_log` VALUES ('44', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"invite\",\"title\":\"\\u9080\\u8bf7\\u597d\\u53cb\\u62ff\\u73b0\\u91d1\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552613184');
INSERT INTO `fa_admin_log` VALUES ('45', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552613186');
INSERT INTO `fa_admin_log` VALUES ('46', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"notice\",\"title\":\"\\u901a\\u77e5\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615446');
INSERT INTO `fa_admin_log` VALUES ('47', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615448');
INSERT INTO `fa_admin_log` VALUES ('48', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"product12\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615619');
INSERT INTO `fa_admin_log` VALUES ('49', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615621');
INSERT INTO `fa_admin_log` VALUES ('50', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"turndesc\",\"title\":\"\\u8f6c\\u76d8\\u63cf\\u8ff0\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615699');
INSERT INTO `fa_admin_log` VALUES ('51', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615701');
INSERT INTO `fa_admin_log` VALUES ('52', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"turntable\",\"title\":\"\\u8f6c\\u76d8\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615794');
INSERT INTO `fa_admin_log` VALUES ('53', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615796');
INSERT INTO `fa_admin_log` VALUES ('54', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"turntableconfig\",\"title\":\"\\u8f6c\\u76d8\\u914d\\u7f6e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615833');
INSERT INTO `fa_admin_log` VALUES ('55', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615835');
INSERT INTO `fa_admin_log` VALUES ('56', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"0a33a05a2fb594ecc28934b1d9c2966a\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552615856');
INSERT INTO `fa_admin_log` VALUES ('57', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"fced8798800b6b36b3dce394b6ce2788\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552615859');
INSERT INTO `fa_admin_log` VALUES ('58', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"usergift\",\"title\":\"\\u65b0\\u624b\\u793c\\u5305\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615878');
INSERT INTO `fa_admin_log` VALUES ('59', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615880');
INSERT INTO `fa_admin_log` VALUES ('60', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"ae3fdf36f5602019d34ad1534a842827\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552615890');
INSERT INTO `fa_admin_log` VALUES ('61', '0', 'Unknown', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"a0c754ab9f2b8229ec7a4db7a44d132c\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552615894');
INSERT INTO `fa_admin_log` VALUES ('62', '1', 'admin', '/happly/public/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"userslishow\",\"title\":\"\\u7528\\u6237\\u80cc\\u666f\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615912');
INSERT INTO `fa_admin_log` VALUES ('63', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615915');
INSERT INTO `fa_admin_log` VALUES ('64', '1', 'admin', '/happly/public/index.php/admin/auth/rule/edit/ids/94?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"userslideshow\",\"title\":\"\\u7528\\u6237\\u80cc\\u666f\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"94\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615947');
INSERT INTO `fa_admin_log` VALUES ('65', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552615949');
INSERT INTO `fa_admin_log` VALUES ('66', '1', 'admin', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"bd9564c48972f272e5770cb0bc34c859.png\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616203');
INSERT INTO `fa_admin_log` VALUES ('67', '1', 'admin', '/happly/public/index.php/admin/turntable/edit/ids/14?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"5\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"5\",\"value\":\"5\",\"probability\":\"4000\"},\"ids\":\"14\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616205');
INSERT INTO `fa_admin_log` VALUES ('68', '1', 'admin', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"51d9751b01230485990b16f99f5d9b08.png\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616212');
INSERT INTO `fa_admin_log` VALUES ('69', '1', 'admin', '/happly/public/index.php/admin/turntable/edit/ids/13?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/51d9751b01230485990b16f99f5d9b08.png\",\"name\":\"\\u8c22\\u8c22\\u53c2\\u4e0e\",\"pid\":\"4\",\"num\":\"1\",\"face_value\":\"-1\",\"value\":\"-1\",\"probability\":\"5839\"},\"ids\":\"13\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616214');
INSERT INTO `fa_admin_log` VALUES ('70', '1', 'admin', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"bd9564c48972f272e5770cb0bc34c859.png\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616224');
INSERT INTO `fa_admin_log` VALUES ('71', '1', 'admin', '/happly/public/index.php/admin/turntable/edit/ids/12?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"100\"},\"ids\":\"12\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616226');
INSERT INTO `fa_admin_log` VALUES ('72', '1', 'admin', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"5f7a024aa56afad67b72aa9bd5cefa10.png\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616255');
INSERT INTO `fa_admin_log` VALUES ('73', '1', 'admin', '/happly/public/index.php/admin/turntable/edit/ids/11?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/5f7a024aa56afad67b72aa9bd5cefa10.png\",\"name\":\"10\\u5143\\u4eac\\u4e1c\\u5361\",\"pid\":\"6\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"2000\",\"probability\":\"0\"},\"ids\":\"11\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616256');
INSERT INTO `fa_admin_log` VALUES ('74', '1', 'admin', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"bd9564c48972f272e5770cb0bc34c859.png\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616275');
INSERT INTO `fa_admin_log` VALUES ('75', '1', 'admin', '/happly/public/index.php/admin/turntable/edit/ids/10?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"200\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"200\",\"value\":\"200\",\"probability\":\"10\"},\"ids\":\"10\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552616276');
INSERT INTO `fa_admin_log` VALUES ('76', '1', 'admin', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"bd9564c48972f272e5770cb0bc34c859.png\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617063');
INSERT INTO `fa_admin_log` VALUES ('77', '1', 'admin', '/happly/public/index.php/admin/turntable/edit/ids/8?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"5\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"5\",\"value\":\"5\",\"probability\":\"4000\"},\"ids\":\"8\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617066');
INSERT INTO `fa_admin_log` VALUES ('78', '1', 'admin', '/happly/public/index.php/admin/auth/group/del/ids/3,5,4', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"3,5,4\",\"params\":\"\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617664');
INSERT INTO `fa_admin_log` VALUES ('79', '1', 'admin', '/happly/public/index.php/admin/auth/group/del/ids/3,5', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"3,5\",\"params\":\"\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617672');
INSERT INTO `fa_admin_log` VALUES ('80', '1', 'admin', '/happly/public/index.php/admin/auth/group/del/ids/5', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617687');
INSERT INTO `fa_admin_log` VALUES ('81', '1', 'admin', '/happly/public/index.php/admin/auth/admin/del/ids/5,4,3,2', '权限管理 管理员管理 删除', '{\"action\":\"del\",\"ids\":\"5,4,3,2\",\"params\":\"\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617699');
INSERT INTO `fa_admin_log` VALUES ('82', '1', 'admin', '/happly/public/index.php/admin/auth/group/del/ids/3,5', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"3,5\",\"params\":\"\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617704');
INSERT INTO `fa_admin_log` VALUES ('83', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617707');
INSERT INTO `fa_admin_log` VALUES ('84', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,6,7,8,2,9,10,11,4,5\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617713');
INSERT INTO `fa_admin_log` VALUES ('85', '1', 'admin', '/happly/public/index.php/admin/auth/admin/add?dialog=1', '权限管理 管理员管理 添加', '{\"dialog\":\"1\",\"group\":[\"2\"],\"row\":{\"username\":\"picc\",\"email\":\"picc@ikuang.info\",\"nickname\":\"picc\",\"password\":\"123456\",\"status\":\"normal\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617904');
INSERT INTO `fa_admin_log` VALUES ('86', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617911');
INSERT INTO `fa_admin_log` VALUES ('87', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"8,9,10,11,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,2,5\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617970');
INSERT INTO `fa_admin_log` VALUES ('88', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"e61c7c5d65e7a6d7157cb5f062eb3b7d\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552617978');
INSERT INTO `fa_admin_log` VALUES ('89', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"4d10b9f7a4ab1704f4778bf07c138506\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618155');
INSERT INTO `fa_admin_log` VALUES ('90', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"fbf5f142faa6a4b99b5372c960683cd6\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618165');
INSERT INTO `fa_admin_log` VALUES ('91', '1', 'admin', '/happly/public/index.php/admin/auth/rule/edit/ids/91?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"turntable\",\"title\":\"\\u8f6c\\u76d8\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"145\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"91\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618203');
INSERT INTO `fa_admin_log` VALUES ('92', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618205');
INSERT INTO `fa_admin_log` VALUES ('93', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"fcddf8654f326e0d41806bf21b12428d\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618247');
INSERT INTO `fa_admin_log` VALUES ('94', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"82fa2eab7607013bc0dded40176068d9\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618260');
INSERT INTO `fa_admin_log` VALUES ('95', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"7b57810e323225ca3db4bb95535ff08c\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618271');
INSERT INTO `fa_admin_log` VALUES ('96', '1', 'admin', '/happly/public/index.php/admin/auth/rule/edit/ids/91?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"turntable\",\"title\":\"\\u8f6c\\u76d8\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"33\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"91\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618385');
INSERT INTO `fa_admin_log` VALUES ('97', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618388');
INSERT INTO `fa_admin_log` VALUES ('98', '1', 'admin', '/happly/public/index.php/admin/auth/rule/edit/ids/91?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"turntable\",\"title\":\"\\u8f6c\\u76d8\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"91\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618400');
INSERT INTO `fa_admin_log` VALUES ('99', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618403');
INSERT INTO `fa_admin_log` VALUES ('100', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552618997');
INSERT INTO `fa_admin_log` VALUES ('101', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"8,9,10,11,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,2,5\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552619005');
INSERT INTO `fa_admin_log` VALUES ('102', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"95d71d5bcfa1a20ab71856ebb0deb565\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552619015');
INSERT INTO `fa_admin_log` VALUES ('103', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"4142d0f49898d4435b03919f91eebf06\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552619828');
INSERT INTO `fa_admin_log` VALUES ('104', '6', 'picc', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"fb5b3c1c93de204d71578f9585ef98bf\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620114');
INSERT INTO `fa_admin_log` VALUES ('105', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620471');
INSERT INTO `fa_admin_log` VALUES ('106', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"8,9,10,11,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,107,108,112,116,117,118,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,2,5\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620480');
INSERT INTO `fa_admin_log` VALUES ('107', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620485');
INSERT INTO `fa_admin_log` VALUES ('108', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,68,69,70,71,72,95,96,97,98,99,100,101,102,107,108,112,116,117,118,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,8,9,10,11,67,85,86,87,88,89,90,91,92,93,94,2,5,66\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620494');
INSERT INTO `fa_admin_log` VALUES ('109', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"f11df35f4617d5ae68a3648c17d3163a\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620502');
INSERT INTO `fa_admin_log` VALUES ('110', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"ae29a61b50c72f958ae43cd3ab7bf847\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620614');
INSERT INTO `fa_admin_log` VALUES ('111', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620641');
INSERT INTO `fa_admin_log` VALUES ('112', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,68,69,70,71,72,95,96,97,98,99,100,101,102,107,108,112,116,117,118,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,8,9,10,11,67,85,86,87,88,89,90,92,93,94,2,5,66,91\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620648');
INSERT INTO `fa_admin_log` VALUES ('113', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"b347da2b42e75951ca78db0b473f75f9\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620656');
INSERT INTO `fa_admin_log` VALUES ('114', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"2400c7982b696fbfdb89aeb5a3baab06\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620676');
INSERT INTO `fa_admin_log` VALUES ('115', '1', 'admin', '/happly/public/index.php/admin/general.profile/update', '常规管理 个人配置 更新个人信息', '{\"row\":{\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"email\":\"admin@fastadmin.net\",\"nickname\":\"Admin\",\"password\":\"admin1026\"}}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552620691');
INSERT INTO `fa_admin_log` VALUES ('116', '6', 'picc', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"9507da0598238316568a9bb7bc6ddf61\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620746');
INSERT INTO `fa_admin_log` VALUES ('117', '6', 'picc', '/relaxed/public/index.php/admin/ajax/upload', '', '{\"name\":\"bd9564c48972f272e5770cb0bc34c859.png\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620799');
INSERT INTO `fa_admin_log` VALUES ('118', '6', 'picc', '/relaxed/public/index.php/admin/turntable/edit/ids/7?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"2\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"2\",\"value\":\"2\",\"probability\":\"5839\",\"weigh\":\"7\"},\"ids\":\"7\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620839');
INSERT INTO `fa_admin_log` VALUES ('119', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,6,4,5,8,3,2,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620858');
INSERT INTO `fa_admin_log` VALUES ('120', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,1,6,4,5,8,3,2\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620874');
INSERT INTO `fa_admin_log` VALUES ('121', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,1,6,4,5,8,3,2\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620882');
INSERT INTO `fa_admin_log` VALUES ('122', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,6,4,1,5,8,3,2\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620889');
INSERT INTO `fa_admin_log` VALUES ('123', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,4,5,8,3,2,7,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620893');
INSERT INTO `fa_admin_log` VALUES ('124', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,8,5,2,3,6,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620903');
INSERT INTO `fa_admin_log` VALUES ('125', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,8,2,5,3,6,7,1\",\"changeid\":\"3\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620911');
INSERT INTO `fa_admin_log` VALUES ('126', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,8,2,5,3,6,7,1\",\"changeid\":\"3\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620930');
INSERT INTO `fa_admin_log` VALUES ('127', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,8,2,3,5,6,7,1\",\"changeid\":\"3\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620934');
INSERT INTO `fa_admin_log` VALUES ('128', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,8,2,5,6,7,1\",\"changeid\":\"3\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620974');
INSERT INTO `fa_admin_log` VALUES ('129', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,8,2,5,3,6,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552620983');
INSERT INTO `fa_admin_log` VALUES ('130', '6', 'picc', '/relaxed/public/index.php/admin/turntable/edit/ids/3?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181101\\/b982b33c030a20350d23dd2fa53e6d37.png\",\"name\":\"2\\u5143\\u8bdd\\u8d39\",\"pid\":\"\\u8bdd\\u8d39-5\",\"num\":\"1\",\"face_value\":\"2\",\"value\":\"400\",\"probability\":\"1\",\"weigh\":\"9\"},\"ids\":\"3\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621000');
INSERT INTO `fa_admin_log` VALUES ('131', '6', 'picc', '/relaxed/public/index.php/admin/turntable/edit/ids/6?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"100\",\"weigh\":\"3\"},\"ids\":\"6\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621022');
INSERT INTO `fa_admin_log` VALUES ('132', '6', 'picc', '/relaxed/public/index.php/admin/turntable/edit/ids/3?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181101\\/b982b33c030a20350d23dd2fa53e6d37.png\",\"name\":\"2\\u5143\\u8bdd\\u8d39\",\"pid\":\"\\u8bdd\\u8d39-5\",\"num\":\"1\",\"face_value\":\"2\",\"value\":\"400\",\"probability\":\"1\",\"weigh\":\"4\"},\"ids\":\"3\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621033');
INSERT INTO `fa_admin_log` VALUES ('133', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,5,3,6,8,7,1\",\"changeid\":\"8\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621069');
INSERT INTO `fa_admin_log` VALUES ('134', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,5,6,3,8,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621082');
INSERT INTO `fa_admin_log` VALUES ('135', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,5,6,3,8,7,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621089');
INSERT INTO `fa_admin_log` VALUES ('136', '6', 'picc', '/relaxed/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,5,6,3,8,7,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621100');
INSERT INTO `fa_admin_log` VALUES ('137', '6', 'picc', '/relaxed/public/index.php/admin/turntable/edit/ids/5?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/5f7a024aa56afad67b72aa9bd5cefa10.png\",\"name\":\"10\\u5143\\u4eac\\u4e1c\\u5361\",\"pid\":\"6\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"2000\",\"probability\":\"0\",\"weigh\":\"9\"},\"ids\":\"5\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621119');
INSERT INTO `fa_admin_log` VALUES ('138', '6', 'picc', '/relaxed/public/index.php/admin/turntable/edit/ids/6?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"100\",\"weigh\":\"5\"},\"ids\":\"6\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621126');
INSERT INTO `fa_admin_log` VALUES ('139', '6', 'picc', '/relaxed/public/index.php/admin/turntable/edit/ids/5?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/5f7a024aa56afad67b72aa9bd5cefa10.png\",\"name\":\"10\\u5143\\u4eac\\u4e1c\\u5361\",\"pid\":\"6\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"2000\",\"probability\":\"0\",\"weigh\":\"6\"},\"ids\":\"5\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621133');
INSERT INTO `fa_admin_log` VALUES ('140', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"e9c251e33e5f3788a69b736fcfbcb983\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552621321');
INSERT INTO `fa_admin_log` VALUES ('141', '6', 'picc', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"500125e9e6950e2fb8a9733eca148ab4\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552621679');
INSERT INTO `fa_admin_log` VALUES ('142', '0', 'Unknown', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"876c091b2d97a4901ea79782b1f8b163\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552622061');
INSERT INTO `fa_admin_log` VALUES ('143', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"c35afdd61d29f764a8c999e891899899\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552622067');
INSERT INTO `fa_admin_log` VALUES ('144', '6', 'picc', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"6a2af6b587dfce59054dbdd9f441e99a\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552622082');
INSERT INTO `fa_admin_log` VALUES ('145', '6', 'picc', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"d0b8c2155a4128bf82050255c3c0cc88\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '1552622295');
INSERT INTO `fa_admin_log` VALUES ('146', '1', 'admin', '/relaxed/public/index.php/admin/index/login', '登录', '{\"__token__\":\"c6c1112e3f9277e9ffafd2179d3d0ac3\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '1552622337');
INSERT INTO `fa_admin_log` VALUES ('147', '6', 'picc', '/happly/public/index.php/admin/turntableconfig/edit/ids/1?dialog=1', '转盘配置 编辑', '{\"dialog\":\"1\",\"row\":{\"num\":\"1\",\"astrict\":\"1000\",\"status\":\"normal\"},\"ids\":\"1\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552622557');
INSERT INTO `fa_admin_log` VALUES ('148', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"fc3dd15838bdeac1904d53b4b8f34b0f\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552624424');
INSERT INTO `fa_admin_log` VALUES ('149', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"93cfc2bfb55f3cc980384082bcadafc7\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552624443');
INSERT INTO `fa_admin_log` VALUES ('150', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"65b04b38e0dc164231121abe6b404f68\",\"username\":\"picc\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552624555');
INSERT INTO `fa_admin_log` VALUES ('151', '6', 'picc', '/happly/public/index.php/admin/index/login?url=%2Fhapply%2Fpublic%2Findex.php%2Fadmin%2Fturntable%2Fedit%2Fids%2F4%3Fdialog%3D1', '登录', '{\"url\":\"\\/happly\\/public\\/index.php\\/admin\\/turntable\\/edit\\/ids\\/4?dialog=1\",\"__token__\":\"8b91dce7fac0b6e785f32ae278caa2fa\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552629967');
INSERT INTO `fa_admin_log` VALUES ('152', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"51d9751b01230485990b16f99f5d9b08.png\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552629980');
INSERT INTO `fa_admin_log` VALUES ('153', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/4?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/51d9751b01230485990b16f99f5d9b08.png\",\"name\":\"\\u8c22\\u8c22\\u53c2\\u4e0e\",\"pid\":\"4\",\"num\":\"1\",\"face_value\":\"-1\",\"value\":\"0\",\"probability\":\"899\"},\"ids\":\"4\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630021');
INSERT INTO `fa_admin_log` VALUES ('154', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/7?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"2\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"2\",\"value\":\"2\",\"probability\":\"4500\"},\"ids\":\"7\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630041');
INSERT INTO `fa_admin_log` VALUES ('155', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/6?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"500\"},\"ids\":\"6\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630066');
INSERT INTO `fa_admin_log` VALUES ('156', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/2?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181101\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"50\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"50\",\"value\":\"50\",\"probability\":\"100\"},\"ids\":\"2\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630077');
INSERT INTO `fa_admin_log` VALUES ('157', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"8,5,7,6,4,3,2,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630144');
INSERT INTO `fa_admin_log` VALUES ('158', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"8,6,5,7,4,3,2,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630153');
INSERT INTO `fa_admin_log` VALUES ('159', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"8,5,7,6,4,3,2,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630158');
INSERT INTO `fa_admin_log` VALUES ('160', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"8,7,6,5,4,8,3,2,1\",\"changeid\":\"8\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630239');
INSERT INTO `fa_admin_log` VALUES ('161', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,6,5,8,4,3,2,1\",\"changeid\":\"8\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552630273');
INSERT INTO `fa_admin_log` VALUES ('162', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"575c6612b21714b2d20606cda8c08c39\",\"username\":\"admin\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631333');
INSERT INTO `fa_admin_log` VALUES ('163', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"8,7,6,5,4,3,1,2\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631344');
INSERT INTO `fa_admin_log` VALUES ('164', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,8,6,5,4,3,2,1\",\"changeid\":\"8\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631364');
INSERT INTO `fa_admin_log` VALUES ('165', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,8,6,5,4,3,2,1\",\"changeid\":\"8\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631367');
INSERT INTO `fa_admin_log` VALUES ('166', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,6,8,5,4,3,2,1\",\"changeid\":\"8\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631368');
INSERT INTO `fa_admin_log` VALUES ('167', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,1,7,8,2,3,5,4\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631563');
INSERT INTO `fa_admin_log` VALUES ('168', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,5,3,2,8,7,1,6\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631566');
INSERT INTO `fa_admin_log` VALUES ('169', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,5,3,2,8,6,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631573');
INSERT INTO `fa_admin_log` VALUES ('170', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631587');
INSERT INTO `fa_admin_log` VALUES ('171', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"8,9,10,11,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,85,86,87,88,89,90,93,94,95,96,97,98,99,100,101,102,107,108,112,116,117,118,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,2,5,66\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552631590');
INSERT INTO `fa_admin_log` VALUES ('172', '6', 'picc', '/happly/public/index.php/admin/index/login?url=%2Fhapply%2Fpublic%2Findex.php%2Fadmin%2Fgeneral%2Fprofile%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/happly\\/public\\/index.php\\/admin\\/general\\/profile?ref=addtabs\",\"__token__\":\"aa2e45dd735c58c275e8ea5f4a1554a9\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552631999');
INSERT INTO `fa_admin_log` VALUES ('173', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,2,8,6,5,7,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632040');
INSERT INTO `fa_admin_log` VALUES ('174', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,2,8,5,6,7,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632049');
INSERT INTO `fa_admin_log` VALUES ('175', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,2,8,6,5,7,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632055');
INSERT INTO `fa_admin_log` VALUES ('176', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,5,7,3,2,8,6,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632059');
INSERT INTO `fa_admin_log` VALUES ('177', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,5,3,6,7,2,8,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632072');
INSERT INTO `fa_admin_log` VALUES ('178', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,6,7,2,8,5,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632079');
INSERT INTO `fa_admin_log` VALUES ('179', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,6,7,2,8,5,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632082');
INSERT INTO `fa_admin_log` VALUES ('180', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,7,5,3,6,2,8,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632086');
INSERT INTO `fa_admin_log` VALUES ('181', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"8,4,5,3,7,6,2,1\",\"changeid\":\"8\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632089');
INSERT INTO `fa_admin_log` VALUES ('182', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,5,3,8,7,6,1\",\"changeid\":\"2\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632095');
INSERT INTO `fa_admin_log` VALUES ('183', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"7,4,5,3,2,8,6,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632106');
INSERT INTO `fa_admin_log` VALUES ('184', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,5,7,2,8,6,1\",\"changeid\":\"3\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632115');
INSERT INTO `fa_admin_log` VALUES ('185', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,5,7,2,8,6,1\",\"changeid\":\"3\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632118');
INSERT INTO `fa_admin_log` VALUES ('186', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,7,2,8,5,6,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632135');
INSERT INTO `fa_admin_log` VALUES ('187', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,7,2,8,6,5,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632139');
INSERT INTO `fa_admin_log` VALUES ('188', '6', 'picc', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,3,7,2,8,5,6,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632144');
INSERT INTO `fa_admin_log` VALUES ('189', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/6?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"500\",\"weigh\":\"29\"},\"ids\":\"6\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632199');
INSERT INTO `fa_admin_log` VALUES ('190', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/7?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"2\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"2\",\"value\":\"2\",\"probability\":\"4500\",\"weigh\":\"2\"},\"ids\":\"7\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632209');
INSERT INTO `fa_admin_log` VALUES ('191', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/8?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"5\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"5\",\"value\":\"5\",\"probability\":\"4000\",\"weigh\":\"23\"},\"ids\":\"8\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632220');
INSERT INTO `fa_admin_log` VALUES ('192', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/5?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/5f7a024aa56afad67b72aa9bd5cefa10.png\",\"name\":\"10\\u5143\\u4eac\\u4e1c\\u5361\",\"pid\":\"6\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"2000\",\"probability\":\"0\",\"weigh\":\"3\"},\"ids\":\"5\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632230');
INSERT INTO `fa_admin_log` VALUES ('193', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/2?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181101\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"50\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"50\",\"value\":\"50\",\"probability\":\"100\",\"weigh\":\"44\"},\"ids\":\"2\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632240');
INSERT INTO `fa_admin_log` VALUES ('194', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/8?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"5\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"5\",\"value\":\"5\",\"probability\":\"4000\",\"weigh\":\"4\"},\"ids\":\"8\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632246');
INSERT INTO `fa_admin_log` VALUES ('195', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/3?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181101\\/b982b33c030a20350d23dd2fa53e6d37.png\",\"name\":\"2\\u5143\\u8bdd\\u8d39\",\"pid\":\"\\u8bdd\\u8d39-5\",\"num\":\"1\",\"face_value\":\"2\",\"value\":\"400\",\"probability\":\"1\",\"weigh\":\"5\"},\"ids\":\"3\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632256');
INSERT INTO `fa_admin_log` VALUES ('196', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/6?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"500\",\"weigh\":\"6\"},\"ids\":\"6\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632269');
INSERT INTO `fa_admin_log` VALUES ('197', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/4?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/51d9751b01230485990b16f99f5d9b08.png\",\"name\":\"\\u8c22\\u8c22\\u53c2\\u4e0e\",\"pid\":\"4\",\"num\":\"1\",\"face_value\":\"-1\",\"value\":\"0\",\"probability\":\"899\",\"weigh\":\"7\"},\"ids\":\"4\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632277');
INSERT INTO `fa_admin_log` VALUES ('198', '6', 'picc', '/happly/public/index.php/admin/turntable/edit/ids/2?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181101\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"50\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"50\",\"value\":\"50\",\"probability\":\"100\",\"weigh\":\"8\"},\"ids\":\"2\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552632282');
INSERT INTO `fa_admin_log` VALUES ('199', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632617');
INSERT INTO `fa_admin_log` VALUES ('200', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"8,9,10,11,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,85,86,87,88,89,90,93,94,95,96,97,98,99,100,101,102,107,108,112,116,117,118,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,2,5,66\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632620');
INSERT INTO `fa_admin_log` VALUES ('201', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,6,3,8,5,7,1\",\"changeid\":\"2\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632630');
INSERT INTO `fa_admin_log` VALUES ('202', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,6,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632635');
INSERT INTO `fa_admin_log` VALUES ('203', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,5,1,7\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632639');
INSERT INTO `fa_admin_log` VALUES ('204', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,5,1,7\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632642');
INSERT INTO `fa_admin_log` VALUES ('205', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,5,1,7\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632647');
INSERT INTO `fa_admin_log` VALUES ('206', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,5,1,7\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632652');
INSERT INTO `fa_admin_log` VALUES ('207', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,7,5,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632656');
INSERT INTO `fa_admin_log` VALUES ('208', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,7,5,1\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632659');
INSERT INTO `fa_admin_log` VALUES ('209', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,6,4,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632666');
INSERT INTO `fa_admin_log` VALUES ('210', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,6,4,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632669');
INSERT INTO `fa_admin_log` VALUES ('211', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,6,4,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632675');
INSERT INTO `fa_admin_log` VALUES ('212', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,6,4,3,8,5,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632680');
INSERT INTO `fa_admin_log` VALUES ('213', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,6,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632683');
INSERT INTO `fa_admin_log` VALUES ('214', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,6,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632686');
INSERT INTO `fa_admin_log` VALUES ('215', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,6,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632690');
INSERT INTO `fa_admin_log` VALUES ('216', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,6,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632696');
INSERT INTO `fa_admin_log` VALUES ('217', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,2,6,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632698');
INSERT INTO `fa_admin_log` VALUES ('218', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,6,3,8,5,7,4,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632702');
INSERT INTO `fa_admin_log` VALUES ('219', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,8,5,7,1,3\",\"changeid\":\"3\",\"pid\":\"\\u8bdd\\u8d39-5\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632704');
INSERT INTO `fa_admin_log` VALUES ('220', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,1,5,7\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632709');
INSERT INTO `fa_admin_log` VALUES ('221', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,7,5,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632713');
INSERT INTO `fa_admin_log` VALUES ('222', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,7,5,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632717');
INSERT INTO `fa_admin_log` VALUES ('223', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,8,7,5,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552632723');
INSERT INTO `fa_admin_log` VALUES ('224', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,4,6,3,5,8,7,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552633413');
INSERT INTO `fa_admin_log` VALUES ('225', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"5,2,4,6,3,8,7,1\",\"changeid\":\"5\",\"pid\":\"6\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552633420');
INSERT INTO `fa_admin_log` VALUES ('226', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,6,2,3,8,5,7,1\",\"changeid\":\"2\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552633424');
INSERT INTO `fa_admin_log` VALUES ('227', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,2,4,3,8,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552633428');
INSERT INTO `fa_admin_log` VALUES ('228', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,4,3,2,8,5,7,1\",\"changeid\":\"2\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552633432');
INSERT INTO `fa_admin_log` VALUES ('229', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,4,3,2,8,5,7,1\",\"changeid\":\"2\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552633435');
INSERT INTO `fa_admin_log` VALUES ('230', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,4,3,8,2,5,7,1\",\"changeid\":\"2\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552633437');
INSERT INTO `fa_admin_log` VALUES ('231', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,1,6,7,8,3,5,9,10,11,12,4,66,67,73,79,85,86,87,88,89,90,93,94,156,162\",\"changeid\":\"1\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634048');
INSERT INTO `fa_admin_log` VALUES ('232', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634051');
INSERT INTO `fa_admin_log` VALUES ('233', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"1,4,66,67,73,79,85,86,87,88,89,90,93,94,156,162,5,12,11,10,9,3,2,8,7,6\",\"changeid\":\"1\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634063');
INSERT INTO `fa_admin_log` VALUES ('234', '1', 'admin', '/happly/public/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634065');
INSERT INTO `fa_admin_log` VALUES ('235', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,6,8,3,2,5,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634098');
INSERT INTO `fa_admin_log` VALUES ('236', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,6,8,3,2,5,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634105');
INSERT INTO `fa_admin_log` VALUES ('237', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,6,8,3,2,5,7,1\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634109');
INSERT INTO `fa_admin_log` VALUES ('238', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,6,8,3,2,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634112');
INSERT INTO `fa_admin_log` VALUES ('239', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,8,3,4,2,5,7,1\",\"changeid\":\"4\",\"pid\":\"4\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634118');
INSERT INTO `fa_admin_log` VALUES ('240', '1', 'admin', '/happly/public/index.php/admin/turntable/edit/ids/6?dialog=1', '转盘管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190315\\/bd9564c48972f272e5770cb0bc34c859.png\",\"name\":\"10\\u6d3b\\u8dc3\\u503c\",\"pid\":\"3\",\"num\":\"1\",\"face_value\":\"10\",\"value\":\"10\",\"probability\":\"500\",\"weigh\":\"1\"},\"ids\":\"6\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634127');
INSERT INTO `fa_admin_log` VALUES ('241', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"4,8,3,2,5,1,7,6\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '101.229.241.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634135');
INSERT INTO `fa_admin_log` VALUES ('242', '6', 'picc', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"87fa260ab116e993179576d2eba1ca22\",\"username\":\"picc\",\"keeplogin\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634750');
INSERT INTO `fa_admin_log` VALUES ('243', '6', 'picc', '/relaxed/public/index.php/admin/games/edit/ids/1?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180929\\/d2787da3b95f8b04e7ca1a9d04eef250.png\",\"title\":\"\\u5b66\\u9738\\u5b66\\u6e23\",\"desc\":\"\\u8c01\\u624d\\u662f\\u771f\\u6b63\\u7684\\u5934\\u8111\\u738b\\u8005\",\"appid\":\"wxb6417d92bb52a17b\",\"status\":\"hidden\",\"weigh\":\"2\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552634854');
INSERT INTO `fa_admin_log` VALUES ('244', '6', 'picc', '/happly/public/index.php/admin/games/edit/ids/2?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180929\\/95125a7b89375e834651745887f9123e.png\",\"title\":\"\\u627e\\u864e\\u5b50\",\"desc\":\"\\u7ec8\\u4e8e\\u53d1\\u73b0\\u540c\\u684c\\u662f\\u8272\\u76f2\",\"appid\":\"wx893f1fee045b95cf\",\"status\":\"normal\",\"weigh\":\"3\"},\"ids\":\"2\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1552637807');
INSERT INTO `fa_admin_log` VALUES ('245', '6', 'picc', '/relaxed/public/index.php/admin/usergift/edit/ids/1?dialog=1', '新手礼包 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181009\\/8bb0801d1c3f5ec29058e98bb162944a.png\",\"images\":\"\\/uploads\\/20181009\\/d0fd00345a44a519714e8bcfabe3295f.png\",\"title\":\"200\",\"status\":\"normal\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552645231');
INSERT INTO `fa_admin_log` VALUES ('246', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/24?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190304\\/a50d8c1732289e3da1f64cc5ad12e205.png\",\"name\":\"\\u5f69\\u7968\\u5151\\u6362\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/lottery\",\"status\":\"hidden\",\"weigh\":\"17\"},\"ids\":\"24\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552645283');
INSERT INTO `fa_admin_log` VALUES ('247', '6', 'picc', '/relaxed/public/index.php/admin/games/edit/ids/2?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180929\\/95125a7b89375e834651745887f9123e.png\",\"title\":\"\\u627e\\u864e\\u5b50\",\"desc\":\"\\u7ec8\\u4e8e\\u53d1\\u73b0\\u540c\\u684c\\u662f\\u8272\\u76f2\",\"appid\":\"wx893f1fee045b95cf\",\"status\":\"hidden\",\"weigh\":\"3\"},\"ids\":\"2\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552645409');
INSERT INTO `fa_admin_log` VALUES ('248', '6', 'picc', '/relaxed/public/index.php/admin/gslideshow/edit/ids/2?dialog=1', '游戏轮播 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181103\\/e2a34205893ef32e9d5e8b6ed6c7e671.png\",\"url\":\"123\",\"status\":\"hidden\"},\"ids\":\"2\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552962007');
INSERT INTO `fa_admin_log` VALUES ('249', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"bd4584819f67560a129796b3ce245415\",\"username\":\"admin\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552963133');
INSERT INTO `fa_admin_log` VALUES ('250', '1', 'admin', '/happly/public/index.php/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552963521');
INSERT INTO `fa_admin_log` VALUES ('251', '1', 'admin', '/happly/public/index.php/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"8,9,10,11,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,85,86,87,88,89,90,93,94,95,96,97,98,99,100,101,102,107,108,112,116,117,118,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,2,5,66\",\"pid\":\"1\",\"name\":\"\\u4e00\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"},\"ids\":\"2\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552963540');
INSERT INTO `fa_admin_log` VALUES ('252', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"2,1,3\",\"changeid\":\"1\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"activity\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964016');
INSERT INTO `fa_admin_log` VALUES ('253', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"1,2,3\",\"changeid\":\"1\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"activity\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964020');
INSERT INTO `fa_admin_log` VALUES ('254', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"1,6,7,5,2,3,8,4\",\"changeid\":\"6\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964039');
INSERT INTO `fa_admin_log` VALUES ('255', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"1,6,7,5,2,3,8,4\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964042');
INSERT INTO `fa_admin_log` VALUES ('256', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,7,5,2,3,8,4,1\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964046');
INSERT INTO `fa_admin_log` VALUES ('257', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,1,5,2,3,8,4,7\",\"changeid\":\"7\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964049');
INSERT INTO `fa_admin_log` VALUES ('258', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,2,5,8,3,7,1,4\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964052');
INSERT INTO `fa_admin_log` VALUES ('259', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,2,1,5,8,3,7,4\",\"changeid\":\"1\",\"pid\":\"7\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964056');
INSERT INTO `fa_admin_log` VALUES ('260', '1', 'admin', '/happly/public/index.php/admin/ajax/weigh', '', '{\"ids\":\"6,2,1,5,8,3,7,4\",\"changeid\":\"2\",\"pid\":\"3\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"turntable\"}', '180.171.3.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552964059');
INSERT INTO `fa_admin_log` VALUES ('261', '6', 'picc', '/relaxed/public/index.php/admin/activity/edit/ids/2?dialog=1', '活动管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180929\\/72282e613ded005dcae1ef4e2e78e27a.png\",\"title\":\"\\u5151\\u5956\\u6362\\u5f69\\u7968\",\"desc\":\"\\u4eca\\u5929\\u662f\\u4e2a\\u9ec4\\u9053\\u5409\\u65e5\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/lottery\",\"status\":\"hidden\",\"weigh\":\"2\"},\"ids\":\"2\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552965319');
INSERT INTO `fa_admin_log` VALUES ('262', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/8?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190304\\/abe04a238e6ebf66c0150e94a5f86aee.png\",\"name\":\"\\u65e5\\u5e38\\u5bb6\\u5c45\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"hidden\",\"weigh\":\"15\"},\"ids\":\"8\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974541');
INSERT INTO `fa_admin_log` VALUES ('263', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/9?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190304\\/cfe4dbdf6653854bf8fd311f241730e7.png\",\"name\":\"\\u5bb6\\u7528\\u7535\\u5668\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"hidden\",\"weigh\":\"14\"},\"ids\":\"9\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974547');
INSERT INTO `fa_admin_log` VALUES ('264', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/10?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190304\\/56d2a6cd414035d14884769b69fffb51.png\",\"name\":\"\\u8f66\\u8f86\\u670d\\u52a1\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"hidden\",\"weigh\":\"13\"},\"ids\":\"10\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974555');
INSERT INTO `fa_admin_log` VALUES ('265', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/11?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190304\\/ea47ed6b5c0f1da47c40901a43435233.png\",\"name\":\"\\u519c\\u526f\\u4ea7\\u54c1\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"hidden\",\"weigh\":\"12\"},\"ids\":\"11\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974560');
INSERT INTO `fa_admin_log` VALUES ('266', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/12?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190304\\/23745e2ff2fc6ff7544ffc99aba20aae.png\",\"name\":\"\\u6570\\u7801\\u5151\\u6362\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"hidden\",\"weigh\":\"11\"},\"ids\":\"12\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974565');
INSERT INTO `fa_admin_log` VALUES ('267', '6', 'picc', '/relaxed/public/index.php/admin/ajax/upload', '', '{\"name\":\"E2956D3B-E537-44b9-806A-A3F235F83984.jpg\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974626');
INSERT INTO `fa_admin_log` VALUES ('268', '6', 'picc', '/relaxed/public/index.php/admin/product12/add?dialog=1', '商品管理 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/7e5725eaf47ebb7380b73e71d96fa9be.jpg\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"18\"}}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974653');
INSERT INTO `fa_admin_log` VALUES ('269', '6', 'picc', '/relaxed/public/index.php/admin/ajax/upload', '', '{\"name\":\"15F76E11-63F8-4212-B3E4-8132CB1EC733.jpg\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974872');
INSERT INTO `fa_admin_log` VALUES ('270', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/4c8a0f660622c65f9739c1a3104d36cc.jpg\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"26\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552974877');
INSERT INTO `fa_admin_log` VALUES ('271', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"1176e369e5b3f83a4a85a8df6c879995\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552978176');
INSERT INTO `fa_admin_log` VALUES ('272', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4><b><br><\\/b><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4><br><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4><br><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4><br><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4><br><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><h4><br><\\/h4><h4><br><\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552978607');
INSERT INTO `fa_admin_log` VALUES ('273', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4><b><br><\\/b><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><h4><br><\\/h4><h4><br><\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552979251');
INSERT INTO `fa_admin_log` VALUES ('274', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552979286');
INSERT INTO `fa_admin_log` VALUES ('275', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <\\/span><\\/p><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552979901');
INSERT INTO `fa_admin_log` VALUES ('276', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01\\u00a0<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 <\\/span><\\/p><p><span style=\\\"font-size: 10px;\\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552979918');
INSERT INTO `fa_admin_log` VALUES ('277', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"e3fcc0a7d51d14821768cb09f5781bd4\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552986475');
INSERT INTO `fa_admin_log` VALUES ('278', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u5e73\\u53f0\\u9053\\u5177.png\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552986520');
INSERT INTO `fa_admin_log` VALUES ('279', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/c79433ff2ea56a01ac0a38bce2cab590.png\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"26\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552986527');
INSERT INTO `fa_admin_log` VALUES ('280', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u5e73\\u53f0\\u9053\\u517722.png\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552986638');
INSERT INTO `fa_admin_log` VALUES ('281', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/394d744153a8279a5574a85720e946b0.png\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"26\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552986640');
INSERT INTO `fa_admin_log` VALUES ('282', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u5e73\\u53f0icon.jpg\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552987088');
INSERT INTO `fa_admin_log` VALUES ('283', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/5465f002959729faff21602e77c30c66.jpg\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"26\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552987090');
INSERT INTO `fa_admin_log` VALUES ('284', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u5e73\\u53f0\\u9053\\u517722.png\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552987210');
INSERT INTO `fa_admin_log` VALUES ('285', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/394d744153a8279a5574a85720e946b0.png\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"26\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552987212');
INSERT INTO `fa_admin_log` VALUES ('286', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/394d744153a8279a5574a85720e946b0.png\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"18\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552987292');
INSERT INTO `fa_admin_log` VALUES ('287', '6', 'picc', '/relaxed/public/index.php/admin/ajax/upload', '', '{\"name\":\"15F76E11-63F8-4212-B3E4-8132CB1EC733.jpg\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552987300');
INSERT INTO `fa_admin_log` VALUES ('288', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/4c8a0f660622c65f9739c1a3104d36cc.jpg\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"18\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552987302');
INSERT INTO `fa_admin_log` VALUES ('289', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u5e73\\u53f0\\u9053\\u5177.png\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552987373');
INSERT INTO `fa_admin_log` VALUES ('290', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/c79433ff2ea56a01ac0a38bce2cab590.png\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"18\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '1552987378');
INSERT INTO `fa_admin_log` VALUES ('291', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u5e73\\u53f0\\u9053\\u517722.jpg\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552987467');
INSERT INTO `fa_admin_log` VALUES ('292', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/394d744153a8279a5574a85720e946b0.jpg\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"18\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552987468');
INSERT INTO `fa_admin_log` VALUES ('293', '6', 'picc', '/relaxed/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u5e73\\u53f0\\u9053\\u5177.png\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552987830');
INSERT INTO `fa_admin_log` VALUES ('294', '6', 'picc', '/relaxed/public/index.php/admin/product12/edit/ids/26?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190319\\/c79433ff2ea56a01ac0a38bce2cab590.png\",\"name\":\"\\u5e73\\u53f0\\u9053\\u5177\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"18\"},\"ids\":\"26\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1552987833');
INSERT INTO `fa_admin_log` VALUES ('295', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"e55c1362021275d99253b158dfb66ee3\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552988551');
INSERT INTO `fa_admin_log` VALUES ('296', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/2', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1552988655');
INSERT INTO `fa_admin_log` VALUES ('297', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"d69dafca67ed810ec64d82c024cb24d2\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553046028');
INSERT INTO `fa_admin_log` VALUES ('298', '6', 'picc', '/happly/public/index.php/admin/product12/edit/ids/7?dialog=1', '商品管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190304\\/616c847d250e1235a2c4e33c3254b2ed.png\",\"name\":\"\\u5361\\u5238\\u5151\\u6362\",\"url\":\"https:\\/\\/h5.18178.net\\/#\\/exchange\",\"status\":\"normal\",\"weigh\":\"16\"},\"ids\":\"7\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553046138');
INSERT INTO `fa_admin_log` VALUES ('299', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/15', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"15\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553047369');
INSERT INTO `fa_admin_log` VALUES ('300', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"2932fb8b776008091d36c15f14871c4e\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553048041');
INSERT INTO `fa_admin_log` VALUES ('301', '6', 'picc', '/happly/public/index.php/admin/games/edit/ids/3?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180929\\/921764b65a040f57775682b6f134a44c.png\",\"title\":\"\\u66f4\\u591a\\u6e38\\u620f\",\"desc\":\"\\u6211\\u4eec\\u6b63\\u5728\\u52aa\\u529b\\u5f00\\u53d1\\u4e2d\",\"appid\":\"\",\"status\":\"hidden\",\"weigh\":\"1\"},\"ids\":\"3\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553048067');
INSERT INTO `fa_admin_log` VALUES ('302', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"1335f0410bed8ce53df4ffe569018df0\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553050133');
INSERT INTO `fa_admin_log` VALUES ('303', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/16', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"16\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553050155');
INSERT INTO `fa_admin_log` VALUES ('304', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <\\/span><\\/p><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553060545');
INSERT INTO `fa_admin_log` VALUES ('305', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <\\/span><\\/p><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553060585');
INSERT INTO `fa_admin_log` VALUES ('306', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01\\u00a0<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 <\\/span><\\/p><p><span style=\\\"font-size: 10px;\\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553060829');
INSERT INTO `fa_admin_log` VALUES ('307', '6', 'picc', '/happly/public/index.php/admin/turndesc/edit/ids/1?dialog=1', '转盘描述 编辑', '{\"dialog\":\"1\",\"row\":{\"desc\":\"0\\u5143\\u62bd\\u53d6iPhone XS\",\"size\":\"18\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553060883');
INSERT INTO `fa_admin_log` VALUES ('308', '6', 'picc', '/happly/public/index.php/admin/index/login?url=%2Fhapply%2Fpublic%2Findex.php%2Fadmin%2Fgeneral%2Fprofile%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/happly\\/public\\/index.php\\/admin\\/general\\/profile?ref=addtabs\",\"__token__\":\"eef2fafa822acc5e657193c095d87952\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1553060910');
INSERT INTO `fa_admin_log` VALUES ('309', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/17', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"17\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553062248');
INSERT INTO `fa_admin_log` VALUES ('310', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/18', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"18\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553062349');
INSERT INTO `fa_admin_log` VALUES ('311', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/19', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"19\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553062562');
INSERT INTO `fa_admin_log` VALUES ('312', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/20', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"20\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553063270');
INSERT INTO `fa_admin_log` VALUES ('313', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/21', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"21\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553063690');
INSERT INTO `fa_admin_log` VALUES ('314', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/22', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"22\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553067181');
INSERT INTO `fa_admin_log` VALUES ('315', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4><span style=\\\"font-size: 18px;\\\"><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553069745');
INSERT INTO `fa_admin_log` VALUES ('316', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4>&nbsp; &nbsp; &nbsp; &nbsp; \\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553069829');
INSERT INTO `fa_admin_log` VALUES ('317', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553069950');
INSERT INTO `fa_admin_log` VALUES ('318', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"\\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553070073');
INSERT INTO `fa_admin_log` VALUES ('319', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"margin-left: 25px;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553070148');
INSERT INTO `fa_admin_log` VALUES ('320', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"\\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553070200');
INSERT INTO `fa_admin_log` VALUES ('321', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"119b15d3326bb60f9ec86d266e87c1d0\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553077046');
INSERT INTO `fa_admin_log` VALUES ('322', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u66f4\\u591a\\u6e38\\u620f.png\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553077478');
INSERT INTO `fa_admin_log` VALUES ('323', '6', 'picc', '/happly/public/index.php/admin/games/edit/ids/3?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190320\\/225727cee3fe1610dd38aa748076abc8.png\",\"title\":\"\\u68cb\\u724c\\u6e38\\u620f\",\"desc\":\"\\u53ef\\u83b7\\u53d6\\u66f4\\u591a\\u5956\\u52b1\",\"appid\":\"\",\"status\":\"normal\",\"weigh\":\"1\"},\"ids\":\"3\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553077484');
INSERT INTO `fa_admin_log` VALUES ('324', '6', 'picc', '/relaxed/public/index.php/admin/ajax/upload', '', '{\"name\":\"\\u66f4\\u591a\\u6e38\\u620f.png\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1553077845');
INSERT INTO `fa_admin_log` VALUES ('325', '6', 'picc', '/relaxed/public/index.php/admin/games/edit/ids/3?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190320\\/225727cee3fe1610dd38aa748076abc8.png\",\"title\":\"\\u68cb\\u724c\\u6e38\\u620f\",\"desc\":\"\\u53ef\\u83b7\\u53d6\\u66f4\\u591a\\u5956\\u52b1\",\"appid\":\"\",\"status\":\"normal\",\"weigh\":\"1\"},\"ids\":\"3\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1553077846');
INSERT INTO `fa_admin_log` VALUES ('326', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"19bbacca39c8498a83ff2fbc689dbca4\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553138697');
INSERT INTO `fa_admin_log` VALUES ('327', '6', 'picc', '/happly/public/index.php/admin/games/edit/ids/4?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181115\\/d146a4b4f14586c3a64c1a82f99af6d1.png\",\"title\":\"\\u6b22\\u4e50\\u7ebf\",\"desc\":\"\\u8fd9\\u662f\\u4e00\\u6761\\u6709\\u8154\\u8c03\\u7684\\u7ebf\",\"appid\":\"wxdd1912f3bf025fc2\",\"status\":\"normal\",\"weigh\":\"4\"},\"ids\":\"4\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553148252');
INSERT INTO `fa_admin_log` VALUES ('328', '6', 'picc', '/happly/public/index.php/admin/games/edit/ids/2?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180929\\/95125a7b89375e834651745887f9123e.png\",\"title\":\"\\u627e\\u4f60\\u55b5\",\"desc\":\"\\u7ec8\\u4e8e\\u53d1\\u73b0\\u540c\\u684c\\u662f\\u8272\\u76f2\",\"appid\":\"wx96e2c1d4ff288463\",\"status\":\"normal\",\"weigh\":\"3\"},\"ids\":\"2\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553148487');
INSERT INTO `fa_admin_log` VALUES ('329', '6', 'picc', '/happly/public/index.php/admin/games/edit/ids/4?dialog=1', '游戏管理 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181115\\/d146a4b4f14586c3a64c1a82f99af6d1.png\",\"title\":\"\\u6b22\\u4e50\\u7ebf\",\"desc\":\"\\u8fd9\\u662f\\u4e00\\u6761\\u6709\\u8154\\u8c03\\u7684\\u7ebf\",\"appid\":\"wxdd1912f3bf025fc2\",\"status\":\"hidden\",\"weigh\":\"4\"},\"ids\":\"4\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553149029');
INSERT INTO `fa_admin_log` VALUES ('330', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"734f75a215f402d808b71618d2d38a77\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553149802');
INSERT INTO `fa_admin_log` VALUES ('331', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"a6363d495fdcee7f1d9b5f80bdc6447a\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553150683');
INSERT INTO `fa_admin_log` VALUES ('332', '1', 'admin', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"5f0987372795b4bdb8cc966efed71a2e\",\"username\":\"admin\"}', '180.171.3.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36', '1553156888');
INSERT INTO `fa_admin_log` VALUES ('333', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"732dde885a56dde3c541a3469621023a\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553159490');
INSERT INTO `fa_admin_log` VALUES ('334', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"e8c539927a2a6902daa132c13cd41051\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553218088');
INSERT INTO `fa_admin_log` VALUES ('335', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/11', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"11\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553218104');
INSERT INTO `fa_admin_log` VALUES ('336', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"2c82b7d7e241b3c953a2d28915add747\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553218671');
INSERT INTO `fa_admin_log` VALUES ('337', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: justify; \\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: justify; \\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: justify; \\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: justify; \\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: justify; \\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553218700');
INSERT INTO `fa_admin_log` VALUES ('338', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/27', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"27\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553222959');
INSERT INTO `fa_admin_log` VALUES ('339', '6', 'picc', '/relaxed/public/index.php/admin/index/login?url=%2Frelaxed%2Fpublic%2Findex.php%2Fadmin%2Fuserslideshow%3Faddtabs%3D1', '登录', '{\"url\":\"\\/relaxed\\/public\\/index.php\\/admin\\/userslideshow?addtabs=1\",\"__token__\":\"942bdc1a608763471fba91b93511e232\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1553223030');
INSERT INTO `fa_admin_log` VALUES ('340', '6', 'picc', '/happly/public/index.php/admin/index/login?url=%2Fhapply%2Fpublic%2Findex.php%2Fadmin%2Fgeneral%2Fprofile%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/happly\\/public\\/index.php\\/admin\\/general\\/profile?ref=addtabs\",\"__token__\":\"435e3a8c940a42c9c95908d7313fe98c\",\"username\":\"picc\"}', '180.154.32.138', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1553233590');
INSERT INTO `fa_admin_log` VALUES ('341', '6', 'picc', '/happly/public/index.php/admin/index/login', '登录', '{\"__token__\":\"d39c0e74b2e5d6a17a30153f07bfd9af\",\"username\":\"picc\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553233989');
INSERT INTO `fa_admin_log` VALUES ('342', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"banner\\u5151\\u6362.png\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553234493');
INSERT INTO `fa_admin_log` VALUES ('343', '6', 'picc', '/happly/public/index.php/admin/gslideshow/edit/ids/1?dialog=1', '游戏轮播 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20181103\\/f8f8f3b5b2a402fd02b2edb929fa55b9.png\",\"url\":\"123\",\"status\":\"hidden\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553234532');
INSERT INTO `fa_admin_log` VALUES ('344', '6', 'picc', '/happly/public/index.php/admin/ajax/upload', '', '{\"name\":\"banner\\u5151\\u6362.png\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553234595');
INSERT INTO `fa_admin_log` VALUES ('345', '6', 'picc', '/happly/public/index.php/admin/gslideshow/add?dialog=1', '游戏轮播 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190322\\/acb72f0c89ddc8e52218712088bebce5.png\",\"url\":\"123\",\"status\":\"normal\"}}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.26 Safari/537.36 Core/1.63.6788.400 QQBrowser/10.3.2767.400', '1553234598');
INSERT INTO `fa_admin_log` VALUES ('346', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: justify; \\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: justify; \\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: justify; \\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: justify; \\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: justify; \\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553234785');
INSERT INTO `fa_admin_log` VALUES ('347', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553234819');
INSERT INTO `fa_admin_log` VALUES ('348', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp; \\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553234875');
INSERT INTO `fa_admin_log` VALUES ('349', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp; \\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553234932');
INSERT INTO `fa_admin_log` VALUES ('350', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: right;\\\">&nbsp; &nbsp; &nbsp; &nbsp; \\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: right;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: right;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: right;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: right;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553234998');
INSERT INTO `fa_admin_log` VALUES ('351', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp; \\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235030');
INSERT INTO `fa_admin_log` VALUES ('352', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp;\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235055');
INSERT INTO `fa_admin_log` VALUES ('353', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: center; \\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left; margin-left: 25px;\\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left; margin-left: 25px;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left; margin-left: 25px;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left; margin-left: 25px;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left; margin-left: 25px;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235133');
INSERT INTO `fa_admin_log` VALUES ('354', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: left;\\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235203');
INSERT INTO `fa_admin_log` VALUES ('355', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<h4 style=\\\"text-align: left;\\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/h4><h4 style=\\\"text-align: left;\\\"><span style=\\\"font-size: 18px;\\\"><b><br><\\/b><\\/span>\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235235');
INSERT INTO `fa_admin_log` VALUES ('356', '6', 'picc', '/relaxed/public/index.php/admin/ajax/upload', '', '{\"name\":\"banner\\u5151\\u6362.png\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1553235316');
INSERT INTO `fa_admin_log` VALUES ('357', '6', 'picc', '/relaxed/public/index.php/admin/gslideshow/edit/ids/4?dialog=1', '游戏轮播 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20190322\\/acb72f0c89ddc8e52218712088bebce5.png\",\"url\":\"123\",\"status\":\"normal\"},\"ids\":\"4\"}', '218.242.163.18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '1553235318');
INSERT INTO `fa_admin_log` VALUES ('358', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/p><h4 style=\\\"text-align: left;\\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235377');
INSERT INTO `fa_admin_log` VALUES ('359', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/p><h4 style=\\\"text-align: left;\\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: left;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235650');
INSERT INTO `fa_admin_log` VALUES ('360', '6', 'picc', '/happly/public/index.php/admin/invite/edit/ids/1?dialog=1', '邀请好友拿现金 编辑', '{\"dialog\":\"1\",\"row\":{\"image\":\"\",\"content\":\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size: 18px;\\\"><b>0\\u5143\\u62bdIphoneXS<\\/b><\\/span><\\/p><h4 style=\\\"text-align: justify;\\\">\\u5c0a\\u656c\\u7684PICC\\u7528\\u6237\\uff0c\\u4e3a\\u4e86\\u56de\\u9988\\u591a\\u5e74\\u6765\\u4f60\\u4eec\\u7684\\u5fe0\\u5b9e\\u966a\\u4f34\\uff0c\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5927\\u8f6c\\u76d8\\u6d3b\\u52a8\\u6dfb\\u52a0\\u65b0\\u5956\\u52b1\\u201ciphoneXS\\u201d\\uff0c\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6bcf\\u5929\\u767b\\u9646PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u5c0f\\u7a0b\\u5e8f\\uff0c\\u5373\\u53ef\\u83b7\\u5f97\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u4e00\\u6b21\\u3002<\\/h4><h4 style=\\\"text-align: justify;\\\">\\u6d3b\\u52a8\\u65f6\\u95f4\\uff1a2019-03-01 \\u81f3 2020-03-01&nbsp;<\\/h4><h4 style=\\\"text-align: justify;\\\">\\u6d3b\\u52a8\\u4eba\\u7fa4\\uff1a\\u6240\\u6709PICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237<\\/h4><h4 style=\\\"text-align: justify;\\\">\\u6d3b\\u52a8\\u5956\\u54c1\\uff1a\\u6d3b\\u8dc3\\u503c\\uff0c10\\u5143\\u4eac\\u4e1c\\u5361\\uff0c\\u8bdd\\u8d39\\uff0c\\u91d1\\u5e01\\uff0ciphone\\u624b\\u673a\\uff08\\u5177\\u4f53\\u578b\\u53f7\\uff1aApple iPhone XS (A2100) 64GB \\u6df1\\u7a7a\\u7070\\u8272\\uff09<\\/h4><h4 style=\\\"text-align: justify;\\\">\\u6d3b\\u52a8\\u89c4\\u5219\\uff1a\\u6bcf\\u4e00\\u4f4dPICC\\u201c\\u8f7b\\u677e\\u4e00\\u523b\\u201d\\u7528\\u6237\\u6bcf\\u5929\\u767b\\u5f55\\u53ef\\u4ee5\\u9886\\u53d6\\u4e00\\u6b21\\u5927\\u8f6c\\u76d8\\u62bd\\u5956\\u673a\\u4f1a\\u3002\\u70b9\\u51fb\\u8f6c\\u52a8\\u8f6c\\u76d8\\uff0c\\u8f6c\\u76d8\\u505c\\u6b62\\u65f6\\u6307\\u9488\\u6240\\u6307\\u5411\\u7684\\u5956\\u54c1\\u5373\\u4e3a\\u7528\\u6237\\u6240\\u83b7\\u5f97\\u7684\\u5956\\u54c1\\u3002<\\/h4><p><span style=\\\"font-size: 10px;\\\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/span><\\/p><p style=\\\"text-align: right; \\\"><span style=\\\"font-size: 10px;\\\">\\u6d3b\\u52a8\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u4e2d\\u56fd\\u4eba\\u4fdd\\u8d22\\u9669\\u4e0a\\u6d77\\u5206\\u516c\\u53f8\\u6240\\u6709<\\/span><\\/p>\",\"activity\":\"2019-03-01 \\u81f3 2020-03-01\"},\"ids\":\"1\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235677');
INSERT INTO `fa_admin_log` VALUES ('361', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/23', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"23\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553235858');
INSERT INTO `fa_admin_log` VALUES ('362', '6', 'picc', '/happly/public/index.php/admin/user/user/del/ids/32', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"32\",\"params\":\"\"}', '218.242.163.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.80 Safari/537.36', '1553236415');

-- ----------------------------
-- Table structure for fa_affiche
-- ----------------------------
DROP TABLE IF EXISTS `fa_affiche`;
CREATE TABLE `fa_affiche` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `sattus` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台公告';

-- ----------------------------
-- Records of fa_affiche
-- ----------------------------

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES ('2', '1', '0', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '256', '256', 'png', '0', '30129', 'image/png', '', '1552616203', '1552616203', '1552616203', 'local', '2c6fa681eab78ad5dfe4b7c422c78c44dbc0d1ff');
INSERT INTO `fa_attachment` VALUES ('3', '1', '0', '/uploads/20190315/51d9751b01230485990b16f99f5d9b08.png', '256', '256', 'png', '0', '8247', 'image/png', '', '1552616212', '1552616212', '1552616212', 'local', '1b48f48bb9dd4d4d4dc655b547c9abfef81f6959');
INSERT INTO `fa_attachment` VALUES ('4', '1', '0', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '256', '256', 'png', '0', '30129', 'image/png', '', '1552616224', '1552616224', '1552616224', 'local', '2c6fa681eab78ad5dfe4b7c422c78c44dbc0d1ff');
INSERT INTO `fa_attachment` VALUES ('5', '1', '0', '/uploads/20190315/5f7a024aa56afad67b72aa9bd5cefa10.png', '256', '256', 'png', '0', '45020', 'image/png', '', '1552616255', '1552616255', '1552616255', 'local', 'e070150f33a887a2f3094bd3aadfff577edbc780');
INSERT INTO `fa_attachment` VALUES ('6', '1', '0', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '256', '256', 'png', '0', '30129', 'image/png', '', '1552616275', '1552616275', '1552616275', 'local', '2c6fa681eab78ad5dfe4b7c422c78c44dbc0d1ff');
INSERT INTO `fa_attachment` VALUES ('7', '1', '0', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '256', '256', 'png', '0', '30129', 'image/png', '', '1552617063', '1552617063', '1552617063', 'local', '2c6fa681eab78ad5dfe4b7c422c78c44dbc0d1ff');
INSERT INTO `fa_attachment` VALUES ('8', '6', '0', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '256', '256', 'png', '0', '30129', 'image/png', '', '1552620799', '1552620799', '1552620799', 'local', '2c6fa681eab78ad5dfe4b7c422c78c44dbc0d1ff');
INSERT INTO `fa_attachment` VALUES ('9', '6', '0', '/uploads/20190315/51d9751b01230485990b16f99f5d9b08.png', '256', '256', 'png', '0', '8247', 'image/png', '', '1552629980', '1552629980', '1552629980', 'local', '1b48f48bb9dd4d4d4dc655b547c9abfef81f6959');
INSERT INTO `fa_attachment` VALUES ('10', '6', '0', '/uploads/20190319/7e5725eaf47ebb7380b73e71d96fa9be.jpg', '100', '100', 'jpg', '0', '2404', 'image/jpeg', '', '1552974626', '1552974626', '1552974626', 'local', '093fe3937424cab20e18a31c6f541896a52d52fb');
INSERT INTO `fa_attachment` VALUES ('11', '6', '0', '/uploads/20190319/4c8a0f660622c65f9739c1a3104d36cc.jpg', '100', '100', 'jpg', '0', '2414', 'image/jpeg', '', '1552974872', '1552974872', '1552974872', 'local', 'c7a083d139dc9fa216c83d7b176dd1578afb48ef');
INSERT INTO `fa_attachment` VALUES ('12', '6', '0', '/uploads/20190319/c79433ff2ea56a01ac0a38bce2cab590.png', '100', '100', 'png', '0', '11825', 'image/png', '', '1552986520', '1552986520', '1552986520', 'local', '7a1da7909bf02eebfbdbedf24b30a7974f61eb89');
INSERT INTO `fa_attachment` VALUES ('13', '6', '0', '/uploads/20190319/394d744153a8279a5574a85720e946b0.png', '100', '100', 'png', '0', '14027', 'image/png', '', '1552986638', '1552986638', '1552986638', 'local', 'efda42dca39391cb34aae1a5275432ed816d9229');
INSERT INTO `fa_attachment` VALUES ('14', '6', '0', '/uploads/20190319/5465f002959729faff21602e77c30c66.jpg', '512', '512', 'jpg', '0', '177100', 'image/jpeg', '', '1552987088', '1552987088', '1552987088', 'local', 'ecb4a83eca08671539f3316540ff884933f5af15');
INSERT INTO `fa_attachment` VALUES ('15', '6', '0', '/uploads/20190319/394d744153a8279a5574a85720e946b0.png', '100', '100', 'png', '0', '14027', 'image/png', '', '1552987210', '1552987210', '1552987210', 'local', 'efda42dca39391cb34aae1a5275432ed816d9229');
INSERT INTO `fa_attachment` VALUES ('16', '6', '0', '/uploads/20190319/4c8a0f660622c65f9739c1a3104d36cc.jpg', '100', '100', 'jpg', '0', '2414', 'image/jpeg', '', '1552987300', '1552987300', '1552987300', 'local', 'c7a083d139dc9fa216c83d7b176dd1578afb48ef');
INSERT INTO `fa_attachment` VALUES ('17', '6', '0', '/uploads/20190319/c79433ff2ea56a01ac0a38bce2cab590.png', '100', '100', 'png', '0', '11825', 'image/png', '', '1552987373', '1552987373', '1552987373', 'local', '7a1da7909bf02eebfbdbedf24b30a7974f61eb89');
INSERT INTO `fa_attachment` VALUES ('18', '6', '0', '/uploads/20190319/394d744153a8279a5574a85720e946b0.jpg', '100', '100', 'jpg', '0', '14027', 'image/jpeg', '', '1552987467', '1552987467', '1552987467', 'local', 'efda42dca39391cb34aae1a5275432ed816d9229');
INSERT INTO `fa_attachment` VALUES ('19', '6', '0', '/uploads/20190319/c79433ff2ea56a01ac0a38bce2cab590.png', '100', '100', 'png', '0', '11825', 'image/png', '', '1552987830', '1552987830', '1552987830', 'local', '7a1da7909bf02eebfbdbedf24b30a7974f61eb89');
INSERT INTO `fa_attachment` VALUES ('20', '6', '0', '/uploads/20190320/225727cee3fe1610dd38aa748076abc8.png', '221', '302', 'png', '0', '76189', 'image/png', '', '1553077478', '1553077478', '1553077478', 'local', 'a59b0270ceec3a42a683a4d8e35ade97be942aa9');
INSERT INTO `fa_attachment` VALUES ('21', '6', '0', '/uploads/20190320/225727cee3fe1610dd38aa748076abc8.png', '221', '302', 'png', '0', '76189', 'image/png', '', '1553077845', '1553077845', '1553077845', 'local', 'a59b0270ceec3a42a683a4d8e35ade97be942aa9');
INSERT INTO `fa_attachment` VALUES ('22', '6', '0', '/uploads/20190322/acb72f0c89ddc8e52218712088bebce5.png', '700', '279', 'png', '0', '77558', 'image/png', '', '1553234493', '1553234493', '1553234493', 'local', 'c61f7eba8433237d0d3884078cd58dba98f060ba');
INSERT INTO `fa_attachment` VALUES ('23', '6', '0', '/uploads/20190322/acb72f0c89ddc8e52218712088bebce5.png', '700', '279', 'png', '0', '77558', 'image/png', '', '1553234595', '1553234595', '1553234595', 'local', 'c61f7eba8433237d0d3884078cd58dba98f060ba');
INSERT INTO `fa_attachment` VALUES ('24', '6', '0', '/uploads/20190322/acb72f0c89ddc8e52218712088bebce5.png', '700', '279', 'png', '0', '77558', 'image/png', '', '1553235316', '1553235316', '1553235316', 'local', 'c61f7eba8433237d0d3884078cd58dba98f060ba');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `fa_auth_group` VALUES ('2', '1', '一级管理组', '8,9,10,11,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,85,86,87,88,89,90,93,94,95,96,97,98,99,100,101,102,107,108,112,116,117,118,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,2,5,66', '1490883540', '1552963540', 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES ('1', '1');
INSERT INTO `fa_auth_group_access` VALUES ('6', '2');

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1497429920', '144', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '1', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-list', '', 'Category tips', '1', '1497429920', '1497429920', '7', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1502035509', '132', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '13', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '34', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '41', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '47', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '14', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '19', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '23', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '28', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '8', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '9', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '11', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '10', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '12', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '42', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '43', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '44', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '45', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '46', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '35', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '36', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '37', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '38', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '39', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '40', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '53', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '2', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '3', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '4', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '5', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '6', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '15', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '16', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '17', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '18', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '20', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '21', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '22', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '24', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '25', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '26', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '27', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '143', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '142', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '141', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '140', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('59', 'file', '4', 'addon/local', 'Local install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '139', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '138', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('61', 'file', '4', 'addon/install', 'Install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '137', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('62', 'file', '4', 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '136', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '135', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '134', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '133', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('66', 'file', '0', 'user', 'User', 'fa fa-list', '', '', '1', '1516374729', '1516374729', '113', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('67', 'file', '66', 'user/user', 'User', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '131', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('68', 'file', '67', 'user/user/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '130', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('69', 'file', '67', 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '129', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('70', 'file', '67', 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '128', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('71', 'file', '67', 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '127', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('72', 'file', '67', 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '126', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('73', 'file', '66', 'user/group', 'User group', 'fa fa-users', '', '', '1', '1516374729', '1516374729', '125', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('74', 'file', '73', 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '124', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('75', 'file', '73', 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '123', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('76', 'file', '73', 'user/group/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '122', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('77', 'file', '73', 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '121', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('78', 'file', '73', 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '120', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('79', 'file', '66', 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '1', '1516374729', '1516374729', '119', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('80', 'file', '79', 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '118', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('81', 'file', '79', 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '117', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('82', 'file', '79', 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '116', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('83', 'file', '79', 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '115', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('84', 'file', '79', 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '114', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('85', 'file', '0', 'games', '游戏管理', 'fa fa-circle-o', '', '', '1', '1552613049', '1552613049', '112', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('86', 'file', '0', 'gslideshow', '游戏轮播', 'fa fa-circle-o', '', '', '1', '1552613111', '1552613111', '111', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('87', 'file', '0', 'invite', '邀请好友拿现金', 'fa fa-circle-o', '', '', '1', '1552613184', '1552613184', '110', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('88', 'file', '0', 'notice', '通知', 'fa fa-circle-o', '', '', '1', '1552615446', '1552615446', '109', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('89', 'file', '0', 'product12', '商品管理', 'fa fa-circle-o', '', '', '1', '1552615619', '1552615619', '108', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('90', 'file', '0', 'turndesc', '转盘描述', 'fa fa-circle-o', '', '', '1', '1552615699', '1552615699', '107', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('93', 'file', '0', 'usergift', '新手礼包', 'fa fa-circle-o', '', '', '1', '1552615878', '1552615878', '106', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('94', 'file', '0', 'userslideshow', '用户背景', 'fa fa-circle-o', '', '', '1', '1552615912', '1552615947', '65', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('95', 'file', '85', 'games/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615913', '1552615958', '105', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('96', 'file', '85', 'games/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615913', '1552615913', '104', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('97', 'file', '85', 'games/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615913', '1552615913', '103', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('98', 'file', '85', 'games/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615913', '1552615913', '102', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('99', 'file', '85', 'games/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '101', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('100', 'file', '86', 'gslideshow/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '100', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('101', 'file', '86', 'gslideshow/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '99', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('102', 'file', '86', 'gslideshow/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '98', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('107', 'file', '86', 'gslideshow/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '97', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('108', 'file', '86', 'gslideshow/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '96', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('112', 'file', '87', 'invite/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '95', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('116', 'file', '87', 'invite/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '94', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('117', 'file', '87', 'invite/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '93', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('118', 'file', '87', 'invite/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '92', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('120', 'file', '87', 'invite/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '91', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('121', 'file', '88', 'notice/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '90', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('122', 'file', '88', 'notice/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '89', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('123', 'file', '88', 'notice/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '88', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('124', 'file', '88', 'notice/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '87', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('125', 'file', '88', 'notice/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '86', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('126', 'file', '89', 'product12/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '85', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('127', 'file', '89', 'product12/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '84', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('128', 'file', '89', 'product12/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '83', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('129', 'file', '89', 'product12/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '82', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('130', 'file', '89', 'product12/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '81', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('131', 'file', '90', 'turndesc/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '80', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('132', 'file', '90', 'turndesc/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '79', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('133', 'file', '90', 'turndesc/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '78', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('134', 'file', '90', 'turndesc/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '77', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('135', 'file', '90', 'turndesc/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '76', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('146', 'file', '93', 'usergift/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '75', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('147', 'file', '93', 'usergift/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '74', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('148', 'file', '93', 'usergift/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '73', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('149', 'file', '93', 'usergift/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '72', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('150', 'file', '93', 'usergift/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '71', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('151', 'file', '94', 'userslideshow/index', 'View', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '70', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('152', 'file', '94', 'userslideshow/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '69', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('153', 'file', '94', 'userslideshow/add', 'Add', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '68', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('154', 'file', '94', 'userslideshow/del', 'Del', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '67', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('155', 'file', '94', 'userslideshow/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1552615912', '1552615913', '66', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('156', 'file', '0', 'turntable', '转盘管理', 'fa fa-circle-o', '', '', '1', '1552631537', '1552631537', '59', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('157', 'file', '156', 'turntable/index', '查看', 'fa fa-circle-o', '', '', '0', '1552631537', '1552631537', '64', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('158', 'file', '156', 'turntable/add', '添加', 'fa fa-circle-o', '', '', '0', '1552631537', '1552631537', '63', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('159', 'file', '156', 'turntable/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1552631537', '1552631537', '62', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('160', 'file', '156', 'turntable/del', '删除', 'fa fa-circle-o', '', '', '0', '1552631537', '1552631537', '61', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('161', 'file', '156', 'turntable/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1552631537', '1552631537', '60', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('162', 'file', '0', 'turntableconfig', '转盘配置', 'fa fa-circle-o', '', '', '1', '1552632589', '1552632589', '33', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('163', 'file', '162', 'turntableconfig/index', '查看', 'fa fa-circle-o', '', '', '0', '1552632589', '1552632589', '58', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('164', 'file', '162', 'turntableconfig/add', '添加', 'fa fa-circle-o', '', '', '0', '1552632589', '1552632589', '57', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('165', 'file', '162', 'turntableconfig/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1552632589', '1552632589', '56', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('166', 'file', '162', 'turntableconfig/del', '删除', 'fa fa-circle-o', '', '', '0', '1552632589', '1552632589', '55', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('167', 'file', '162', 'turntableconfig/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1552632589', '1552632589', '54', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('168', 'file', '0', 'activity', '活动管理', 'fa fa-circle-o', '', '', '1', '1552963464', '1552963464', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('169', 'file', '168', 'activity/index', '查看', 'fa fa-circle-o', '', '', '0', '1552963464', '1552963464', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('170', 'file', '168', 'activity/add', '添加', 'fa fa-circle-o', '', '', '0', '1552963464', '1552963464', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('171', 'file', '168', 'activity/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1552963464', '1552963464', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('172', 'file', '168', 'activity/del', '删除', 'fa fa-circle-o', '', '', '0', '1552963464', '1552963464', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('173', 'file', '168', 'activity/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1552963464', '1552963464', '0', 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1495262190', '1', 'normal');
INSERT INTO `fa_category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `fa_category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `fa_category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `fa_category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `fa_category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `fa_category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'normal');
INSERT INTO `fa_category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `fa_category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `fa_category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `fa_category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `fa_category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `fa_category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for fa_ceshi
-- ----------------------------
DROP TABLE IF EXISTS `fa_ceshi`;
CREATE TABLE `fa_ceshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_ceshi
-- ----------------------------

-- ----------------------------
-- Table structure for fa_code
-- ----------------------------
DROP TABLE IF EXISTS `fa_code`;
CREATE TABLE `fa_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `code` int(11) NOT NULL COMMENT '验证码',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='验证码';

-- ----------------------------
-- Records of fa_code
-- ----------------------------
INSERT INTO `fa_code` VALUES ('1', '18621560247', '928683', '1538990885', '0');
INSERT INTO `fa_code` VALUES ('2', '18591407523', '721788', '1539913498', '0');
INSERT INTO `fa_code` VALUES ('3', '8618591407523', '247612', '1552611794', '0');
INSERT INTO `fa_code` VALUES ('4', '8618621560247', '162027', '1539942469', '0');
INSERT INTO `fa_code` VALUES ('5', '8617765118447', '284098', '1553218137', '0');
INSERT INTO `fa_code` VALUES ('6', '8613761351568', '778455', '1552621281', '0');
INSERT INTO `fa_code` VALUES ('7', '8613311912388', '957546', '1539563429', '0');
INSERT INTO `fa_code` VALUES ('8', '8613482414040', '200954', '1542526451', '0');
INSERT INTO `fa_code` VALUES ('9', '8613701943927', '112548', '1553074696', '0');
INSERT INTO `fa_code` VALUES ('10', '8615062513200', '712565', '1552620739', '0');
INSERT INTO `fa_code` VALUES ('11', '8613901777974', '736328', '1543539764', '0');
INSERT INTO `fa_code` VALUES ('12', '8613817932732', '573052', '1543539767', '0');
INSERT INTO `fa_code` VALUES ('13', '8615565128656', '427788', '1552617322', '0');
INSERT INTO `fa_code` VALUES ('14', '8618516598785', '683783', '1544669581', '0');
INSERT INTO `fa_code` VALUES ('15', '8617511696527', '380154', '1553236494', '0');
INSERT INTO `fa_code` VALUES ('16', '8618201738127', '696207', '1553136920', '0');
INSERT INTO `fa_code` VALUES ('17', '8618018686768', '659179', '1553221743', '0');
INSERT INTO `fa_code` VALUES ('18', '8617717658858', '435601', '1553231780', '0');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `fa_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_conversion
-- ----------------------------
DROP TABLE IF EXISTS `fa_conversion`;
CREATE TABLE `fa_conversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `avatar` varchar(255) NOT NULL COMMENT '用户头像',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `mobile` varchar(255) NOT NULL COMMENT '手机号码',
  `pname` varchar(255) NOT NULL COMMENT '商品名称',
  `image` varchar(255) NOT NULL COMMENT '商品图片',
  `num` int(11) NOT NULL COMMENT '购买数量',
  `value` varchar(255) NOT NULL COMMENT '商品价值',
  `face_value` varchar(255) NOT NULL DEFAULT '' COMMENT '面值',
  `expiretime` datetime NOT NULL COMMENT '有效期',
  `status` enum('未使用','已使用','已过期') NOT NULL DEFAULT '未使用' COMMENT '状态',
  `source` varchar(255) NOT NULL DEFAULT '兑换' COMMENT '来源',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='兑换记录';

-- ----------------------------
-- Records of fa_conversion
-- ----------------------------
INSERT INTO `fa_conversion` VALUES ('1', '1000005', 'https://wsapps.cn/relaxed/public/uploads/images/20181022/1eea90ddc1c1fe1036438f4d3792f048.jpg', '陈锋', '18621560247', '100元话费券', '/uploads/20181101/5e51d2329ae20a541dad7c063b5bea30.png', '1', '21000', '', '0000-00-00 00:00:00', '未使用', '兑换', '1541066358');
INSERT INTO `fa_conversion` VALUES ('2', '1000006', 'https://wsapps.cn/relaxed/public/uploads/images/20181029/ed068ff1f5202e6c1dbd2ba6fcd8d129.jpg', '周万里', '13761351568', '10元话费券', '/uploads/20181101/d8ac12a1654a528e4b122b5a3bbc4373.png', '1', '2100', '', '0000-00-00 00:00:00', '未使用', '兑换', '1541657213');
INSERT INTO `fa_conversion` VALUES ('3', '1000002', 'https://wsapps.cn/relaxed/public/uploads/images/20181022/2695cc3fb3a3830e8d790a80e29300dc.jpg', '李新宝', '18888888888', '5元京东卡', '/uploads/20181101/0288f4db23336e28471ed98d3efc65d6.png', '1', '1050', '', '4000-04-01 00:00:00', '未使用', '兑换', '1542694725');

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of fa_ems
-- ----------------------------

-- ----------------------------
-- Table structure for fa_games
-- ----------------------------
DROP TABLE IF EXISTS `fa_games`;
CREATE TABLE `fa_games` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `appid` varchar(255) DEFAULT NULL COMMENT '游戏ID',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') DEFAULT 'normal' COMMENT '状态',
  `weigh` int(11) NOT NULL COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='游戏管理';

-- ----------------------------
-- Records of fa_games
-- ----------------------------
INSERT INTO `fa_games` VALUES ('1', '/uploads/20180929/d2787da3b95f8b04e7ca1a9d04eef250.png', '学霸学渣', '谁才是真正的头脑王者', 'wxb6417d92bb52a17b', '1538187157', 'hidden', '2');
INSERT INTO `fa_games` VALUES ('2', '/uploads/20180929/95125a7b89375e834651745887f9123e.png', '找你喵', '终于发现同桌是色盲', 'wx96e2c1d4ff288463', '1538187193', 'normal', '3');
INSERT INTO `fa_games` VALUES ('3', '/uploads/20190320/225727cee3fe1610dd38aa748076abc8.png', '棋牌游戏', '可获取更多奖励', '', '1538187283', 'normal', '1');
INSERT INTO `fa_games` VALUES ('4', '/uploads/20181115/d146a4b4f14586c3a64c1a82f99af6d1.png', '欢乐线', '这是一条有腔调的线', 'wxdd1912f3bf025fc2', '1542268699', 'hidden', '4');

-- ----------------------------
-- Table structure for fa_gslideshow
-- ----------------------------
DROP TABLE IF EXISTS `fa_gslideshow`;
CREATE TABLE `fa_gslideshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='游戏轮播';

-- ----------------------------
-- Records of fa_gslideshow
-- ----------------------------
INSERT INTO `fa_gslideshow` VALUES ('1', '/uploads/20181103/f8f8f3b5b2a402fd02b2edb929fa55b9.png', '123', '1538128542', 'hidden');
INSERT INTO `fa_gslideshow` VALUES ('2', '/uploads/20181103/e2a34205893ef32e9d5e8b6ed6c7e671.png', '123', '1538128559', 'hidden');
INSERT INTO `fa_gslideshow` VALUES ('3', '/uploads/20181103/93a671ea91d7cac25dfb5b6355c27738.png', '123', '1538128571', 'normal');
INSERT INTO `fa_gslideshow` VALUES ('4', '/uploads/20190322/acb72f0c89ddc8e52218712088bebce5.png', '123', '1553234598', 'normal');

-- ----------------------------
-- Table structure for fa_indent
-- ----------------------------
DROP TABLE IF EXISTS `fa_indent`;
CREATE TABLE `fa_indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `avatar` varchar(255) NOT NULL COMMENT '用户头像',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `mobile` varchar(255) NOT NULL COMMENT '手机号码',
  `pname` varchar(255) NOT NULL COMMENT '商品名称',
  `image` varchar(255) NOT NULL COMMENT '商品图片',
  `num` int(11) NOT NULL COMMENT '购买数量',
  `value` varchar(255) NOT NULL COMMENT '商品价值',
  `formid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'no' COMMENT '状态',
  `phone` varchar(255) NOT NULL DEFAULT '无' COMMENT '备注',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单审核';

-- ----------------------------
-- Records of fa_indent
-- ----------------------------
INSERT INTO `fa_indent` VALUES ('1', '1000002', 'https://wsapps.cn/relaxed/public/uploads/images/20181022/2695cc3fb3a3830e8d790a80e29300dc.jpg', '李新宝', '18888888888', '5元京东卡', '/uploads/20181101/0288f4db23336e28471ed98d3efc65d6.png', '1', '1050', '31a8fefa74ecb6c94cd009bb103802b8', 'ok', '无', '1542694679');
INSERT INTO `fa_indent` VALUES ('3', '1000005', 'https://picc.18178.net/relaxed/public/uploads/images/20181102/b674c552bf513050927c036b9a0cb223.jpg', '陈锋', '18621560247', '10元话费券', '/uploads/20181101/d8ac12a1654a528e4b122b5a3bbc4373.png', '1', '2100', 'the formId is a mock one', 'ok', '无', '1542694945');
INSERT INTO `fa_indent` VALUES ('4', '1000005', 'https://picc.18178.net/relaxed/public/uploads/images/20181102/b674c552bf513050927c036b9a0cb223.jpg', '陈锋', '18621560247', '10元话费券', '/uploads/20181101/d8ac12a1654a528e4b122b5a3bbc4373.png', '1', '2100', 'the formId is a mock one', 'ok', '无', '1542695994');
INSERT INTO `fa_indent` VALUES ('5', '1000004', 'https://wsapps.cn/relaxed/public/uploads/images/20181022/07d56577252f3cd66647409e885ff05d.jpg', '胡公靖', '17765118447', '10元话费券', '/uploads/20181101/d8ac12a1654a528e4b122b5a3bbc4373.png', '1', '2100', 'e25537d12bd1d8fc6114d2ef516a5c69', 'ok', '无', '1547184707');
INSERT INTO `fa_indent` VALUES ('6', '1000004', 'https://wsapps.cn/relaxed/public/uploads/images/20181022/07d56577252f3cd66647409e885ff05d.jpg', '胡公靖', '17765118447', '10元话费券', '/uploads/20181101/d8ac12a1654a528e4b122b5a3bbc4373.png', '1', '2100', '7bb5e6ebb5b6278c907dfd243696ced8', 'ok', '无', '1547184737');
INSERT INTO `fa_indent` VALUES ('7', '1000004', 'https://wsapps.cn/relaxed/public/uploads/images/20181022/07d56577252f3cd66647409e885ff05d.jpg', '胡公靖', '17765118447', '10元话费券', '/uploads/20181101/d8ac12a1654a528e4b122b5a3bbc4373.png', '1', '2100', '14a312976170016427a2026c01dba20b', 'ok', '无', '1548065807');
INSERT INTO `fa_indent` VALUES ('8', '1000004', 'https://wsapps.cn/relaxed/public/uploads/images/20181022/07d56577252f3cd66647409e885ff05d.jpg', '胡公靖', '17765118447', '5元京东卡', '/uploads/20181101/0288f4db23336e28471ed98d3efc65d6.png', '1', '1050', '02d8eeb946d293bbd49e47db951ffe71', 'ok', '无', '1548065833');

-- ----------------------------
-- Table structure for fa_invite
-- ----------------------------
DROP TABLE IF EXISTS `fa_invite`;
CREATE TABLE `fa_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image` varchar(255) DEFAULT NULL COMMENT '活动海报',
  `content` text COMMENT '活动内容',
  `activity` varchar(1000) DEFAULT NULL COMMENT '活动时间',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='邀请好友拿现金';

-- ----------------------------
-- Records of fa_invite
-- ----------------------------
INSERT INTO `fa_invite` VALUES ('1', '', '<p style=\"text-align: center;\"><span style=\"font-size: 18px;\"><b>0元抽IphoneXS</b></span></p><h4 style=\"text-align: justify;\">尊敬的PICC用户，为了回馈多年来你们的忠实陪伴，“轻松一刻”大转盘活动添加新奖励“iphoneXS”，您可以通过每天登陆PICC“轻松一刻”小程序，即可获得大转盘抽奖机会一次。</h4><h4 style=\"text-align: justify;\">活动时间：2019-03-01 至 2020-03-01&nbsp;</h4><h4 style=\"text-align: justify;\">活动人群：所有PICC“轻松一刻”用户</h4><h4 style=\"text-align: justify;\">活动奖品：活跃值，10元京东卡，话费，金币，iphone手机（具体型号：Apple iPhone XS (A2100) 64GB 深空灰色）</h4><h4 style=\"text-align: justify;\">活动规则：每一位PICC“轻松一刻”用户每天登录可以领取一次大转盘抽奖机会。点击转动转盘，转盘停止时指针所指向的奖品即为用户所获得的奖品。</h4><p><span style=\"font-size: 10px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p style=\"text-align: right; \"><span style=\"font-size: 10px;\">活动最终解释权归中国人保财险上海分公司所有</span></p>', '2019-03-01 至 2020-03-01', '1540445589');

-- ----------------------------
-- Table structure for fa_notice
-- ----------------------------
DROP TABLE IF EXISTS `fa_notice`;
CREATE TABLE `fa_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text NOT NULL COMMENT '内容',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通知';

-- ----------------------------
-- Records of fa_notice
-- ----------------------------
INSERT INTO `fa_notice` VALUES ('1', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;字符型常量所表示的值是字符型变量所能包含的值。我们可以用ASCII表达式来表示一个字符型常量，或者用单引号内加反斜杠表示转义字符。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;字符型常量所表示的值是字符型变量所能包含的值。我们可以用ASCII表达式来表示一个字符型常量，或者用单引号内加反斜杠表示转义字符。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;字符型常量所表示的值是字符型变量所能包含的值。我们可以用ASCII表达式来表示一个字符型常量，或者用单引号内加反斜杠表示转义字符。</p><p><br></p>', '1539053843', 'normal');

-- ----------------------------
-- Table structure for fa_notices
-- ----------------------------
DROP TABLE IF EXISTS `fa_notices`;
CREATE TABLE `fa_notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `sendname` varchar(255) NOT NULL COMMENT '发送人称谓',
  `createtime` int(11) NOT NULL COMMENT '发送时间',
  `type` varchar(255) NOT NULL DEFAULT 'no' COMMENT '是否接受',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 COMMENT='用户通知';

-- ----------------------------
-- Records of fa_notices
-- ----------------------------
INSERT INTO `fa_notices` VALUES ('3', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540429893', 'ok');
INSERT INTO `fa_notices` VALUES ('4', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540429986', 'ok');
INSERT INTO `fa_notices` VALUES ('5', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540430152', 'ok');
INSERT INTO `fa_notices` VALUES ('6', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540430175', 'ok');
INSERT INTO `fa_notices` VALUES ('7', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540430704', 'ok');
INSERT INTO `fa_notices` VALUES ('8', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540431047', 'ok');
INSERT INTO `fa_notices` VALUES ('9', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540431253', 'ok');
INSERT INTO `fa_notices` VALUES ('10', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540431379', 'ok');
INSERT INTO `fa_notices` VALUES ('21', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540431539', 'ok');
INSERT INTO `fa_notices` VALUES ('22', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540431566', 'ok');
INSERT INTO `fa_notices` VALUES ('23', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432251', 'ok');
INSERT INTO `fa_notices` VALUES ('24', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432413', 'ok');
INSERT INTO `fa_notices` VALUES ('25', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432426', 'ok');
INSERT INTO `fa_notices` VALUES ('26', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432594', 'ok');
INSERT INTO `fa_notices` VALUES ('27', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432623', 'ok');
INSERT INTO `fa_notices` VALUES ('28', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432671', 'ok');
INSERT INTO `fa_notices` VALUES ('29', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432695', 'ok');
INSERT INTO `fa_notices` VALUES ('30', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540432824', 'ok');
INSERT INTO `fa_notices` VALUES ('31', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540438997', 'ok');
INSERT INTO `fa_notices` VALUES ('32', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540444847', 'ok');
INSERT INTO `fa_notices` VALUES ('33', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540444900', 'ok');
INSERT INTO `fa_notices` VALUES ('34', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540445059', 'ok');
INSERT INTO `fa_notices` VALUES ('35', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540447117', 'ok');
INSERT INTO `fa_notices` VALUES ('36', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540447340', 'ok');
INSERT INTO `fa_notices` VALUES ('37', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540447487', 'ok');
INSERT INTO `fa_notices` VALUES ('38', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540447920', 'ok');
INSERT INTO `fa_notices` VALUES ('39', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540448025', 'ok');
INSERT INTO `fa_notices` VALUES ('40', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540448044', 'ok');
INSERT INTO `fa_notices` VALUES ('41', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540452432', 'ok');
INSERT INTO `fa_notices` VALUES ('42', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540452446', 'ok');
INSERT INTO `fa_notices` VALUES ('43', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540454792', 'ok');
INSERT INTO `fa_notices` VALUES ('44', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1540454881', 'ok');
INSERT INTO `fa_notices` VALUES ('45', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540460890', 'ok');
INSERT INTO `fa_notices` VALUES ('46', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540460906', 'no');
INSERT INTO `fa_notices` VALUES ('47', '1000004', '订单提交成功', '您在2018-10-25 17:48:42兑换全国移动流量充值卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540460922', 'no');
INSERT INTO `fa_notices` VALUES ('48', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540465715', 'ok');
INSERT INTO `fa_notices` VALUES ('49', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540466253', 'ok');
INSERT INTO `fa_notices` VALUES ('50', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540467662', 'ok');
INSERT INTO `fa_notices` VALUES ('51', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540468561', 'ok');
INSERT INTO `fa_notices` VALUES ('52', '1000002', '卡卷过期提醒', '您在2018-10-24 16:29:35提交的订单，将在2018-10-26 00:00:00失效，本次兑换物品为iphone xs，请尽快使用！', '轻松一刻', '1540470942', 'ok');
INSERT INTO `fa_notices` VALUES ('55', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540522444', 'no');
INSERT INTO `fa_notices` VALUES ('56', '1000004', '订单提交成功', '您在2018-10-26 10:55:49兑换iphone xs的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540522549', 'no');
INSERT INTO `fa_notices` VALUES ('59', '1000004', '订单审核通过', '您在2018-10-26 10:55:49提交的订单已通过审核，本次兑换物品为iphone xs，消耗100000活跃值，还剩4999活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1540778762', 'no');
INSERT INTO `fa_notices` VALUES ('63', '1000004', '订单提交成功', '您在2018-10-29 10:45:15兑换全国移动流量充值卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540781115', 'no');
INSERT INTO `fa_notices` VALUES ('64', '1000004', '订单审核通过', '您在2018-10-29 10:45:15提交的订单已通过审核，本次兑换物品为全国移动流量充值卡，消耗800活跃值，还剩4活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1540790394', 'no');
INSERT INTO `fa_notices` VALUES ('65', '1000004', '订单审核通过', '您在2018-10-26 14:19:21提交的订单已通过审核，本次兑换物品为全国移动流量充值卡，消耗800活跃值，还剩3活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1540790397', 'no');
INSERT INTO `fa_notices` VALUES ('66', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1540794646', 'ok');
INSERT INTO `fa_notices` VALUES ('68', '1000002', '订单提交成功', '您在2018-10-30 11:07:29兑换iphone xs的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540868849', 'ok');
INSERT INTO `fa_notices` VALUES ('69', '1000002', '订单审核通过', '您在2018-10-30 11:07:29提交的订单已通过审核，本次兑换物品为iphone xs，消耗100000活跃值，还剩4999活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1540868872', 'ok');
INSERT INTO `fa_notices` VALUES ('71', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540881158', 'ok');
INSERT INTO `fa_notices` VALUES ('72', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1540881159', 'ok');
INSERT INTO `fa_notices` VALUES ('73', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540881171', 'ok');
INSERT INTO `fa_notices` VALUES ('74', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540881173', 'ok');
INSERT INTO `fa_notices` VALUES ('75', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1540894991', 'no');
INSERT INTO `fa_notices` VALUES ('76', '1000002', '订单提交成功', '您在2018-10-31 08:55:33兑换全国移动流量充值卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540947333', 'ok');
INSERT INTO `fa_notices` VALUES ('77', '1000002', '订单审核未通过', '您在2018-10-31 08:55:33提交的订单未通过审核，本次兑换物品为全国移动流量充值卡，您可以关注我们的公众号“18178休闲游戏娱乐平台” 联系客服人员，感谢您的理解与支持！', '轻松一刻', '1540947377', 'ok');
INSERT INTO `fa_notices` VALUES ('80', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540952721', 'ok');
INSERT INTO `fa_notices` VALUES ('81', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得100活跃值奖励，真是运气爆棚！', '轻松一刻', '1540966876', 'ok');
INSERT INTO `fa_notices` VALUES ('82', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1540966888', 'ok');
INSERT INTO `fa_notices` VALUES ('83', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1540966900', 'ok');
INSERT INTO `fa_notices` VALUES ('84', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得100活跃值奖励，真是运气爆棚！', '轻松一刻', '1540966910', 'ok');
INSERT INTO `fa_notices` VALUES ('85', '1000006', '订单提交成功', '您在2018-10-31 15:07:04兑换全国移动流量充值卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540969624', 'ok');
INSERT INTO `fa_notices` VALUES ('86', '1000006', '订单审核通过', '您在2018-10-31 15:07:04提交的订单已通过审核，本次兑换物品为全国移动流量充值卡，消耗800活跃值，还剩0活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1540969640', 'ok');
INSERT INTO `fa_notices` VALUES ('87', '1000006', '订单提交成功', '您在2018-10-31 15:55:52兑换全国移动流量充值卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540972552', 'ok');
INSERT INTO `fa_notices` VALUES ('88', '1000006', '订单提交成功', '您在2018-10-31 15:58:56兑换全国移动流量充值卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1540972736', 'ok');
INSERT INTO `fa_notices` VALUES ('89', '1000006', '订单审核未通过', '您在2018-10-31 15:55:52提交的订单未通过审核，本次兑换物品为全国移动流量充值卡，您可以关注我们的公众号“18178休闲游戏娱乐平台” 联系客服人员，感谢您的理解与支持！', '轻松一刻', '1540972853', 'ok');
INSERT INTO `fa_notices` VALUES ('90', '1000006', '订单审核通过', '您在2018-10-31 15:58:56提交的订单已通过审核，本次兑换物品为全国移动流量充值卡，消耗800活跃值，还剩-1活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1540972928', 'ok');
INSERT INTO `fa_notices` VALUES ('91', '1000006', '订单提交成功', '您在2018-11-01 11:44:19兑换全国移动流量充值卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1541043859', 'ok');
INSERT INTO `fa_notices` VALUES ('92', '1000006', '订单审核通过', '您在2018-11-01 11:44:19提交的订单已通过审核，本次兑换物品为全国移动流量充值卡，消耗800活跃值，还剩-1活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1541043893', 'ok');
INSERT INTO `fa_notices` VALUES ('93', '1000002', '订单提交成功', '您在2018-11-01 14:57:11兑换积分兑彩的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1541055431', 'ok');
INSERT INTO `fa_notices` VALUES ('105', '1000002', '订单提交成功', '您在2018-11-01 16:03:14兑换10元话费券的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1541059394', 'ok');
INSERT INTO `fa_notices` VALUES ('106', '1000002', '订单审核通过', '您在2018-11-01 16:03:14提交的订单已通过审核，本次兑换物品为10元话费券，消耗2100活跃值，还剩239活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1541059421', 'ok');
INSERT INTO `fa_notices` VALUES ('109', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541065010', 'ok');
INSERT INTO `fa_notices` VALUES ('110', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541065021', 'ok');
INSERT INTO `fa_notices` VALUES ('114', '1000005', '订单审核未通过', '您在2018-11-01 18:00:53提交的订单未通过审核，本次兑换物品为10元话费券，您可以关注我们的公众号“18178休闲游戏娱乐平台” 联系客服人员，感谢您的理解与支持！', '轻松一刻', '1541066528', 'no');
INSERT INTO `fa_notices` VALUES ('115', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070472', 'no');
INSERT INTO `fa_notices` VALUES ('116', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070481', 'no');
INSERT INTO `fa_notices` VALUES ('117', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070482', 'no');
INSERT INTO `fa_notices` VALUES ('118', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070489', 'no');
INSERT INTO `fa_notices` VALUES ('119', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070490', 'no');
INSERT INTO `fa_notices` VALUES ('120', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070496', 'no');
INSERT INTO `fa_notices` VALUES ('121', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070503', 'ok');
INSERT INTO `fa_notices` VALUES ('122', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541070503', 'ok');
INSERT INTO `fa_notices` VALUES ('123', '1000004', '中奖啦', '恭喜您，在幸运转盘中获得2元话费*1奖励，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1541127176', 'ok');
INSERT INTO `fa_notices` VALUES ('124', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541127177', 'ok');
INSERT INTO `fa_notices` VALUES ('125', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541152666', 'no');
INSERT INTO `fa_notices` VALUES ('126', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541152680', 'ok');
INSERT INTO `fa_notices` VALUES ('127', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541152688', 'ok');
INSERT INTO `fa_notices` VALUES ('128', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541152702', 'ok');
INSERT INTO `fa_notices` VALUES ('130', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1541336844', 'ok');
INSERT INTO `fa_notices` VALUES ('131', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541336852', 'ok');
INSERT INTO `fa_notices` VALUES ('132', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541336865', 'ok');
INSERT INTO `fa_notices` VALUES ('133', '1000002', '订单提交成功', '您在2018-11-04 21:10:10兑换10元话费券的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1541337010', 'ok');
INSERT INTO `fa_notices` VALUES ('134', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1541383360', 'ok');
INSERT INTO `fa_notices` VALUES ('135', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541471951', 'ok');
INSERT INTO `fa_notices` VALUES ('136', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541655577', 'ok');
INSERT INTO `fa_notices` VALUES ('137', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541655595', 'ok');
INSERT INTO `fa_notices` VALUES ('138', '1000006', '订单提交成功', '您在2018-11-08 14:06:27兑换10元话费券的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1541657187', 'ok');
INSERT INTO `fa_notices` VALUES ('139', '1000006', '订单审核通过', '您在2018-11-08 14:06:27提交的订单已通过审核，本次兑换物品为10元话费券，消耗2100活跃值，还剩95510活跃值，详见兑换记录-未使用界面，请在到期日前及时使用，感谢您的理解与支持！', '轻松一刻', '1541657213', 'ok');
INSERT INTO `fa_notices` VALUES ('140', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541727142', 'ok');
INSERT INTO `fa_notices` VALUES ('141', '1000002', '订单审核未通过', '您在2018-11-04 21:10:10提交的订单未通过审核，本次兑换物品为10元话费券，您可以关注我们的公众号“18178休闲游戏娱乐平台” 联系客服人员，感谢您的理解与支持！', '轻松一刻', '1541731317', 'ok');
INSERT INTO `fa_notices` VALUES ('142', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541732254', 'ok');
INSERT INTO `fa_notices` VALUES ('143', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753213', 'ok');
INSERT INTO `fa_notices` VALUES ('144', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753214', 'ok');
INSERT INTO `fa_notices` VALUES ('145', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753214', 'ok');
INSERT INTO `fa_notices` VALUES ('146', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753215', 'ok');
INSERT INTO `fa_notices` VALUES ('147', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753215', 'ok');
INSERT INTO `fa_notices` VALUES ('148', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753236', 'ok');
INSERT INTO `fa_notices` VALUES ('149', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753236', 'ok');
INSERT INTO `fa_notices` VALUES ('150', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753333', 'ok');
INSERT INTO `fa_notices` VALUES ('151', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753341', 'ok');
INSERT INTO `fa_notices` VALUES ('152', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753341', 'ok');
INSERT INTO `fa_notices` VALUES ('153', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753838', 'ok');
INSERT INTO `fa_notices` VALUES ('154', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753838', 'ok');
INSERT INTO `fa_notices` VALUES ('156', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1541753845', 'ok');
INSERT INTO `fa_notices` VALUES ('157', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1541754421', 'ok');
INSERT INTO `fa_notices` VALUES ('158', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1541754429', 'ok');
INSERT INTO `fa_notices` VALUES ('159', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1541754443', 'ok');
INSERT INTO `fa_notices` VALUES ('160', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542088802', 'ok');
INSERT INTO `fa_notices` VALUES ('161', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542088803', 'ok');
INSERT INTO `fa_notices` VALUES ('162', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542088803', 'ok');
INSERT INTO `fa_notices` VALUES ('163', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542088804', 'ok');
INSERT INTO `fa_notices` VALUES ('164', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542088804', 'ok');
INSERT INTO `fa_notices` VALUES ('165', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1542088804', 'ok');
INSERT INTO `fa_notices` VALUES ('166', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542088805', 'ok');
INSERT INTO `fa_notices` VALUES ('169', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542269329', 'no');
INSERT INTO `fa_notices` VALUES ('170', '1000006', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542274033', 'ok');
INSERT INTO `fa_notices` VALUES ('171', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1542274086', 'no');
INSERT INTO `fa_notices` VALUES ('172', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得50活跃值奖励，真是运气爆棚！', '轻松一刻', '1542274087', 'ok');
INSERT INTO `fa_notices` VALUES ('173', '1000008', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542358200', 'no');
INSERT INTO `fa_notices` VALUES ('174', '1000009', '欢迎登录', '亲爱的18178，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1542526467', 'no');
INSERT INTO `fa_notices` VALUES ('177', '1000010', '欢迎登录', '亲爱的Z z d.，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1542700767', 'ok');
INSERT INTO `fa_notices` VALUES ('179', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1542704085', 'ok');
INSERT INTO `fa_notices` VALUES ('180', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542704089', 'ok');
INSERT INTO `fa_notices` VALUES ('181', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1542704097', 'ok');
INSERT INTO `fa_notices` VALUES ('182', '1000013', '欢迎登录', '亲爱的tiger⁶⁶⁶₆₆，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1542861047', 'ok');
INSERT INTO `fa_notices` VALUES ('183', '1000013', '欢迎登录', '亲爱的tiger⁶⁶⁶₆₆，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1542861050', 'ok');
INSERT INTO `fa_notices` VALUES ('184', '1000014', '欢迎登录', '亲爱的周万里 Kevin，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1543299795', 'ok');
INSERT INTO `fa_notices` VALUES ('185', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1543488744', 'no');
INSERT INTO `fa_notices` VALUES ('186', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1543488751', 'no');
INSERT INTO `fa_notices` VALUES ('187', '1000007', '欢迎登录', '亲爱的李捷，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1543539798', 'no');
INSERT INTO `fa_notices` VALUES ('193', '1000016', '欢迎登录', '亲爱的潘越，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1543564520', 'ok');
INSERT INTO `fa_notices` VALUES ('198', '1000012', '欢迎登录', '亲爱的阿虎，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1544669640', 'no');
INSERT INTO `fa_notices` VALUES ('199', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1545965753', 'no');
INSERT INTO `fa_notices` VALUES ('200', '1000004', '订单提交成功', '您在2019-01-11 13:31:47兑换10元话费券的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1547184708', 'no');
INSERT INTO `fa_notices` VALUES ('201', '1000004', '订单提交成功', '您在2019-01-11 13:32:17兑换10元话费券的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1547184737', 'ok');
INSERT INTO `fa_notices` VALUES ('202', '1000013', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1548034843', 'ok');
INSERT INTO `fa_notices` VALUES ('204', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1548065739', 'ok');
INSERT INTO `fa_notices` VALUES ('205', '1000004', '订单提交成功', '您在2019-01-21 18:16:47兑换10元话费券的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1548065807', 'ok');
INSERT INTO `fa_notices` VALUES ('206', '1000004', '订单提交成功', '您在2019-01-21 18:17:13兑换5元京东卡的订单已提交审核，预计审核时间6~24小时，请耐心等待！', '轻松一刻', '1548065833', 'ok');
INSERT INTO `fa_notices` VALUES ('207', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1550214262', 'ok');
INSERT INTO `fa_notices` VALUES ('209', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1550478879', 'ok');
INSERT INTO `fa_notices` VALUES ('210', '1000014', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1551176813', 'ok');
INSERT INTO `fa_notices` VALUES ('211', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1551232666', 'ok');
INSERT INTO `fa_notices` VALUES ('213', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1551236790', 'ok');
INSERT INTO `fa_notices` VALUES ('214', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1551669286', 'ok');
INSERT INTO `fa_notices` VALUES ('215', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1551669303', 'ok');
INSERT INTO `fa_notices` VALUES ('216', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1551774216', 'ok');
INSERT INTO `fa_notices` VALUES ('217', '1000002', '积分变更通知', '您于2019-03-07 11:38:46在18178平台消费100活跃值,剩余活跃值为9175525', '轻松一刻', '1551929926', 'ok');
INSERT INTO `fa_notices` VALUES ('218', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552012563', 'no');
INSERT INTO `fa_notices` VALUES ('219', '1000016', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552354302', 'ok');
INSERT INTO `fa_notices` VALUES ('220', '1000016', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552354319', 'ok');
INSERT INTO `fa_notices` VALUES ('221', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552386137', 'ok');
INSERT INTO `fa_notices` VALUES ('222', '1000016', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552446283', 'ok');
INSERT INTO `fa_notices` VALUES ('223', '1000016', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552446290', 'ok');
INSERT INTO `fa_notices` VALUES ('224', '1000014', '游戏积分奖励', '恭喜您在喵喵呢获得17活跃值!', '轻松一刻', '1552454123', 'ok');
INSERT INTO `fa_notices` VALUES ('225', '1000014', '游戏积分奖励', '恭喜您在学霸学渣游戏中获得1活跃值!', '轻松一刻', '1552454787', 'ok');
INSERT INTO `fa_notices` VALUES ('226', '1000014', '游戏积分奖励', '恭喜您在学霸学渣游戏中获得1活跃值!', '轻松一刻', '1552455437', 'ok');
INSERT INTO `fa_notices` VALUES ('227', '1000017', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552461283', 'ok');
INSERT INTO `fa_notices` VALUES ('228', '1000017', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552463213', 'ok');
INSERT INTO `fa_notices` VALUES ('229', '1000005', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552542532', 'no');
INSERT INTO `fa_notices` VALUES ('230', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552550335', 'ok');
INSERT INTO `fa_notices` VALUES ('231', '1000016', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552550362', 'ok');
INSERT INTO `fa_notices` VALUES ('232', '1000001', '欢迎登录', '亲爱的养乐多，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1552611814', 'ok');
INSERT INTO `fa_notices` VALUES ('233', '1000002', '欢迎登录', '亲爱的BULL，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1552613505', 'ok');
INSERT INTO `fa_notices` VALUES ('234', '1000001', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552617024', 'ok');
INSERT INTO `fa_notices` VALUES ('235', '1000003', '欢迎登录', '亲爱的Panyue_，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1552617349', 'ok');
INSERT INTO `fa_notices` VALUES ('236', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552617381', 'ok');
INSERT INTO `fa_notices` VALUES ('237', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552617394', 'ok');
INSERT INTO `fa_notices` VALUES ('238', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552620436', 'ok');
INSERT INTO `fa_notices` VALUES ('239', '1000004', '欢迎登录', '亲爱的tiger⁶⁶⁶₆₆，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1552620770', 'ok');
INSERT INTO `fa_notices` VALUES ('240', '1000005', '欢迎登录', '亲爱的周万里 Kevin，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1552621318', 'no');
INSERT INTO `fa_notices` VALUES ('241', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1552877845', 'ok');
INSERT INTO `fa_notices` VALUES ('242', '1000011', '欢迎登录', '亲爱的胡公靖，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1552900534', 'no');
INSERT INTO `fa_notices` VALUES ('243', '1000011', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1552902518', 'no');
INSERT INTO `fa_notices` VALUES ('244', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552902639', 'no');
INSERT INTO `fa_notices` VALUES ('245', '1000002', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1552959458', 'ok');
INSERT INTO `fa_notices` VALUES ('246', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1552976397', 'ok');
INSERT INTO `fa_notices` VALUES ('247', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1552977228', 'no');
INSERT INTO `fa_notices` VALUES ('248', '1000011', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1552982554', 'no');
INSERT INTO `fa_notices` VALUES ('249', '1000010', '欢迎登录', '亲爱的GYY，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1552984760', 'no');
INSERT INTO `fa_notices` VALUES ('254', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553059716', 'ok');
INSERT INTO `fa_notices` VALUES ('255', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553059831', 'no');
INSERT INTO `fa_notices` VALUES ('261', '1000015', '欢迎登录', '亲爱的BULL，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1553067099', 'ok');
INSERT INTO `fa_notices` VALUES ('262', '1000015', '欢迎登录', '亲爱的BULL，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1553067215', 'ok');
INSERT INTO `fa_notices` VALUES ('263', '1000012', '欢迎登录', '亲爱的Z z d.，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1553074720', 'no');
INSERT INTO `fa_notices` VALUES ('264', '1000010', '欢迎登录', '亲爱的GYY，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1553136938', 'no');
INSERT INTO `fa_notices` VALUES ('265', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553137250', 'ok');
INSERT INTO `fa_notices` VALUES ('266', '1000015', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553148683', 'ok');
INSERT INTO `fa_notices` VALUES ('267', '1000015', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553217927', 'ok');
INSERT INTO `fa_notices` VALUES ('268', '1000018', '欢迎登录', '亲爱的胡公靖，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1553218162', 'no');
INSERT INTO `fa_notices` VALUES ('269', '1000022', '欢迎登录', '亲爱的商业高新-姚', '轻松一刻', '1553221776', 'no');
INSERT INTO `fa_notices` VALUES ('270', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553233362', 'no');
INSERT INTO `fa_notices` VALUES ('271', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553233555', 'ok');
INSERT INTO `fa_notices` VALUES ('275', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236043', 'ok');
INSERT INTO `fa_notices` VALUES ('277', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236060', 'ok');
INSERT INTO `fa_notices` VALUES ('279', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236068', 'ok');
INSERT INTO `fa_notices` VALUES ('281', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236091', 'no');
INSERT INTO `fa_notices` VALUES ('283', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236098', 'no');
INSERT INTO `fa_notices` VALUES ('284', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236105', 'no');
INSERT INTO `fa_notices` VALUES ('286', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236113', 'no');
INSERT INTO `fa_notices` VALUES ('287', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236121', 'no');
INSERT INTO `fa_notices` VALUES ('288', '1000004', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236128', 'no');
INSERT INTO `fa_notices` VALUES ('289', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236201', 'no');
INSERT INTO `fa_notices` VALUES ('290', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236209', 'no');
INSERT INTO `fa_notices` VALUES ('291', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236217', 'no');
INSERT INTO `fa_notices` VALUES ('292', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236224', 'no');
INSERT INTO `fa_notices` VALUES ('293', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236238', 'no');
INSERT INTO `fa_notices` VALUES ('294', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236245', 'no');
INSERT INTO `fa_notices` VALUES ('295', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得10活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236252', 'no');
INSERT INTO `fa_notices` VALUES ('296', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236260', 'no');
INSERT INTO `fa_notices` VALUES ('297', '1000010', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236267', 'no');
INSERT INTO `fa_notices` VALUES ('298', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236272', 'no');
INSERT INTO `fa_notices` VALUES ('299', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236279', 'no');
INSERT INTO `fa_notices` VALUES ('300', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236285', 'no');
INSERT INTO `fa_notices` VALUES ('301', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236295', 'no');
INSERT INTO `fa_notices` VALUES ('302', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236309', 'no');
INSERT INTO `fa_notices` VALUES ('303', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236316', 'no');
INSERT INTO `fa_notices` VALUES ('304', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236323', 'no');
INSERT INTO `fa_notices` VALUES ('305', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得2活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236331', 'ok');
INSERT INTO `fa_notices` VALUES ('306', '1000003', '活跃值奖励', '恭喜您，在幸运转盘中获得5活跃值奖励，真是运气爆棚！', '轻松一刻', '1553236338', 'ok');
INSERT INTO `fa_notices` VALUES ('307', '1000024', '欢迎登录', '亲爱的BULL，欢迎来到人保微游戏！这里有妙趣横生的游戏、紧张刺激的对战、丰富惠民的活动……我们希望能为您带来持续性的快乐和心动，无论何时何地，您的满足，都是我们最大的骄傲！快快加入我们吧~~', '轻松一刻', '1553236511', 'ok');

-- ----------------------------
-- Table structure for fa_openapi
-- ----------------------------
DROP TABLE IF EXISTS `fa_openapi`;
CREATE TABLE `fa_openapi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `orderid` int(11) NOT NULL COMMENT '欧飞订单号',
  `cardid` int(11) NOT NULL COMMENT '商品编号',
  `cardnum` int(11) NOT NULL COMMENT '数量',
  `ordercash` float NOT NULL COMMENT '订单金额',
  `game_userid` int(11) NOT NULL COMMENT '手机号',
  `game_state` int(11) NOT NULL COMMENT '充值结果',
  `cardname` varchar(255) NOT NULL COMMENT '卡名称',
  `cardno` varchar(255) NOT NULL COMMENT '卡号',
  `cardpws` varchar(255) NOT NULL COMMENT '卡密',
  `expiretime` datetime NOT NULL,
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='欧飞接口使用记录';

-- ----------------------------
-- Records of fa_openapi
-- ----------------------------
INSERT INTO `fa_openapi` VALUES ('1', '1000002', '0', '1502312', '1', '1.54', '2147483647', '0', '', '', '', '0000-00-00 00:00:00', '1539591073');
INSERT INTO `fa_openapi` VALUES ('2', '1000006', '0', '1506711', '1', '2.54', '2147483647', '0', '上海联通手机快充2元', '', '', '0000-00-00 00:00:00', '1539671386');
INSERT INTO `fa_openapi` VALUES ('3', '1000006', '0', '1506711', '1', '2.54', '2147483647', '0', '上海联通手机快充2元', '', '', '0000-00-00 00:00:00', '1539672294');
INSERT INTO `fa_openapi` VALUES ('4', '1000006', '0', '1506711', '1', '2.54', '2147483647', '0', '上海联通手机快充2元', '', '', '0000-00-00 00:00:00', '1539672703');
INSERT INTO `fa_openapi` VALUES ('5', '1000006', '0', '1506711', '1', '2.54', '2147483647', '0', '上海联通手机快充2元', '', '', '0000-00-00 00:00:00', '1539672832');
INSERT INTO `fa_openapi` VALUES ('6', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929970', '9123456002929970', '2019-12-31 00:00:00', '1539676689');
INSERT INTO `fa_openapi` VALUES ('7', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929971', '9123456002929971', '2019-12-31 00:00:00', '1539677521');
INSERT INTO `fa_openapi` VALUES ('8', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929972', '9123456002929972', '2019-12-31 00:00:00', '1539677863');
INSERT INTO `fa_openapi` VALUES ('9', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929973', '9123456002929973', '2019-12-31 00:00:00', '1539677897');
INSERT INTO `fa_openapi` VALUES ('10', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929974', '9123456002929974', '2019-12-31 00:00:00', '1539677935');
INSERT INTO `fa_openapi` VALUES ('11', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929975', '9123456002929975', '2019-12-31 00:00:00', '1539678553');
INSERT INTO `fa_openapi` VALUES ('12', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929976', '9123456002929976', '2019-12-31 00:00:00', '1539678644');
INSERT INTO `fa_openapi` VALUES ('13', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929977', '9123456002929977', '2019-12-31 00:00:00', '1539678699');
INSERT INTO `fa_openapi` VALUES ('14', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929978', '9123456002929978', '2019-12-31 00:00:00', '1539678707');
INSERT INTO `fa_openapi` VALUES ('15', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929979', '9123456002929979', '2019-12-31 00:00:00', '1539678709');
INSERT INTO `fa_openapi` VALUES ('16', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929980', '9123456002929980', '2019-12-31 00:00:00', '1539680088');
INSERT INTO `fa_openapi` VALUES ('17', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929981', '9123456002929981', '2019-12-31 00:00:00', '1539680092');
INSERT INTO `fa_openapi` VALUES ('18', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929982', '9123456002929982', '2019-12-31 00:00:00', '1539680094');
INSERT INTO `fa_openapi` VALUES ('19', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929984', '9123456002929984', '2019-12-31 00:00:00', '1539684004');
INSERT INTO `fa_openapi` VALUES ('20', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929985', '9123456002929985', '2019-12-31 00:00:00', '1539684007');
INSERT INTO `fa_openapi` VALUES ('21', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929986', '9123456002929986', '2019-12-31 00:00:00', '1539684009');
INSERT INTO `fa_openapi` VALUES ('22', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929987', '9123456002929987', '2019-12-31 00:00:00', '1539684017');
INSERT INTO `fa_openapi` VALUES ('23', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929988', '9123456002929988', '2019-12-31 00:00:00', '1539684018');
INSERT INTO `fa_openapi` VALUES ('24', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929989', '9123456002929989', '2019-12-31 00:00:00', '1539684043');
INSERT INTO `fa_openapi` VALUES ('25', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929990', '9123456002929990', '2019-12-31 00:00:00', '1539684064');
INSERT INTO `fa_openapi` VALUES ('26', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929991', '9123456002929991', '2019-12-31 00:00:00', '1539684073');
INSERT INTO `fa_openapi` VALUES ('27', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929992', '9123456002929992', '2019-12-31 00:00:00', '1539684075');
INSERT INTO `fa_openapi` VALUES ('28', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929993', '9123456002929993', '2019-12-31 00:00:00', '1539684127');
INSERT INTO `fa_openapi` VALUES ('29', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929994', '9123456002929994', '2019-12-31 00:00:00', '1539684139');
INSERT INTO `fa_openapi` VALUES ('30', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929995', '9123456002929995', '2019-12-31 00:00:00', '1539684152');
INSERT INTO `fa_openapi` VALUES ('31', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929996', '9123456002929996', '2019-12-31 00:00:00', '1539684153');
INSERT INTO `fa_openapi` VALUES ('32', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929997', '9123456002929997', '2019-12-31 00:00:00', '1539684159');
INSERT INTO `fa_openapi` VALUES ('33', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929998', '9123456002929998', '2019-12-31 00:00:00', '1539684163');
INSERT INTO `fa_openapi` VALUES ('34', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102929999', '9123456002929999', '2019-12-31 00:00:00', '1539684165');
INSERT INTO `fa_openapi` VALUES ('35', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930000', '9123456002930000', '2019-12-31 00:00:00', '1539684167');
INSERT INTO `fa_openapi` VALUES ('36', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930001', '9123456002930001', '2019-12-31 00:00:00', '1539684439');
INSERT INTO `fa_openapi` VALUES ('37', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930002', '9123456002930002', '2019-12-31 00:00:00', '1539684443');
INSERT INTO `fa_openapi` VALUES ('38', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930003', '9123456002930003', '2019-12-31 00:00:00', '1539684445');
INSERT INTO `fa_openapi` VALUES ('39', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930004', '9123456002930004', '2019-12-31 00:00:00', '1539684448');
INSERT INTO `fa_openapi` VALUES ('40', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930005', '9123456002930005', '2019-12-31 00:00:00', '1539684451');
INSERT INTO `fa_openapi` VALUES ('41', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930006', '9123456002930006', '2019-12-31 00:00:00', '1539684454');
INSERT INTO `fa_openapi` VALUES ('42', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930007', '9123456002930007', '2019-12-31 00:00:00', '1539684456');
INSERT INTO `fa_openapi` VALUES ('43', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930008', '9123456002930008', '2019-12-31 00:00:00', '1539684459');
INSERT INTO `fa_openapi` VALUES ('44', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930009', '9123456002930009', '2019-12-31 00:00:00', '1539684461');
INSERT INTO `fa_openapi` VALUES ('45', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930010', '9123456002930010', '2019-12-31 00:00:00', '1539684463');
INSERT INTO `fa_openapi` VALUES ('46', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930011', '9123456002930011', '2019-12-31 00:00:00', '1539684466');
INSERT INTO `fa_openapi` VALUES ('47', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930012', '9123456002930012', '2019-12-31 00:00:00', '1539684960');
INSERT INTO `fa_openapi` VALUES ('48', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930013', '9123456002930013', '2019-12-31 00:00:00', '1539684961');
INSERT INTO `fa_openapi` VALUES ('49', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930014', '9123456002930014', '2019-12-31 00:00:00', '1539684962');
INSERT INTO `fa_openapi` VALUES ('50', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930015', '9123456002930015', '2019-12-31 00:00:00', '1539685038');
INSERT INTO `fa_openapi` VALUES ('51', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930016', '9123456002930016', '2019-12-31 00:00:00', '1539685125');
INSERT INTO `fa_openapi` VALUES ('52', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930017', '9123456002930017', '2019-12-31 00:00:00', '1539685129');
INSERT INTO `fa_openapi` VALUES ('53', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930018', '9123456002930018', '2019-12-31 00:00:00', '1539685133');
INSERT INTO `fa_openapi` VALUES ('54', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930019', '9123456002930019', '2019-12-31 00:00:00', '1539685247');
INSERT INTO `fa_openapi` VALUES ('55', '1000006', '0', '1506711', '1', '2.54', '2147483647', '0', '上海联通手机快充2元', '', '', '0000-00-00 00:00:00', '1539762196');
INSERT INTO `fa_openapi` VALUES ('56', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930030', '9123456002930030', '2019-12-31 00:00:00', '1539762683');
INSERT INTO `fa_openapi` VALUES ('57', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930031', '9123456002930031', '2019-12-31 00:00:00', '1539762706');
INSERT INTO `fa_openapi` VALUES ('58', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930032', '9123456002930032', '2019-12-31 00:00:00', '1539762712');
INSERT INTO `fa_openapi` VALUES ('59', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930033', '9123456002930033', '2019-12-31 00:00:00', '1539762719');
INSERT INTO `fa_openapi` VALUES ('60', '1000006', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930039', '9123456002930039', '2019-12-31 00:00:00', '1539830675');
INSERT INTO `fa_openapi` VALUES ('61', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930042', '9123456002930042', '2019-12-31 00:00:00', '1539830764');
INSERT INTO `fa_openapi` VALUES ('62', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930043', '9123456002930043', '2019-12-31 00:00:00', '1539830770');
INSERT INTO `fa_openapi` VALUES ('63', '1000006', '0', '1506711', '1', '2.54', '2147483647', '0', '上海联通手机快充2元', '', '', '0000-00-00 00:00:00', '1539831089');
INSERT INTO `fa_openapi` VALUES ('64', '1000006', '0', '1506711', '1', '2.54', '2147483647', '0', '上海联通手机快充2元', '', '', '0000-00-00 00:00:00', '1539831837');
INSERT INTO `fa_openapi` VALUES ('65', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930056', '9123456002930056', '2019-12-31 00:00:00', '1539928296');
INSERT INTO `fa_openapi` VALUES ('66', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930057', '9123456002930057', '2019-12-31 00:00:00', '1539928461');
INSERT INTO `fa_openapi` VALUES ('67', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930060', '9123456002930060', '2019-12-31 00:00:00', '1539928787');
INSERT INTO `fa_openapi` VALUES ('68', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930061', '9123456002930061', '2019-12-31 00:00:00', '1539928852');
INSERT INTO `fa_openapi` VALUES ('69', '1000001', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930062', '9123456002930062', '2019-12-31 00:00:00', '1539928923');
INSERT INTO `fa_openapi` VALUES ('70', '1000001', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930063', '9123456002930063', '2019-12-31 00:00:00', '1539929024');
INSERT INTO `fa_openapi` VALUES ('71', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930070', '9123456002930070', '2019-12-31 00:00:00', '1539940259');
INSERT INTO `fa_openapi` VALUES ('72', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930071', '9123456002930071', '2019-12-31 00:00:00', '1539940265');
INSERT INTO `fa_openapi` VALUES ('73', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930072', '9123456002930072', '2019-12-31 00:00:00', '1539940281');
INSERT INTO `fa_openapi` VALUES ('74', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930073', '9123456002930073', '2019-12-31 00:00:00', '1539940284');
INSERT INTO `fa_openapi` VALUES ('75', '1000001', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930074', '9123456002930074', '2019-12-31 00:00:00', '1539940297');
INSERT INTO `fa_openapi` VALUES ('76', '1000001', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930075', '9123456002930075', '2019-12-31 00:00:00', '1539940311');
INSERT INTO `fa_openapi` VALUES ('77', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930076', '9123456002930076', '2019-12-31 00:00:00', '1539940326');
INSERT INTO `fa_openapi` VALUES ('78', '1000001', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930077', '9123456002930077', '2019-12-31 00:00:00', '1539940332');
INSERT INTO `fa_openapi` VALUES ('79', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930078', '9123456002930078', '2019-12-31 00:00:00', '1539940352');
INSERT INTO `fa_openapi` VALUES ('80', '1000001', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930079', '9123456002930079', '2019-12-31 00:00:00', '1539940392');
INSERT INTO `fa_openapi` VALUES ('81', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930080', '9123456002930080', '2019-12-31 00:00:00', '1539940400');
INSERT INTO `fa_openapi` VALUES ('82', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930081', '9123456002930081', '2019-12-31 00:00:00', '1539940405');
INSERT INTO `fa_openapi` VALUES ('83', '1000004', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930082', '9123456002930082', '2019-12-31 00:00:00', '1540090134');
INSERT INTO `fa_openapi` VALUES ('84', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930113', '9123456002930113', '2019-12-31 00:00:00', '1540280527');
INSERT INTO `fa_openapi` VALUES ('85', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930115', '9123456002930115', '2019-12-31 00:00:00', '1540280747');
INSERT INTO `fa_openapi` VALUES ('86', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930121', '9123456002930121', '2019-12-31 00:00:00', '1540369108');
INSERT INTO `fa_openapi` VALUES ('87', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930122', '9123456002930122', '2019-12-31 00:00:00', '1540369109');
INSERT INTO `fa_openapi` VALUES ('88', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930123', '9123456002930123', '2019-12-31 00:00:00', '1540369201');
INSERT INTO `fa_openapi` VALUES ('89', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930124', '9123456002930124', '2019-12-31 00:00:00', '1540369820');
INSERT INTO `fa_openapi` VALUES ('90', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930125', '9123456002930125', '2019-12-31 00:00:00', '1540371186');
INSERT INTO `fa_openapi` VALUES ('91', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930127', '9123456002930127', '2019-12-31 00:00:00', '1540371358');
INSERT INTO `fa_openapi` VALUES ('92', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930128', '9123456002930128', '2019-12-31 00:00:00', '1540371891');
INSERT INTO `fa_openapi` VALUES ('93', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930129', '9123456002930129', '2019-12-31 00:00:00', '1540372907');
INSERT INTO `fa_openapi` VALUES ('94', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930132', '9123456002930132', '2019-12-31 00:00:00', '1540375197');
INSERT INTO `fa_openapi` VALUES ('95', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930154', '9123456002930154', '2019-12-31 00:00:00', '1540778784');
INSERT INTO `fa_openapi` VALUES ('96', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930155', '9123456002930155', '2019-12-31 00:00:00', '1540778795');
INSERT INTO `fa_openapi` VALUES ('97', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930156', '9123456002930156', '2019-12-31 00:00:00', '1540778798');
INSERT INTO `fa_openapi` VALUES ('98', '1000002', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930168', '9123456002930168', '2019-12-31 00:00:00', '1540869063');
INSERT INTO `fa_openapi` VALUES ('99', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930169', '9123456002930169', '2019-12-31 00:00:00', '1540869892');
INSERT INTO `fa_openapi` VALUES ('100', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930170', '9123456002930170', '2019-12-31 00:00:00', '1540869895');
INSERT INTO `fa_openapi` VALUES ('101', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930174', '9123456002930174', '2019-12-31 00:00:00', '1540952595');
INSERT INTO `fa_openapi` VALUES ('102', '1000005', '0', '1240413', '1', '58', '0', '0', '爱奇艺黄金会员（季卡）58元卡密', '98848372102930175', '9123456002930175', '2019-12-31 00:00:00', '1540952599');
INSERT INTO `fa_openapi` VALUES ('103', '1000002', '0', '1227400', '1', '5', '0', '0', '京东E卡5元卡密', 'JDV76000008223427316', '478F-03F3-78CE-3427316', '4000-04-01 00:00:00', '1542694762');
INSERT INTO `fa_openapi` VALUES ('104', '1000002', '0', '1227400', '1', '5', '0', '0', '京东E卡5元卡密', 'JDV76000008223427488', '478F-03F3-78CE-3427488', '4000-04-01 00:00:00', '1551232693');
INSERT INTO `fa_openapi` VALUES ('105', '1000002', '0', '1227400', '1', '5', '0', '0', '京东E卡5元卡密', 'JDV76000008223427558', '478F-03F3-78CE-3427558', '4000-04-01 00:00:00', '1552632104');
INSERT INTO `fa_openapi` VALUES ('106', '1000002', '0', '1227400', '1', '5', '0', '0', '京东E卡5元卡密', 'JDV76000008223427559', '478F-03F3-78CE-3427559', '4000-04-01 00:00:00', '1552632112');
INSERT INTO `fa_openapi` VALUES ('107', '1000002', '0', '1227400', '1', '5', '0', '0', '京东E卡5元卡密', 'JDV76000008223427562', '478F-03F3-78CE-3427562', '4000-04-01 00:00:00', '1552879691');
INSERT INTO `fa_openapi` VALUES ('108', '1000002', '0', '1227400', '1', '5', '0', '0', '京东E卡5元卡密', 'JDV76000008223427563', '478F-03F3-78CE-3427563', '4000-04-01 00:00:00', '1552879696');
INSERT INTO `fa_openapi` VALUES ('109', '1000002', '0', '1227400', '1', '5', '0', '0', '京东E卡5元卡密', 'JDV76000008223427564', '478F-03F3-78CE-3427564', '4000-04-01 00:00:00', '1552879698');

-- ----------------------------
-- Table structure for fa_pdesc
-- ----------------------------
DROP TABLE IF EXISTS `fa_pdesc`;
CREATE TABLE `fa_pdesc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) NOT NULL COMMENT '商品编号',
  `images` varchar(1000) NOT NULL COMMENT '详情图',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情图';

-- ----------------------------
-- Records of fa_pdesc
-- ----------------------------

-- ----------------------------
-- Table structure for fa_product
-- ----------------------------
DROP TABLE IF EXISTS `fa_product`;
CREATE TABLE `fa_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `image` varchar(255) NOT NULL COMMENT '主图',
  `images` varchar(255) NOT NULL COMMENT '详情图',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `desc` varchar(255) NOT NULL COMMENT '商品描述',
  `price` int(11) NOT NULL COMMENT '价值',
  `carid` varchar(255) NOT NULL DEFAULT '无' COMMENT '卡号',
  `value` int(11) NOT NULL COMMENT '商品面值',
  `sum` int(255) NOT NULL COMMENT '商品总数',
  `surplus` int(11) NOT NULL COMMENT '剩余商品数',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `weigh` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品管理';

-- ----------------------------
-- Records of fa_product
-- ----------------------------
INSERT INTO `fa_product` VALUES ('7', '/uploads/20181101/d8ac12a1654a528e4b122b5a3bbc4373.png', '/uploads/20181101/f38049323f47631e60732da6a51fd565.png', '10元话费券', '10元话费券', '2100', '无', '10', '238', '240', '1541056463', '1542694914', 'normal', '16');
INSERT INTO `fa_product` VALUES ('8', '/uploads/20181101/056744484778bff1042a4c4df358b1d7.png', '/uploads/20181101/331e154edbed4bfd5a30e0327fb19b67.png', '20元话费券', '20元话费券', '4200', '无', '20', '120', '120', '1541056534', '1542694921', 'normal', '15');
INSERT INTO `fa_product` VALUES ('9', '/uploads/20181101/2688343ea79024bc33c2a1dc6f4fa7ff.png', '/uploads/20181101/047af542af52d29571f7d0cd1cbddfba.png', '30元话费券', '30元话费券', '6300', '无', '30', '80', '80', '1541056616', '1542694927', 'normal', '14');
INSERT INTO `fa_product` VALUES ('10', '/uploads/20181101/84843faa433870f65869df8405a8ea17.png', '/uploads/20181101/4fa7a5c582faa32a053cc40a70210012.png', '50元话费券', '50元话费券', '10500', '无', '50', '48', '48', '1541056716', '1542694934', 'normal', '13');
INSERT INTO `fa_product` VALUES ('11', '/uploads/20181101/5e51d2329ae20a541dad7c063b5bea30.png', '/uploads/20181101/956c2d0a101cdb0c132b924806346646.png', '100元话费券', '100元话费券', '21000', '无', '100', '21', '24', '1541056840', '1542694940', 'normal', '12');
INSERT INTO `fa_product` VALUES ('12', '/uploads/20181101/0288f4db23336e28471ed98d3efc65d6.png', '/uploads/20181101/b8181a025be82f56df9c9a3e2aab55e5.png', '5元京东卡', '5元京东卡', '1050', '1227400', '5', '3463', '3463', '1541059394', '1541656702', 'normal', '11');
INSERT INTO `fa_product` VALUES ('13', '/uploads/20181101/3f4695d0d5ca8e52a52961feecc70bf9.png', '/uploads/20181101/5e1e77bd9ce3adfb79eee7c188effc0f.png', '10元京东卡', '10元京东卡', '2100', '1227401', '10', '3612', '3612', '1541059445', '1541656728', 'normal', '10');
INSERT INTO `fa_product` VALUES ('14', '/uploads/20181101/7ea70aee71527816e35129bf11833000.png', '/uploads/20181101/dd217eaff2fa2ea71d8734366d8cf77f.png', '100元京东卡', '100元京东卡', '21000', '1227402', '100', '4103', '4103', '1541059502', '1541656743', 'normal', '9');
INSERT INTO `fa_product` VALUES ('15', '/uploads/20181101/57eeee9e71c147f533660afbb7991da1.png', '/uploads/20181101/ec9b1a2552fa6d7b04acabb03e2563f5.png', '200元京东卡', '200元京东卡', '42000', '1227403', '200', '4523', '4523', '1541059559', '1541656755', 'normal', '8');
INSERT INTO `fa_product` VALUES ('16', '/uploads/20181101/47679778258ddd883b8228fce564e526.png', '/uploads/20181101/c411c95b91866f32ee4930fa2cea2360.png', '20元来伊份代金券', '20元来伊份代金券', '4200', '1245003', '20', '4928', '4928', '1541059652', '1541656793', 'normal', '7');
INSERT INTO `fa_product` VALUES ('17', '/uploads/20181101/c1ce50686b6f428fd2ffce432cb46f1c.png', '/uploads/20181101/c14523cbff10c9577588a22ef46d6137.png', '50元来伊份代金券', '50元来伊份代金券', '10500', '1245002', '50', '4997', '4997', '1541059729', '1541656808', 'hidden', '6');
INSERT INTO `fa_product` VALUES ('18', '/uploads/20181101/2e00f910f9bd1afe0fd4d71a1a7d5bac.png', '/uploads/20181101/c04aa8c16d9cf05b838111f6f660c1a4.png', '10元滴滴出行代金券', '10元滴滴出行代金券', '2100', '1500108', '10', '0', '0', '1541059815', '1541656838', 'normal', '5');
INSERT INTO `fa_product` VALUES ('19', '/uploads/20181101/b17b1ec6f0e7366ec09978f544436e3e.png', '/uploads/20181101/2937b0bc79ef72c8ce409f3441b3be12.png', '20元滴滴出行代金券', '20元滴滴出行代金券', '4200', '1500103', '20', '0', '0', '1541059861', '1541656853', 'hidden', '4');
INSERT INTO `fa_product` VALUES ('20', '/uploads/20181101/1fd3bad5dd3e7bcc0c1fe92a8f0d8d8b.png', '/uploads/20181101/9409ceb9c1ce00bdd6e78bffdb38b404.png', '30元滴滴出行代金券', '30元滴滴出行代金券', '6300', '1500125', '30', '0', '0', '1541059902', '1541656898', 'normal', '3');
INSERT INTO `fa_product` VALUES ('21', '/uploads/20181101/6475ad2f774c812ed38f111219dcf84e.png', '/uploads/20181101/9298340289145d57c0925d3df68e262c.png', '10元百果园购物卡', '10元百果园购物卡', '2100', '1506302', '10', '4989', '4989', '1541059974', '1541656949', 'normal', '2');
INSERT INTO `fa_product` VALUES ('22', '/uploads/20181101/284a3deac94aebcd3b76abfcd0159fe2.png', '/uploads/20181101/971ff6a521f836232a50a3bec22642b2.png', '30元百果园购物卡', '30元百果园购物卡', '6300', '1506303', '30', '4999', '4999', '1541060012', '1541656969', 'hidden', '1');
INSERT INTO `fa_product` VALUES ('24', '/uploads/20181101/f6eaeebdfb0e293e4709e7fe74f96c62.png', '/uploads/20181101/fd62898c6577a54448f2e86ce3806ed7.png', '积分兑彩', '积分兑彩', '600', '无', '-1', '1200', '1200', '1541060147', '1542709202', 'normal', '17');

-- ----------------------------
-- Table structure for fa_product12
-- ----------------------------
DROP TABLE IF EXISTS `fa_product12`;
CREATE TABLE `fa_product12` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `image` varchar(255) NOT NULL COMMENT '主图',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `weigh` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='商品管理';

-- ----------------------------
-- Records of fa_product12
-- ----------------------------
INSERT INTO `fa_product12` VALUES ('7', '/uploads/20190304/616c847d250e1235a2c4e33c3254b2ed.png', '卡券兑换', 'https://h5.18178.net/#/exchange', '1541056463', '1553046138', 'normal', '16');
INSERT INTO `fa_product12` VALUES ('8', '/uploads/20190304/abe04a238e6ebf66c0150e94a5f86aee.png', '日常家居', 'https://h5.18178.net/#/exchange', '1541056534', '1552974541', 'hidden', '15');
INSERT INTO `fa_product12` VALUES ('9', '/uploads/20190304/cfe4dbdf6653854bf8fd311f241730e7.png', '家用电器', 'https://h5.18178.net/#/exchange', '1541056616', '1552974547', 'hidden', '14');
INSERT INTO `fa_product12` VALUES ('10', '/uploads/20190304/56d2a6cd414035d14884769b69fffb51.png', '车辆服务', 'https://h5.18178.net/#/exchange', '1541056716', '1552974555', 'hidden', '13');
INSERT INTO `fa_product12` VALUES ('11', '/uploads/20190304/ea47ed6b5c0f1da47c40901a43435233.png', '农副产品', 'https://h5.18178.net/#/exchange', '1541056840', '1552974560', 'hidden', '12');
INSERT INTO `fa_product12` VALUES ('12', '/uploads/20190304/23745e2ff2fc6ff7544ffc99aba20aae.png', '数码兑换', 'https://h5.18178.net/#/exchange', '1541059394', '1552974565', 'hidden', '11');
INSERT INTO `fa_product12` VALUES ('24', '/uploads/20190304/a50d8c1732289e3da1f64cc5ad12e205.png', '彩票兑换', 'https://h5.18178.net/#/lottery', '1541060147', '1552645283', 'hidden', '17');
INSERT INTO `fa_product12` VALUES ('26', '/uploads/20190319/c79433ff2ea56a01ac0a38bce2cab590.png', '平台道具', 'https://h5.18178.net/#/exchange', '1552974653', '1552987833', 'normal', '18');

-- ----------------------------
-- Table structure for fa_record
-- ----------------------------
DROP TABLE IF EXISTS `fa_record`;
CREATE TABLE `fa_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `pid` int(11) NOT NULL COMMENT '奖项ID',
  `value` int(11) NOT NULL COMMENT '物品价值',
  `createtime` int(11) NOT NULL COMMENT '抽取时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_record
-- ----------------------------
INSERT INTO `fa_record` VALUES ('1', '1000005', '5', '10', '1540344610', 'normal');
INSERT INTO `fa_record` VALUES ('2', '1000005', '8', '400', '1540344662', 'normal');
INSERT INTO `fa_record` VALUES ('3', '1000005', '4', '5', '1540344750', 'normal');
INSERT INTO `fa_record` VALUES ('4', '1000005', '4', '5', '1540351431', 'normal');
INSERT INTO `fa_record` VALUES ('5', '1000004', '5', '10', '1540360168', 'normal');
INSERT INTO `fa_record` VALUES ('6', '1000002', '4', '5', '1540444900', 'normal');
INSERT INTO `fa_record` VALUES ('7', '1000002', '5', '10', '1540454881', 'normal');
INSERT INTO `fa_record` VALUES ('8', '1000004', '4', '5', '1540460906', 'normal');
INSERT INTO `fa_record` VALUES ('9', '1000005', '4', '5', '1540518117', 'normal');
INSERT INTO `fa_record` VALUES ('10', '1000004', '4', '5', '1540522444', 'normal');
INSERT INTO `fa_record` VALUES ('11', '1000004', '2', '-1', '1540522455', 'normal');
INSERT INTO `fa_record` VALUES ('12', '1000006', '5', '10', '1540794646', 'normal');
INSERT INTO `fa_record` VALUES ('13', '1000006', '4', '5', '1540881158', 'normal');
INSERT INTO `fa_record` VALUES ('14', '1000006', '5', '10', '1540881159', 'normal');
INSERT INTO `fa_record` VALUES ('15', '1000006', '4', '5', '1540881171', 'normal');
INSERT INTO `fa_record` VALUES ('16', '1000006', '4', '5', '1540881173', 'normal');
INSERT INTO `fa_record` VALUES ('17', '1000004', '5', '10', '1540894991', 'normal');
INSERT INTO `fa_record` VALUES ('18', '1000005', '5', '10', '1540951436', 'normal');
INSERT INTO `fa_record` VALUES ('19', '1000005', '4', '5', '1540951543', 'normal');
INSERT INTO `fa_record` VALUES ('20', '1000002', '4', '5', '1540952721', 'normal');
INSERT INTO `fa_record` VALUES ('21', '1000006', '5', '10', '1540966876', 'normal');
INSERT INTO `fa_record` VALUES ('22', '1000006', '6', '50', '1540966888', 'normal');
INSERT INTO `fa_record` VALUES ('23', '1000006', '4', '5', '1540966900', 'normal');
INSERT INTO `fa_record` VALUES ('24', '1000006', '2', '-1', '1540966900', 'normal');
INSERT INTO `fa_record` VALUES ('25', '1000006', '5', '10', '1540966910', 'normal');
INSERT INTO `fa_record` VALUES ('26', '1000005', '5', '10', '1541057256', 'normal');
INSERT INTO `fa_record` VALUES ('27', '1000005', '2', '-1', '1541057739', 'normal');
INSERT INTO `fa_record` VALUES ('28', '1000005', '5', '10', '1541057747', 'normal');
INSERT INTO `fa_record` VALUES ('29', '1000005', '6', '50', '1541057762', 'normal');
INSERT INTO `fa_record` VALUES ('30', '1000005', '5', '10', '1541057771', 'normal');
INSERT INTO `fa_record` VALUES ('31', '1000005', '4', '5', '1541057779', 'normal');
INSERT INTO `fa_record` VALUES ('32', '1000005', '5', '10', '1541057789', 'normal');
INSERT INTO `fa_record` VALUES ('33', '1000002', '4', '5', '1541065010', 'normal');
INSERT INTO `fa_record` VALUES ('34', '1000002', '5', '10', '1541065021', 'normal');
INSERT INTO `fa_record` VALUES ('35', '1000004', '5', '10', '1541070472', 'normal');
INSERT INTO `fa_record` VALUES ('36', '1000004', '4', '5', '1541070481', 'normal');
INSERT INTO `fa_record` VALUES ('37', '1000004', '5', '10', '1541070482', 'normal');
INSERT INTO `fa_record` VALUES ('38', '1000004', '4', '5', '1541070489', 'normal');
INSERT INTO `fa_record` VALUES ('39', '1000004', '5', '10', '1541070490', 'normal');
INSERT INTO `fa_record` VALUES ('40', '1000004', '5', '10', '1541070496', 'normal');
INSERT INTO `fa_record` VALUES ('41', '1000004', '2', '-1', '1541070496', 'normal');
INSERT INTO `fa_record` VALUES ('42', '1000004', '4', '5', '1541070503', 'normal');
INSERT INTO `fa_record` VALUES ('43', '1000004', '5', '10', '1541070503', 'normal');
INSERT INTO `fa_record` VALUES ('44', '1000004', '8', '400', '1541127176', 'normal');
INSERT INTO `fa_record` VALUES ('45', '1000004', '4', '5', '1541127177', 'normal');
INSERT INTO `fa_record` VALUES ('46', '1000005', '4', '5', '1541152666', 'normal');
INSERT INTO `fa_record` VALUES ('47', '1000005', '4', '5', '1541152680', 'normal');
INSERT INTO `fa_record` VALUES ('48', '1000005', '5', '10', '1541152688', 'normal');
INSERT INTO `fa_record` VALUES ('49', '1000005', '5', '10', '1541152702', 'normal');
INSERT INTO `fa_record` VALUES ('50', '1000005', '4', '5', '1541152711', 'normal');
INSERT INTO `fa_record` VALUES ('51', '1000002', '2', '-1', '1541336836', 'normal');
INSERT INTO `fa_record` VALUES ('52', '1000002', '6', '50', '1541336844', 'normal');
INSERT INTO `fa_record` VALUES ('53', '1000002', '5', '10', '1541336852', 'normal');
INSERT INTO `fa_record` VALUES ('54', '1000002', '4', '5', '1541336865', 'normal');
INSERT INTO `fa_record` VALUES ('55', '1000005', '2', '-1', '1541383351', 'normal');
INSERT INTO `fa_record` VALUES ('56', '1000005', '6', '50', '1541383359', 'normal');
INSERT INTO `fa_record` VALUES ('57', '1000004', '5', '10', '1541471951', 'normal');
INSERT INTO `fa_record` VALUES ('58', '1000006', '4', '5', '1541655577', 'normal');
INSERT INTO `fa_record` VALUES ('59', '1000006', '4', '5', '1541655595', 'normal');
INSERT INTO `fa_record` VALUES ('60', '1000006', '2', '-1', '1541655609', 'normal');
INSERT INTO `fa_record` VALUES ('61', '1000005', '4', '5', '1541727142', 'normal');
INSERT INTO `fa_record` VALUES ('62', '1000002', '5', '10', '1541732254', 'normal');
INSERT INTO `fa_record` VALUES ('63', '1000004', '6', '50', '1541753213', 'normal');
INSERT INTO `fa_record` VALUES ('64', '1000004', '4', '5', '1541753214', 'normal');
INSERT INTO `fa_record` VALUES ('65', '1000004', '4', '5', '1541753214', 'normal');
INSERT INTO `fa_record` VALUES ('66', '1000004', '2', '-1', '1541753214', 'normal');
INSERT INTO `fa_record` VALUES ('67', '1000004', '2', '-1', '1541753215', 'normal');
INSERT INTO `fa_record` VALUES ('68', '1000004', '4', '5', '1541753215', 'normal');
INSERT INTO `fa_record` VALUES ('69', '1000004', '4', '5', '1541753215', 'normal');
INSERT INTO `fa_record` VALUES ('70', '1000004', '5', '10', '1541753236', 'normal');
INSERT INTO `fa_record` VALUES ('71', '1000004', '5', '10', '1541753236', 'normal');
INSERT INTO `fa_record` VALUES ('72', '1000005', '2', '-1', '1541753332', 'normal');
INSERT INTO `fa_record` VALUES ('73', '1000005', '5', '10', '1541753333', 'normal');
INSERT INTO `fa_record` VALUES ('74', '1000005', '4', '5', '1541753341', 'normal');
INSERT INTO `fa_record` VALUES ('75', '1000005', '6', '50', '1541753341', 'normal');
INSERT INTO `fa_record` VALUES ('76', '1000005', '5', '10', '1541753837', 'normal');
INSERT INTO `fa_record` VALUES ('77', '1000005', '4', '5', '1541753838', 'normal');
INSERT INTO `fa_record` VALUES ('78', '1000005', '4', '5', '1541753845', 'normal');
INSERT INTO `fa_record` VALUES ('79', '1000005', '5', '10', '1541753845', 'normal');
INSERT INTO `fa_record` VALUES ('80', '1000002', '6', '50', '1541754421', 'normal');
INSERT INTO `fa_record` VALUES ('81', '1000002', '6', '50', '1541754429', 'normal');
INSERT INTO `fa_record` VALUES ('82', '1000002', '6', '50', '1541754443', 'normal');
INSERT INTO `fa_record` VALUES ('83', '1000005', '4', '5', '1542088802', 'normal');
INSERT INTO `fa_record` VALUES ('84', '1000005', '4', '5', '1542088803', 'normal');
INSERT INTO `fa_record` VALUES ('85', '1000005', '4', '5', '1542088803', 'normal');
INSERT INTO `fa_record` VALUES ('86', '1000005', '4', '5', '1542088804', 'normal');
INSERT INTO `fa_record` VALUES ('87', '1000005', '4', '5', '1542088804', 'normal');
INSERT INTO `fa_record` VALUES ('88', '1000005', '2', '-1', '1542088804', 'normal');
INSERT INTO `fa_record` VALUES ('89', '1000005', '5', '10', '1542088804', 'normal');
INSERT INTO `fa_record` VALUES ('90', '1000005', '4', '5', '1542088805', 'normal');
INSERT INTO `fa_record` VALUES ('91', '1000005', '5', '10', '1542088805', 'normal');
INSERT INTO `fa_record` VALUES ('92', '1000005', '5', '10', '1542245504', 'normal');
INSERT INTO `fa_record` VALUES ('93', '1000004', '4', '5', '1542269329', 'normal');
INSERT INTO `fa_record` VALUES ('94', '1000006', '4', '5', '1542274033', 'normal');
INSERT INTO `fa_record` VALUES ('95', '1000004', '5', '10', '1542274086', 'normal');
INSERT INTO `fa_record` VALUES ('96', '1000004', '6', '50', '1542274087', 'normal');
INSERT INTO `fa_record` VALUES ('97', '1000008', '4', '5', '1542358200', 'normal');
INSERT INTO `fa_record` VALUES ('98', '1000005', '4', '5', '1542702954', 'normal');
INSERT INTO `fa_record` VALUES ('99', '1000002', '5', '10', '1542704085', 'normal');
INSERT INTO `fa_record` VALUES ('100', '1000002', '4', '5', '1542704089', 'normal');
INSERT INTO `fa_record` VALUES ('101', '1000002', '4', '5', '1542704097', 'normal');
INSERT INTO `fa_record` VALUES ('102', '1000004', '2', '-1', '1543488737', 'normal');
INSERT INTO `fa_record` VALUES ('103', '1000004', '5', '10', '1543488744', 'normal');
INSERT INTO `fa_record` VALUES ('104', '1000004', '5', '10', '1543488751', 'normal');
INSERT INTO `fa_record` VALUES ('105', '1000015', '4', '5', '1543539833', 'normal');
INSERT INTO `fa_record` VALUES ('106', '1000015', '4', '5', '1543539840', 'normal');
INSERT INTO `fa_record` VALUES ('107', '1000015', '4', '5', '1543539848', 'normal');
INSERT INTO `fa_record` VALUES ('108', '1000005', '5', '10', '1543563669', 'normal');
INSERT INTO `fa_record` VALUES ('109', '1000015', '4', '5', '1544435072', 'normal');
INSERT INTO `fa_record` VALUES ('110', '1000015', '4', '5', '1544435081', 'normal');
INSERT INTO `fa_record` VALUES ('111', '1000015', '5', '10', '1544435093', 'normal');
INSERT INTO `fa_record` VALUES ('112', '1000015', '4', '5', '1544494500', 'normal');
INSERT INTO `fa_record` VALUES ('113', '1000004', '5', '10', '1545965753', 'normal');
INSERT INTO `fa_record` VALUES ('114', '1000013', '2', '-1', '1548034826', 'normal');
INSERT INTO `fa_record` VALUES ('115', '1000013', '2', '-1', '1548034834', 'normal');
INSERT INTO `fa_record` VALUES ('116', '1000013', '4', '5', '1548034843', 'normal');
INSERT INTO `fa_record` VALUES ('117', '1000004', '2', '-1', '1548065723', 'normal');
INSERT INTO `fa_record` VALUES ('118', '1000004', '2', '-1', '1548065732', 'normal');
INSERT INTO `fa_record` VALUES ('119', '1000004', '4', '5', '1548065739', 'normal');
INSERT INTO `fa_record` VALUES ('120', '1000004', '2', '-1', '1548122394', 'normal');
INSERT INTO `fa_record` VALUES ('121', '1000004', '2', '-1', '1548122402', 'normal');
INSERT INTO `fa_record` VALUES ('122', '1000004', '2', '-1', '1548122409', 'normal');
INSERT INTO `fa_record` VALUES ('123', '1000004', '2', '-1', '1550214251', 'normal');
INSERT INTO `fa_record` VALUES ('124', '1000004', '4', '5', '1550214262', 'normal');
INSERT INTO `fa_record` VALUES ('125', '1000005', '2', '-1', '1550478861', 'normal');
INSERT INTO `fa_record` VALUES ('126', '1000002', '2', '-1', '1550478870', 'normal');
INSERT INTO `fa_record` VALUES ('127', '1000005', '4', '5', '1550478872', 'normal');
INSERT INTO `fa_record` VALUES ('128', '1000002', '4', '5', '1550478879', 'normal');
INSERT INTO `fa_record` VALUES ('129', '1000005', '2', '-1', '1550478879', 'normal');
INSERT INTO `fa_record` VALUES ('130', '1000004', '2', '-1', '1551073195', 'normal');
INSERT INTO `fa_record` VALUES ('131', '1000004', '2', '-1', '1551073203', 'normal');
INSERT INTO `fa_record` VALUES ('132', '1000004', '2', '-1', '1551073211', 'normal');
INSERT INTO `fa_record` VALUES ('133', '1000014', '2', '-1', '1551176799', 'normal');
INSERT INTO `fa_record` VALUES ('134', '1000014', '2', '-1', '1551176806', 'normal');
INSERT INTO `fa_record` VALUES ('135', '1000014', '4', '5', '1551176813', 'normal');
INSERT INTO `fa_record` VALUES ('136', '1000002', '4', '5', '1551232666', 'normal');
INSERT INTO `fa_record` VALUES ('137', '1000002', '4', '5', '1551232674', 'normal');
INSERT INTO `fa_record` VALUES ('138', '1000002', '2', '-1', '1551232682', 'normal');
INSERT INTO `fa_record` VALUES ('139', '1000005', '2', '-1', '1551236772', 'normal');
INSERT INTO `fa_record` VALUES ('140', '1000005', '2', '-1', '1551236783', 'normal');
INSERT INTO `fa_record` VALUES ('141', '1000005', '4', '5', '1551236790', 'normal');
INSERT INTO `fa_record` VALUES ('142', '1000005', '4', '5', '1551669286', 'normal');
INSERT INTO `fa_record` VALUES ('143', '1000005', '4', '5', '1551669303', 'normal');
INSERT INTO `fa_record` VALUES ('144', '1000005', '2', '-1', '1551772758', 'normal');
INSERT INTO `fa_record` VALUES ('145', '1000002', '4', '5', '1551774216', 'normal');
INSERT INTO `fa_record` VALUES ('146', '1000002', '2', '-1', '1551774225', 'normal');
INSERT INTO `fa_record` VALUES ('147', '1000002', '2', '-1', '1551774232', 'normal');
INSERT INTO `fa_record` VALUES ('148', '1000005', '2', '-1', '1551775055', 'normal');
INSERT INTO `fa_record` VALUES ('149', '1000005', '4', '5', '1552012563', 'normal');
INSERT INTO `fa_record` VALUES ('150', '1000016', '4', '5', '1552354302', 'normal');
INSERT INTO `fa_record` VALUES ('151', '1000016', '2', '-1', '1552354312', 'normal');
INSERT INTO `fa_record` VALUES ('152', '1000016', '4', '5', '1552354319', 'normal');
INSERT INTO `fa_record` VALUES ('153', '1000004', '2', '-1', '1552386136', 'normal');
INSERT INTO `fa_record` VALUES ('154', '1000004', '2', '-1', '1552386137', 'normal');
INSERT INTO `fa_record` VALUES ('155', '1000004', '4', '5', '1552386137', 'normal');
INSERT INTO `fa_record` VALUES ('156', '1000016', '4', '5', '1552446283', 'normal');
INSERT INTO `fa_record` VALUES ('157', '1000016', '4', '5', '1552446290', 'normal');
INSERT INTO `fa_record` VALUES ('158', '1000016', '2', '-1', '1552446298', 'normal');
INSERT INTO `fa_record` VALUES ('159', '1000017', '4', '5', '1552461283', 'normal');
INSERT INTO `fa_record` VALUES ('160', '1000020', '2', '-1', '1552462126', 'normal');
INSERT INTO `fa_record` VALUES ('161', '1000017', '4', '5', '1552463213', 'normal');
INSERT INTO `fa_record` VALUES ('162', '1000017', '2', '-1', '1552463230', 'normal');
INSERT INTO `fa_record` VALUES ('163', '1000017', '2', '-1', '1552526759', 'normal');
INSERT INTO `fa_record` VALUES ('164', '1000017', '2', '-1', '1552526770', 'normal');
INSERT INTO `fa_record` VALUES ('165', '1000017', '2', '-1', '1552526777', 'normal');
INSERT INTO `fa_record` VALUES ('166', '1000005', '4', '5', '1552542532', 'normal');
INSERT INTO `fa_record` VALUES ('167', '1000004', '2', '-1', '1552545890', 'normal');
INSERT INTO `fa_record` VALUES ('168', '1000004', '4', '5', '1552550335', 'normal');
INSERT INTO `fa_record` VALUES ('169', '1000004', '2', '-1', '1552550336', 'normal');
INSERT INTO `fa_record` VALUES ('170', '1000016', '2', '-1', '1552550355', 'normal');
INSERT INTO `fa_record` VALUES ('171', '1000016', '4', '5', '1552550362', 'normal');
INSERT INTO `fa_record` VALUES ('172', '1000016', '2', '-1', '1552550369', 'normal');
INSERT INTO `fa_record` VALUES ('173', '1000001', '7', '-1', '1552617007', 'normal');
INSERT INTO `fa_record` VALUES ('174', '1000001', '7', '-1', '1552617017', 'normal');
INSERT INTO `fa_record` VALUES ('175', '1000001', '8', '5', '1552617024', 'normal');
INSERT INTO `fa_record` VALUES ('176', '1000003', '8', '5', '1552617381', 'normal');
INSERT INTO `fa_record` VALUES ('177', '1000003', '7', '-1', '1552617388', 'normal');
INSERT INTO `fa_record` VALUES ('178', '1000003', '8', '5', '1552617394', 'normal');
INSERT INTO `fa_record` VALUES ('179', '1000002', '8', '5', '1552620436', 'normal');
INSERT INTO `fa_record` VALUES ('180', '1000002', '7', '-1', '1552620446', 'normal');
INSERT INTO `fa_record` VALUES ('181', '1000002', '7', '-1', '1552620454', 'normal');
INSERT INTO `fa_record` VALUES ('182', '1000002', '7', '2', '1552877845', 'normal');
INSERT INTO `fa_record` VALUES ('183', '1000011', '6', '10', '1552902518', 'normal');
INSERT INTO `fa_record` VALUES ('184', '1000004', '8', '5', '1552902639', 'normal');
INSERT INTO `fa_record` VALUES ('185', '1000002', '7', '2', '1552959458', 'normal');
INSERT INTO `fa_record` VALUES ('186', '1000010', '7', '2', '1552976397', 'normal');
INSERT INTO `fa_record` VALUES ('187', '1000004', '8', '5', '1552977228', 'normal');
INSERT INTO `fa_record` VALUES ('188', '1000011', '7', '2', '1552982554', 'normal');
INSERT INTO `fa_record` VALUES ('189', '1000015', '8', '5', '1552989993', 'normal');
INSERT INTO `fa_record` VALUES ('190', '1000015', '8', '5', '1553045688', 'normal');
INSERT INTO `fa_record` VALUES ('191', '1000003', '7', '2', '1553059716', 'normal');
INSERT INTO `fa_record` VALUES ('192', '1000004', '7', '2', '1553059831', 'normal');
INSERT INTO `fa_record` VALUES ('193', '1000003', '8', '5', '1553137250', 'normal');
INSERT INTO `fa_record` VALUES ('194', '1000015', '8', '5', '1553148683', 'normal');
INSERT INTO `fa_record` VALUES ('195', '1000015', '8', '5', '1553217927', 'normal');
INSERT INTO `fa_record` VALUES ('196', '1000004', '7', '2', '1553233362', 'normal');
INSERT INTO `fa_record` VALUES ('197', '1000003', '8', '5', '1553233555', 'normal');
INSERT INTO `fa_record` VALUES ('198', '1000024', '4', '5', '1553235909', 'normal');
INSERT INTO `fa_record` VALUES ('199', '1000024', '2', '2', '1553236039', 'normal');
INSERT INTO `fa_record` VALUES ('200', '1000004', '4', '5', '1553236043', 'normal');
INSERT INTO `fa_record` VALUES ('201', '1000024', '2', '2', '1553236055', 'normal');
INSERT INTO `fa_record` VALUES ('202', '1000004', '2', '2', '1553236059', 'normal');
INSERT INTO `fa_record` VALUES ('203', '1000024', '2', '2', '1553236062', 'normal');
INSERT INTO `fa_record` VALUES ('204', '1000004', '2', '2', '1553236068', 'normal');
INSERT INTO `fa_record` VALUES ('205', '1000024', '1', '0', '1553236069', 'normal');
INSERT INTO `fa_record` VALUES ('206', '1000024', '1', '0', '1553236076', 'normal');
INSERT INTO `fa_record` VALUES ('207', '1000024', '2', '2', '1553236086', 'normal');
INSERT INTO `fa_record` VALUES ('208', '1000004', '2', '2', '1553236091', 'normal');
INSERT INTO `fa_record` VALUES ('209', '1000024', '2', '2', '1553236094', 'normal');
INSERT INTO `fa_record` VALUES ('210', '1000004', '2', '2', '1553236098', 'normal');
INSERT INTO `fa_record` VALUES ('211', '1000024', '1', '0', '1553236102', 'normal');
INSERT INTO `fa_record` VALUES ('212', '1000004', '4', '5', '1553236105', 'normal');
INSERT INTO `fa_record` VALUES ('213', '1000024', '4', '5', '1553236109', 'normal');
INSERT INTO `fa_record` VALUES ('214', '1000004', '2', '2', '1553236113', 'normal');
INSERT INTO `fa_record` VALUES ('215', '1000004', '4', '5', '1553236121', 'normal');
INSERT INTO `fa_record` VALUES ('216', '1000004', '2', '2', '1553236128', 'normal');
INSERT INTO `fa_record` VALUES ('217', '1000010', '2', '2', '1553236201', 'normal');
INSERT INTO `fa_record` VALUES ('218', '1000010', '4', '5', '1553236209', 'normal');
INSERT INTO `fa_record` VALUES ('219', '1000010', '2', '2', '1553236217', 'normal');
INSERT INTO `fa_record` VALUES ('220', '1000010', '2', '2', '1553236224', 'normal');
INSERT INTO `fa_record` VALUES ('221', '1000010', '1', '0', '1553236231', 'normal');
INSERT INTO `fa_record` VALUES ('222', '1000010', '2', '2', '1553236238', 'normal');
INSERT INTO `fa_record` VALUES ('223', '1000010', '2', '2', '1553236245', 'normal');
INSERT INTO `fa_record` VALUES ('224', '1000010', '8', '10', '1553236252', 'normal');
INSERT INTO `fa_record` VALUES ('225', '1000010', '4', '5', '1553236260', 'normal');
INSERT INTO `fa_record` VALUES ('226', '1000010', '4', '5', '1553236267', 'normal');
INSERT INTO `fa_record` VALUES ('227', '1000003', '2', '2', '1553236272', 'normal');
INSERT INTO `fa_record` VALUES ('228', '1000003', '2', '2', '1553236279', 'normal');
INSERT INTO `fa_record` VALUES ('229', '1000003', '2', '2', '1553236285', 'normal');
INSERT INTO `fa_record` VALUES ('230', '1000003', '2', '2', '1553236295', 'normal');
INSERT INTO `fa_record` VALUES ('231', '1000003', '2', '2', '1553236309', 'normal');
INSERT INTO `fa_record` VALUES ('232', '1000003', '4', '5', '1553236316', 'normal');
INSERT INTO `fa_record` VALUES ('233', '1000003', '4', '5', '1553236323', 'normal');
INSERT INTO `fa_record` VALUES ('234', '1000003', '2', '2', '1553236331', 'normal');
INSERT INTO `fa_record` VALUES ('235', '1000003', '4', '5', '1553236338', 'normal');

-- ----------------------------
-- Table structure for fa_score
-- ----------------------------
DROP TABLE IF EXISTS `fa_score`;
CREATE TABLE `fa_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `type` varchar(255) NOT NULL COMMENT '变动类型',
  `score1` int(11) NOT NULL COMMENT '变动前活跃值',
  `score2` int(11) NOT NULL COMMENT '变动后活跃值',
  `num` int(11) NOT NULL COMMENT '变动数',
  `createtime` int(11) NOT NULL COMMENT '变动时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='活跃值变动';

-- ----------------------------
-- Records of fa_score
-- ----------------------------
INSERT INTO `fa_score` VALUES ('1', '李新宝', '订单退还', '9295525', '9297625', '2100', '1541731317');
INSERT INTO `fa_score` VALUES ('2', '李新宝', '大转盘', '9297625', '9297635', '10', '1541732254');
INSERT INTO `fa_score` VALUES ('3', '胡公靖', '大转盘', '792111', '792161', '50', '1541753213');
INSERT INTO `fa_score` VALUES ('4', '胡公靖', '大转盘', '792161', '792166', '5', '1541753214');
INSERT INTO `fa_score` VALUES ('5', '胡公靖', '大转盘', '792166', '792171', '5', '1541753214');
INSERT INTO `fa_score` VALUES ('6', '胡公靖', '大转盘', '792171', '792176', '5', '1541753215');
INSERT INTO `fa_score` VALUES ('7', '胡公靖', '大转盘', '792176', '792181', '5', '1541753215');
INSERT INTO `fa_score` VALUES ('8', '胡公靖', '大转盘', '792181', '792191', '10', '1541753236');
INSERT INTO `fa_score` VALUES ('9', '胡公靖', '大转盘', '792191', '792201', '10', '1541753236');
INSERT INTO `fa_score` VALUES ('10', '陈锋', '大转盘', '27249010', '27249020', '10', '1541753333');
INSERT INTO `fa_score` VALUES ('11', '陈锋', '大转盘', '27249020', '27249025', '5', '1541753341');
INSERT INTO `fa_score` VALUES ('12', '陈锋', '大转盘', '27249025', '27249075', '50', '1541753341');
INSERT INTO `fa_score` VALUES ('13', '陈锋', '大转盘', '27249075', '27249085', '10', '1541753838');
INSERT INTO `fa_score` VALUES ('14', '陈锋', '大转盘', '27249085', '27249090', '5', '1541753838');
INSERT INTO `fa_score` VALUES ('15', '陈锋', '大转盘', '27249090', '27249095', '5', '1541753845');
INSERT INTO `fa_score` VALUES ('16', '陈锋', '大转盘', '27249095', '27249105', '10', '1541753845');
INSERT INTO `fa_score` VALUES ('17', '李新宝', '大转盘', '9297635', '9297685', '50', '1541754421');
INSERT INTO `fa_score` VALUES ('18', '李新宝', '大转盘', '9297685', '9297735', '50', '1541754429');
INSERT INTO `fa_score` VALUES ('19', '李新宝', '大转盘', '9297735', '9297785', '50', '1541754443');
INSERT INTO `fa_score` VALUES ('20', '陈锋', '大转盘', '27249105', '27249110', '5', '1542088802');
INSERT INTO `fa_score` VALUES ('21', '陈锋', '大转盘', '27249110', '27249115', '5', '1542088803');
INSERT INTO `fa_score` VALUES ('22', '陈锋', '大转盘', '27249115', '27249120', '5', '1542088803');
INSERT INTO `fa_score` VALUES ('23', '陈锋', '大转盘', '27249120', '27249125', '5', '1542088804');
INSERT INTO `fa_score` VALUES ('24', '陈锋', '大转盘', '27249125', '27249130', '5', '1542088804');
INSERT INTO `fa_score` VALUES ('25', '陈锋', '大转盘', '27249130', '27249140', '10', '1542088804');
INSERT INTO `fa_score` VALUES ('26', '陈锋', '大转盘', '27249140', '27249145', '5', '1542088805');
INSERT INTO `fa_score` VALUES ('27', '陈锋', '大转盘', '27249145', '27249155', '10', '1542088805');
INSERT INTO `fa_score` VALUES ('28', '陈锋', '大转盘', '27249155', '27249165', '10', '1542245505');
INSERT INTO `fa_score` VALUES ('29', '胡公靖', '大转盘', '792201', '792206', '5', '1542269329');
INSERT INTO `fa_score` VALUES ('30', '周万里', '大转盘', '95510', '95515', '5', '1542274034');
INSERT INTO `fa_score` VALUES ('31', '胡公靖', '大转盘', '792206', '792216', '10', '1542274086');
INSERT INTO `fa_score` VALUES ('32', '胡公靖', '大转盘', '792216', '792266', '50', '1542274087');
INSERT INTO `fa_score` VALUES ('33', '', '大转盘', '0', '5', '5', '1542358200');
INSERT INTO `fa_score` VALUES ('34', '胡公靖', '新手礼包', '0', '1000', '1000', '1542526467');
INSERT INTO `fa_score` VALUES ('35', '陈锋', '礼品兑换', '27247065', '27244965', '2100', '1542695994');
INSERT INTO `fa_score` VALUES ('36', '庄智东', '新手礼包', '0', '1000', '1000', '1542700767');
INSERT INTO `fa_score` VALUES ('37', '陈锋', '大转盘', '27244965', '27244970', '5', '1542702954');
INSERT INTO `fa_score` VALUES ('38', '李新宝', '大转盘', '9295685', '9295695', '10', '1542704086');
INSERT INTO `fa_score` VALUES ('39', '李新宝', '大转盘', '9295695', '9295700', '5', '1542704089');
INSERT INTO `fa_score` VALUES ('40', '李新宝', '大转盘', '9295700', '9295705', '5', '1542704097');
INSERT INTO `fa_score` VALUES ('41', '黄蔚', '新手礼包', '0', '1000', '1000', '1542861047');
INSERT INTO `fa_score` VALUES ('42', '黄蔚', '新手礼包', '0', '1000', '1000', '1542861050');
INSERT INTO `fa_score` VALUES ('43', '周万里', '新手礼包', '0', '1000', '1000', '1543299795');
INSERT INTO `fa_score` VALUES ('44', '胡公靖', '大转盘', '787150', '787160', '10', '1543488744');
INSERT INTO `fa_score` VALUES ('45', '胡公靖', '大转盘', '787160', '787170', '10', '1543488751');
INSERT INTO `fa_score` VALUES ('46', '李捷', '新手礼包', '0', '1000', '1000', '1543539798');
INSERT INTO `fa_score` VALUES ('47', '金雷', '新手礼包', '0', '1000', '1000', '1543539813');
INSERT INTO `fa_score` VALUES ('48', '金雷', '大转盘', '1000', '1005', '5', '1543539833');
INSERT INTO `fa_score` VALUES ('49', '金雷', '大转盘', '1005', '1010', '5', '1543539840');
INSERT INTO `fa_score` VALUES ('50', '金雷', '大转盘', '1010', '1015', '5', '1543539849');
INSERT INTO `fa_score` VALUES ('51', '陈锋', '大转盘', '27242960', '27242970', '10', '1543563670');
INSERT INTO `fa_score` VALUES ('52', '潘越', '新手礼包', '0', '1000', '1000', '1543564520');
INSERT INTO `fa_score` VALUES ('53', '金雷', '大转盘', '415', '420', '5', '1544435072');
INSERT INTO `fa_score` VALUES ('54', '金雷', '大转盘', '420', '425', '5', '1544435081');
INSERT INTO `fa_score` VALUES ('55', '金雷', '大转盘', '425', '435', '10', '1544435093');
INSERT INTO `fa_score` VALUES ('56', '金雷', '大转盘', '435', '440', '5', '1544494500');
INSERT INTO `fa_score` VALUES ('57', '嬴益虎', '新手礼包', '0', '1000', '1000', '1544669640');
INSERT INTO `fa_score` VALUES ('58', '胡公靖', '大转盘', '777470', '777480', '10', '1545965754');
INSERT INTO `fa_score` VALUES ('59', '胡公靖', '礼品兑换', '777480', '775380', '2100', '1547184708');
INSERT INTO `fa_score` VALUES ('60', '胡公靖', '礼品兑换', '775380', '773280', '2100', '1547184737');
INSERT INTO `fa_score` VALUES ('61', '黄蔚', '大转盘', '1000', '1005', '5', '1548034843');
INSERT INTO `fa_score` VALUES ('62', '纪洪波', '新手礼包', '0', '1000', '1000', '1548056824');
INSERT INTO `fa_score` VALUES ('63', '胡公靖', '大转盘', '771480', '771485', '5', '1548065739');
INSERT INTO `fa_score` VALUES ('64', '胡公靖', '礼品兑换', '771485', '769385', '2100', '1548065807');
INSERT INTO `fa_score` VALUES ('65', '胡公靖', '礼品兑换', '769385', '768335', '1050', '1548065833');
INSERT INTO `fa_score` VALUES ('66', '胡公靖', '大转盘', '760535', '760540', '5', '1550214262');
INSERT INTO `fa_score` VALUES ('67', '陈锋', '大转盘', '27242970', '27242975', '5', '1550478872');
INSERT INTO `fa_score` VALUES ('68', '李新宝', '大转盘', '9294005', '9294010', '5', '1550478879');
INSERT INTO `fa_score` VALUES ('69', '周万里', '大转盘', '1000', '1005', '5', '1551176813');
INSERT INTO `fa_score` VALUES ('70', '李新宝', '大转盘', '9294010', '9294015', '5', '1551232666');
INSERT INTO `fa_score` VALUES ('71', '李新宝', '大转盘', '9294015', '9294020', '5', '1551232674');
INSERT INTO `fa_score` VALUES ('72', '陈锋', '大转盘', '27242975', '27242980', '5', '1551236790');
INSERT INTO `fa_score` VALUES ('73', '陈锋', '大转盘', '27242980', '27242985', '5', '1551669286');
INSERT INTO `fa_score` VALUES ('74', '陈锋', '大转盘', '27242985', '27242990', '5', '1551669303');
INSERT INTO `fa_score` VALUES ('75', '李新宝', '大转盘', '9294020', '9294025', '5', '1551774216');
INSERT INTO `fa_score` VALUES ('76', '陈锋', '大转盘', '27242990', '27242995', '5', '1552012563');
INSERT INTO `fa_score` VALUES ('77', '潘越', '大转盘', '1000', '1005', '5', '1552354302');
INSERT INTO `fa_score` VALUES ('78', '潘越', '大转盘', '1005', '1010', '5', '1552354319');
INSERT INTO `fa_score` VALUES ('79', '胡公靖', '大转盘', '760540', '760545', '5', '1552386137');
INSERT INTO `fa_score` VALUES ('80', '潘越', '大转盘', '1010', '1015', '5', '1552446283');
INSERT INTO `fa_score` VALUES ('81', '潘越', '大转盘', '1015', '1020', '5', '1552446290');
INSERT INTO `fa_score` VALUES ('82', '纪洪波', '大转盘', '400', '405', '5', '1552461283');
INSERT INTO `fa_score` VALUES ('83', '纪洪波', '大转盘', '405', '410', '5', '1552463213');
INSERT INTO `fa_score` VALUES ('84', '陈锋', '大转盘', '27242995', '27243000', '5', '1552542532');
INSERT INTO `fa_score` VALUES ('85', '胡公靖', '大转盘', '746944', '746949', '5', '1552550335');
INSERT INTO `fa_score` VALUES ('86', '潘越', '大转盘', '1020', '1025', '5', '1552550362');
INSERT INTO `fa_score` VALUES ('87', '李新宝', '新手礼包', '0', '1000', '1000', '1552611814');
INSERT INTO `fa_score` VALUES ('88', '纪洪波', '新手礼包', '0', '1000', '1000', '1552613505');
INSERT INTO `fa_score` VALUES ('89', '李新宝', '大转盘', '1000', '1005', '5', '1552617024');
INSERT INTO `fa_score` VALUES ('90', '潘越', '新手礼包', '0', '1000', '1000', '1552617349');
INSERT INTO `fa_score` VALUES ('91', '潘越', '大转盘', '1000', '1005', '5', '1552617381');
INSERT INTO `fa_score` VALUES ('92', '潘越', '大转盘', '1005', '1010', '5', '1552617394');
INSERT INTO `fa_score` VALUES ('93', '纪洪波', '大转盘', '1000', '1005', '5', '1552620436');
INSERT INTO `fa_score` VALUES ('94', '黄蔚', '新手礼包', '0', '1000', '1000', '1552620770');
INSERT INTO `fa_score` VALUES ('95', '周万里', '新手礼包', '0', '1000', '1000', '1552621318');
INSERT INTO `fa_score` VALUES ('96', '纪洪波', '大转盘', '1005', '1007', '2', '1552877845');
INSERT INTO `fa_score` VALUES ('97', '胡公靖', '新手礼包', '0', '200', '200', '1552900534');
INSERT INTO `fa_score` VALUES ('98', '胡公靖', '大转盘', '200', '210', '10', '1552902518');
INSERT INTO `fa_score` VALUES ('99', '黄蔚', '大转盘', '1000', '1005', '5', '1552902639');
INSERT INTO `fa_score` VALUES ('100', '纪洪波', '大转盘', '1007', '1009', '2', '1552959458');
INSERT INTO `fa_score` VALUES ('101', '', '大转盘', '0', '2', '2', '1552976397');
INSERT INTO `fa_score` VALUES ('102', '黄蔚', '大转盘', '1005', '1010', '5', '1552977228');
INSERT INTO `fa_score` VALUES ('103', '胡公靖', '大转盘', '210', '212', '2', '1552982554');
INSERT INTO `fa_score` VALUES ('104', '', '新手礼包', '0', '200', '200', '1552984760');
INSERT INTO `fa_score` VALUES ('105', '纪洪波', '新手礼包', '0', '200', '200', '1552988853');
INSERT INTO `fa_score` VALUES ('106', '纪洪波', '大转盘', '200', '205', '5', '1552989993');
INSERT INTO `fa_score` VALUES ('107', '纪洪波', '大转盘', '205', '210', '5', '1553045688');
INSERT INTO `fa_score` VALUES ('108', '纪洪波', '新手礼包', '0', '200', '200', '1553049930');
INSERT INTO `fa_score` VALUES ('109', '潘越', '大转盘', '1010', '1012', '2', '1553059716');
INSERT INTO `fa_score` VALUES ('110', '黄蔚', '大转盘', '1010', '1012', '2', '1553059831');
INSERT INTO `fa_score` VALUES ('111', '纪洪波', '新手礼包', '0', '200', '200', '1553062159');
INSERT INTO `fa_score` VALUES ('112', '纪洪波', '新手礼包', '0', '200', '200', '1553062286');
INSERT INTO `fa_score` VALUES ('113', '纪洪波', '新手礼包', '0', '200', '200', '1553062440');
INSERT INTO `fa_score` VALUES ('114', '纪洪波', '新手礼包', '0', '200', '200', '1553062603');
INSERT INTO `fa_score` VALUES ('115', '纪洪波', '新手礼包', '0', '200', '200', '1553063351');
INSERT INTO `fa_score` VALUES ('116', '纪洪波', '新手礼包', '0', '200', '200', '1553067099');
INSERT INTO `fa_score` VALUES ('117', '纪洪波', '新手礼包', '0', '200', '200', '1553067215');
INSERT INTO `fa_score` VALUES ('118', '庄智东', '新手礼包', '0', '200', '200', '1553074720');
INSERT INTO `fa_score` VALUES ('119', '郭蕴莹', '新手礼包', '0', '200', '200', '1553136938');
INSERT INTO `fa_score` VALUES ('120', '潘越', '大转盘', '1012', '1017', '5', '1553137250');
INSERT INTO `fa_score` VALUES ('121', '纪洪波', '大转盘', '200', '205', '5', '1553148683');
INSERT INTO `fa_score` VALUES ('122', '纪洪波', '大转盘', '205', '210', '5', '1553217927');
INSERT INTO `fa_score` VALUES ('123', '胡公靖', '新手礼包', '0', '200', '200', '1553218162');
INSERT INTO `fa_score` VALUES ('124', '姚刚', '新手礼包', '0', '200', '200', '1553221776');
INSERT INTO `fa_score` VALUES ('125', '黄蔚', '大转盘', '1012', '1014', '2', '1553233362');
INSERT INTO `fa_score` VALUES ('126', '潘越', '大转盘', '1017', '1022', '5', '1553233555');
INSERT INTO `fa_score` VALUES ('127', '纪洪波', '新手礼包', '0', '200', '200', '1553235898');
INSERT INTO `fa_score` VALUES ('128', '纪洪波', '大转盘', '200', '205', '5', '1553235909');
INSERT INTO `fa_score` VALUES ('129', '纪洪波', '大转盘', '205', '207', '2', '1553236039');
INSERT INTO `fa_score` VALUES ('130', '黄蔚', '大转盘', '1014', '1019', '5', '1553236043');
INSERT INTO `fa_score` VALUES ('131', '纪洪波', '大转盘', '207', '209', '2', '1553236055');
INSERT INTO `fa_score` VALUES ('132', '黄蔚', '大转盘', '1019', '1021', '2', '1553236060');
INSERT INTO `fa_score` VALUES ('133', '纪洪波', '大转盘', '209', '211', '2', '1553236062');
INSERT INTO `fa_score` VALUES ('134', '黄蔚', '大转盘', '1021', '1023', '2', '1553236068');
INSERT INTO `fa_score` VALUES ('135', '纪洪波', '大转盘', '211', '213', '2', '1553236086');
INSERT INTO `fa_score` VALUES ('136', '黄蔚', '大转盘', '1023', '1025', '2', '1553236091');
INSERT INTO `fa_score` VALUES ('137', '纪洪波', '大转盘', '213', '215', '2', '1553236094');
INSERT INTO `fa_score` VALUES ('138', '黄蔚', '大转盘', '1025', '1027', '2', '1553236098');
INSERT INTO `fa_score` VALUES ('139', '黄蔚', '大转盘', '1027', '1032', '5', '1553236106');
INSERT INTO `fa_score` VALUES ('140', '纪洪波', '大转盘', '215', '220', '5', '1553236109');
INSERT INTO `fa_score` VALUES ('141', '黄蔚', '大转盘', '1032', '1034', '2', '1553236113');
INSERT INTO `fa_score` VALUES ('142', '黄蔚', '大转盘', '1034', '1039', '5', '1553236121');
INSERT INTO `fa_score` VALUES ('143', '黄蔚', '大转盘', '1039', '1041', '2', '1553236128');
INSERT INTO `fa_score` VALUES ('144', '郭蕴莹', '大转盘', '200', '202', '2', '1553236201');
INSERT INTO `fa_score` VALUES ('145', '郭蕴莹', '大转盘', '202', '207', '5', '1553236209');
INSERT INTO `fa_score` VALUES ('146', '郭蕴莹', '大转盘', '207', '209', '2', '1553236217');
INSERT INTO `fa_score` VALUES ('147', '郭蕴莹', '大转盘', '209', '211', '2', '1553236224');
INSERT INTO `fa_score` VALUES ('148', '郭蕴莹', '大转盘', '211', '213', '2', '1553236239');
INSERT INTO `fa_score` VALUES ('149', '郭蕴莹', '大转盘', '213', '215', '2', '1553236245');
INSERT INTO `fa_score` VALUES ('150', '郭蕴莹', '大转盘', '215', '225', '10', '1553236252');
INSERT INTO `fa_score` VALUES ('151', '郭蕴莹', '大转盘', '225', '230', '5', '1553236260');
INSERT INTO `fa_score` VALUES ('152', '郭蕴莹', '大转盘', '230', '235', '5', '1553236267');
INSERT INTO `fa_score` VALUES ('153', '潘越', '大转盘', '1022', '1024', '2', '1553236272');
INSERT INTO `fa_score` VALUES ('154', '潘越', '大转盘', '1024', '1026', '2', '1553236279');
INSERT INTO `fa_score` VALUES ('155', '潘越', '大转盘', '1026', '1028', '2', '1553236285');
INSERT INTO `fa_score` VALUES ('156', '潘越', '大转盘', '1028', '1030', '2', '1553236295');
INSERT INTO `fa_score` VALUES ('157', '潘越', '大转盘', '1030', '1032', '2', '1553236309');
INSERT INTO `fa_score` VALUES ('158', '潘越', '大转盘', '1032', '1037', '5', '1553236316');
INSERT INTO `fa_score` VALUES ('159', '潘越', '大转盘', '1037', '1042', '5', '1553236324');
INSERT INTO `fa_score` VALUES ('160', '潘越', '大转盘', '1042', '1044', '2', '1553236331');
INSERT INTO `fa_score` VALUES ('161', '潘越', '大转盘', '1044', '1049', '5', '1553236338');
INSERT INTO `fa_score` VALUES ('162', '纪洪波', '新手礼包', '0', '200', '200', '1553236511');

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Records of fa_sms
-- ----------------------------

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for fa_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_token`;
CREATE TABLE `fa_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `token` varchar(255) NOT NULL,
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_token
-- ----------------------------
INSERT INTO `fa_token` VALUES ('1', '14_dNcPi2woEMRtzT19cpCVZOrMcJpVDAO6eBT7hHrA42o-SlIiSJuLrkrHfbAp5teZkh6s0ANAvvy1LsYd8c1dZqoHjqprqTAGQcE7XclVCesoF2aaHKq276JHPgc0_Jj10ybZH3yVmo-oJA2XTSXfABAPOT', '1539236514');
INSERT INTO `fa_token` VALUES ('2', '14_T5bme4Bte8SgSL3GQfG5kgWKy122vK896jociAHtSNj5zgMvkrDrQwbzIpLLKINM6k-1lfVm0nUN41yZnyai0CYl6t_tGkhaaj_blyUCFGKBPsYgPN3HVjHw1rAWEAgAAACKG', '1539570174');
INSERT INTO `fa_token` VALUES ('3', '14_TnR1OI5sLa30cPgUePlwV86rSgPCvWMalifxdRz26K2bgR63yKs-iM419Ys3-tEAnBwalk-a-KOsvi98M6cz13TNO6b0LN-vgf9dXLlT3lrNCSsv1VW12Jai_1Y-nmTjlq6sVfsNtBu1wXN1JTRcAFARBZ', '1539594941');
INSERT INTO `fa_token` VALUES ('4', '14_NxRTiF9pKFMlymW51uYjlm8VCax8b1NTWFzvhiMja8U7Crwq8HQcZyHJESiTj2wPFPtpGJimN48nYKihSz9y_ls3KdCU8ZDLiD43jn5KeD14P3ozinY4XyEHcrGpbyR4YU4V1AD9QtLwlz6PIZLcAEAVMY', '1539655278');
INSERT INTO `fa_token` VALUES ('5', '14_gsppSRotLrSBRhVzYuyUIOFlcl4ZvEZ7cvyEHR7ZPCMQfwFadxX6BnINp_wutcuyLK68mKj8Z8-iSFQ0BvP0DQFT7fmk2qX-CB0zw4awlSye5uJCtH9qifWO-tynOepOB-X25I8t04oHo9ZrSTAcAEABCJ', '1539670580');
INSERT INTO `fa_token` VALUES ('6', '14_EcGZjMAMBkk-7TCexPaSCHs7BySOPwaJHGavXV7FDBSLwAtZkgJF5JdKJNdTp3MW40JKgPCiQbZ4H24igrtLygCtFT-Vp81SiL3rV3e8QgA1_M7lJlQosur6G1oiFYoDMc-Ekxh6YlNPO5w-DTXjAFARHL', '1539670638');
INSERT INTO `fa_token` VALUES ('7', '14_TgMzyYf-YNrpEUyXS4b-ei-hzf5WczsVesV5NjjB5sS8LrgfprmWqH_dtvEedwq-0MGJAml_feUzGh-a80otqiT0Nl_mtJiXcBxLlXl4HaeSBD2580ZQcUZV2YnmTXYEnrIoNX9XoxDYKpxJOPMaABAVWT', '1539671724');
INSERT INTO `fa_token` VALUES ('8', '14_wr2LSsBD4ctvgzosS4b-ei-hzf5WczsVesV5NjjB5sS8LrgfprmWqH_dtvELmdZBqq0u3sQKpCejwH40A_H595kLck7huqz0ZpgpmwOHT31H1C0LyXpOwNctba3guyqGAhRp5yy0i1yhd2sMJYJaABANCN', '1539671727');
INSERT INTO `fa_token` VALUES ('9', '14_aq6DCej6q2jm88OqJC-KzmuwLHXrvpoPVTSaOVIFIeeGGMvT9YSR6svfZoCFLQNQ_Zz_D2pE0FGfJ1LgCTQzykGesoCDJIbReA2l1gEQTtHoogEEgUVm0H-eXaolGhjVo74yRuQRPpBIhq18ZNIhAEAHVQ', '1539672290');
INSERT INTO `fa_token` VALUES ('10', '14_9Uha0IIGfVBBsOoiJC-KzmuwLHXrvpoPVTSaOVIFIeeGGMvT9YSR6svfZoBPFArgFD9_p5WhfoUsRjoJBceTi59QiXNsqVBxh3biLu7E49vogTYgTq8umH6GW2afJLXn_4VZwrh1gpFTC79eHTAhAEAAMT', '1539672293');
INSERT INTO `fa_token` VALUES ('11', '14_bIOTczCTVt9XWE3aS3c8aVztR39yZXC_Myby14e76CIaXvRBsiPqYAMJsXReFBmYNiuZ2-1LI9_ytyF7dRHnowSbfIGiBxrg4WakCkUXh8ndB0V7JlwlVT0W8f3uFtyMNAgtXOT2jSEDclKQMZTcACAFSM', '1539672687');
INSERT INTO `fa_token` VALUES ('12', '14_tlMHPEh2t66iMxu9YJVbqPBGZL8eiwqO2WyHvOtP9_UJ3oWLLCHLIfGL4VoQfsvpmzNR7YrVlUpqgo0G-HV9XlK6fuReoE6OuKCnCtGvxqPAo3ONJ4P1AMJhW4MxzHfAxCAUOt1I1CM16YHqZOAjAJAGVH', '1539672805');
INSERT INTO `fa_token` VALUES ('13', '14_k1Tr8t3uOr1x9tspYJVbqPBGZL8eiwqO2WyHvOtP9_UJ3oWLLCHLIfGL4VruECYFRqXcLKJvIopSVD5KVlLA3liKVFVNrxqHdqrIxW0gIR0qs54X5RpuJFvOghi3_vvhxwvhqdmq7cToxoE2PPTjAJAZZD', '1539672808');
INSERT INTO `fa_token` VALUES ('14', '14_eVjphGxEO6AnkT9HYJVbqPBGZL8eiwqO2WyHvOtP9_UJ3oWLLCHLIfGL4VoieTZsQjbU53rJpGOJUYLuxz_602U8ATaHIeJbFQoX4ZSKWE80H6TXesllcbdV0HKGndY2GQ8UjZlyjTWKFYO2POOjAJAHGG', '1539672810');
INSERT INTO `fa_token` VALUES ('15', '14_crGG9IB6f_GYusY1YJVbqPBGZL8eiwqO2WyHvOtP9_UJ3oWLLCHLIfGL4Vozn3k-I9infFPE692YBt_J8W0tt7N7gD-1DLwhh2So5k1mv68POUXffloYpw4Fpca5FEkMa73nhNkapHPd7sWDMYWjAJAVHF', '1539672813');
INSERT INTO `fa_token` VALUES ('16', '14_npZcNPKC4CqP0H77cLGup7ZJ1Kk6Ju2arGHrd2k4pY-D4omT7qL4sUat7q7bW70LOVru9DoLP6CgKdhFzA_RUfKi39R7BmeEJNNEkdd4oH-znMrI324ISqBgHFfy1MkAv0WupVcHIIWfuxgjIOMdAGAVBZ', '1539675166');
INSERT INTO `fa_token` VALUES ('17', '14_u7k4twv_9-D6cX5_cLGup7ZJ1Kk6Ju2arGHrd2k4pY-D4omT7qL4sUat7q5Xr6oxqW__VsmcXL19RZiHakB52F41yB3cuDHsYuGXY4JtwBCs2ajsEyb72aCVKc0zOqS-DPTB5DBkEHASJFmQSSRdAGAMML', '1539675178');
INSERT INTO `fa_token` VALUES ('18', '14_0mdUrZGh_M92PQWfYJVbqPBGZL8eiwqO2WyHvLNMK5wsPcexFD-HdO_-Ul4e1IkPMjKpm8E7Pty8jQitiVSpWWwKnMBlnaSv-pv8ujcwhvNCgCrqQI_6c9Q6WFiPUpY3HLmL92HRlSqtb2D5YLUdAGAOBK', '1539675492');
INSERT INTO `fa_token` VALUES ('19', '14_NmRDhZoVRZEyxHLTYJVbqPBGZL8eiwqO2WyHvLNMK5wsPcexFD-HdO_-Ul6lUBhM8x2Rjy6HpsLeIrrbfv-0S5-cilqyXmKmiCjeD8_YcGNsJpmUARAHzAbxljLy3Il88O_rXYfwmBwHk6iZFPZdAGABLV', '1539675494');
INSERT INTO `fa_token` VALUES ('20', '14_iyaQZo8NMb4RPEPfYJVbqPBGZL8eiwqO2WyHvLNMK5wsPcexFD-HdO_-Ul62Pr-V6zpMqpl8rjRWM5cWpldM5SboACySqS5Zm44MAtbTiYaZ5HXxpYztazG_8k_9R1D_dAQws4DpLAiXDItrNSOdAGAJOK', '1539675496');
INSERT INTO `fa_token` VALUES ('21', '14_3fCrvTwtb-fXaScHYJVbqPBGZL8eiwqO2WyHvLNMK5wsPcexFD-HdO_-Ul7PJ3hh0p-F6cHldgdFSZqE_mIRdOQzNOTpUKLPK6Ut5XnMnrBYOpAMWWdbAy62-JpndIL2iR2MD9draVvI-jmkUJVdAGAXMY', '1539675498');
INSERT INTO `fa_token` VALUES ('22', '14_NyGnhgYRI5UnXGkBYJVbqPBGZL8eiwqO2WyHvLNMK5wsPcexFD-HdO_-Ul6xFb4Z3OJkdJ5zc38LhniWGs8-II2_aE-3BlH96VWlkT7_auGSr2viu5VU_-59VXCyoz5GSHWimbBDC-_taIKiSUKdAGAEGW', '1539675503');
INSERT INTO `fa_token` VALUES ('23', '14_8wD5zIbWc4E8tEUKYJVbqPBGZL8eiwqO2WyHvLNMK5wsPcexFD-HdO_-Ul4FbRGHbByHho7I02DpzyZSDskP0z2O-Sm8MDqtYYOVOKn03JFnSOwA_RPBghBpD1GxuQ3xAS8Breofe4DO--eGMYBdAGAEQT', '1539675506');
INSERT INTO `fa_token` VALUES ('24', '14_yme13IbweUhKuql6YJVbqPBGZL8eiwqO2WyHvLNMK5wsPcexFD-HdO_-Ul4KFNjr9FgYBPAE4t8Gb_-xAcyWRlYqHRKzj6sJ2C59KUz2p1nDGG2sjMQx7M8NUBS2gVEyzgnv6ciYSp3lxkWlKBBdAGAGXX', '1539675508');
INSERT INTO `fa_token` VALUES ('25', '14_2nYoSX6xHxb9Tm0P9tKu8oQ227n4JrY84HfqCYnYFJ-cKAwBrS86_3SiVr6Tk0u_siPO0-kfgONVt7zFnjeA7IGmVhvnPT7UFmWbsDLKw00v9mkl7O9TTa-THdhIsTYszCJKsdBjcV6eTY9LEHSbAFAUXI', '1539675514');
INSERT INTO `fa_token` VALUES ('26', '14_FHAcj_DEynHIuVc4DCX8p_RYza8uG9KgOIPWgYmmZ2TWX7meRFBpcDiPJOaN3CoqqbWyMl3ls3908pwOS2znw78hOpzIacpi9Cs9iRdW8Wc5vzcjdybtYkfA4ZpEpuC9AcOy0r1ZlEZEkyUjOOEgAFAYYO', '1539761658');
INSERT INTO `fa_token` VALUES ('27', '14_T5NGPFyoF-lhV9tfDCX8p_RYza8uG9KgOIPWgYmmZ2TWX7meRFBpcDiPJOYluG1CSZ3jYHHcS1Uv2PQlIZKYIadmbAuipfJDE-GdcsMK7QsZ13hL2cwcyvOP2rGwFPENJt8ReWMSuHnjVj10NEAgAFAARN', '1539761676');
INSERT INTO `fa_token` VALUES ('28', '14_J0quzY8uIOI-80UGc_h6hIImAwp7WOOuQlVyxat0zgwO5s4L7vIpJtxrR6yQnfS_N760rL2kWIVSYO88-IJE5QNsG-dDQcbmGFXil-_x4xVbqh2i6AGRsywnj97-aZAb0yyK_BqfmnUYugWJAHOcADAELS', '1539761685');
INSERT INTO `fa_token` VALUES ('29', '14_M4MioA7jBFQvt8nQ2Bp4RFfJdZX995es91edaPiMHrxOUHk2ANlJ_xZc4Z6PjwMy46BtLiQ1iudeL5dfqCcmO4YSeddni6MGb6KwmHZn_5lwDgLnwVZsQJSy2n-VxlLxzKNSjXpwNjgL73eBPASjAAAITL', '1539761758');
INSERT INTO `fa_token` VALUES ('30', '14_UE_QIrmdXgel7bFd2Fyy-NXrbNOB6pOLMrXIyiql5y12Oz4Dv0Ht8Zhs1cSm3BAyERlGWPqvrpi-ONLjywxvqAGa-OvZqZ-L60g2RBEG4umjPrbeds_6DL9WMKTs5LlHQRpiOVZb3pcJGc9oCNPhAAAMXZ', '1539761797');
INSERT INTO `fa_token` VALUES ('31', '14_HwZKMUqP7R6YuvEqYfwJD6QhsCKcXedzudYbv3HYh73Sx_U9ege5xApULUOgciE9YT2ObT7Sg_S9WxFHztTj6Ut1ZfUQ0ACIQb-u1GM8I2dO5FhuUZ7by8ToUCF5Qu6RTLlVE_lc0IEVR6VqSFNdADAVIQ', '1539762605');
INSERT INTO `fa_token` VALUES ('32', '14_A8Roih5WimXb3r-FYfwJD6QhsCKcXedzudYbv3HYh73Sx_U9ege5xApULUMljmf1ApxqCb8ANmDR8AHHzYk6dF1fvy1G7ygswLNLPTQnaBQ2F19R4bvx8Yr9RIY83E1ralt5QS6eOyKbdongWYWdADASUS', '1539762619');
INSERT INTO `fa_token` VALUES ('33', '14_DnGIDs7JAaiNKGnn699hs9kM-QBUrY-0paNZ-IZXAT7doCPU8xk4CRtnsTG3sRFpGZULaanPbdy9foZELc3EXW6avFLTY0UXojrp01uOBnFFv-8iMn4G81CCO9w-JpeqxtIqgJFzgyagwfj-GEKgAJAVTZ', '1539762640');
INSERT INTO `fa_token` VALUES ('34', '14_y6GSgbZmUm1ZzyFz699hs9kM-QBUrY-0paNZ-IZXAT7doCPU8xk4CRtnsTFDe5j2jl_db1b6Eu6Y6qg44zSfrbGT3REVwWObkbSl-5Qz5A7sLYg2jjOkNbhHlhN5vgUgJyveXbjK6StV2sSDPGSgAJAEVH', '1539762644');
INSERT INTO `fa_token` VALUES ('35', '14_Lcdswk8iikVt1nUn699hs9kM-QBUrY-0paNZ-IZXAT7doCPU8xk4CRtnsTEYK4SNTVb6EQa3oqYAXxyK5FOCn44oiqS594IItz7nVH7gGXJoZjJUWDd8IKWSk4Ze3P30xFaxZ9bn7JZNLYK7VYLgAJAMPC', '1539762647');
INSERT INTO `fa_token` VALUES ('36', '14_9Su-bCm8LxiaCLXmFojqFOH1XxgVJ78TF38V8A70kll2SqTLYln-055SWcYjETx-RBu9b9wYULCMG7Fp7LWY2nnioiCNONZXV9_q7a0Onr5bJeJUJ9tZXK9x26Q5rT9-ZlUbe18k43Q1_qjOCFUiADALOD', '1539830755');
INSERT INTO `fa_token` VALUES ('37', '14_h70Jn28Tf6nviuTdJeR2Ec1J38LWFBotrsqPzNE3MWusMOTvj_5ClB0oTJ5JuVU6wjhON2tKG1dDpAczGpNWi6G8-SX7eqAkbrDibaclfBd0NBypIneKuPKjYrDI_osAebbNMytcC0HTIdqwCBFbABARQU', '1539831060');
INSERT INTO `fa_token` VALUES ('38', '14_MPXyFmFLJhrzmaKoJeR2Ec1J38LWFBotrsqPzNE3MWusMOTvj_5ClB0oTJ6A2gvHwCSxeU5Ei-qOABrK6Bu_ZwhZfRguDhg1eL3PNaaz24i2Fucm2hH-WiNCd6_lZwJUzKaaLZZXmBrht3EbVXZbABAMOQ', '1539831062');
INSERT INTO `fa_token` VALUES ('39', '14_I80M9u48zUj0b9C6JeR2Ec1J38LWFBotrsqPzNE3MWusMOTvj_5ClB0oTJ47YDWyg9DnysCRyP1dunXrSyNv6rextCVv6eNZhClhPAQwvtzXpVgGRhJ9wG8GVKGAK0E8gq7-36Tq55pVaDb4MSCbABARXH', '1539831065');
INSERT INTO `fa_token` VALUES ('40', '14_yPIyamW74BUICDFFJeR2Ec1J38LWFBotrsqPzNE3MWusMOTvj_5ClB0oTJ4QcncY5ZZ9D3-EnpA26iRTS8pqjQnjQiMv9qW50IxUZkbc8rBh9Y44NoNjKwmtDG29T6SKoB0bkYq7sKZasKHGFDDbABAKII', '1539831068');
INSERT INTO `fa_token` VALUES ('41', '14_pL7LOld_QFHB1a1rJeR2Ec1J38LWFBotrsqPzNE3MWusMOTvj_5ClB0oTJ6kd9HFvQIr-QvGBYHc50KijD3E5a2XKb46xjTVOJXwwKzbean5d_QE2JPzmEq76dyoB6G8TAd7aI-v98tJqe78RLAbABAVPE', '1539831070');
INSERT INTO `fa_token` VALUES ('42', '14_q_gL-qcTVvi5R8e2_cYtUapfxb6qWEY6R1LkgZFeDoIuOjePP0IP9X5woo5S4Ckg7ChcKpyDbGuToXTtWHiCfGp91I5k98UAFaE3uxPkXrqvTrGd55f9zKrnZUnhvNcvTid6Tz0vmRYXUSB4MKFdAFAQOJ', '1539831494');
INSERT INTO `fa_token` VALUES ('43', '14_6xKxZecU1LJFo0Cz_cYtUapfxb6qWEY6R1LkgZFeDoIuOjePP0IP9X5woo4BNhYjapL5iJte6W5be7Zfcm2pgvciNmRSYcWOP-KNRqtsEDPTOpqaVVPgl5uksh-G0ReXKNkT6rO4wK4qKfAGXCUdAFADIA', '1539831496');
INSERT INTO `fa_token` VALUES ('44', '14_--X3jyTd0iLOyPXJ_cYtUapfxb6qWEY6R1LkgZFeDoIuOjePP0IP9X5woo5v-BzV3lEbrUiC3nujf9ffnGA_eZZgySqmc0OoMCp6I3d9xIa0ZhPJdfvTZXg13YOgA5UuFgOYGoZq9ZrJLqElYIIdAFAKUU', '1539831498');
INSERT INTO `fa_token` VALUES ('45', '14_HYyMtq3MuLp5BTeC_cYtUapfxb6qWEY6R1LkgZFeDoIuOjePP0IP9X5woo6id6OeGm7I3nlYEt1SclVLbYnIJvO-b_FfaSF7pyBs92tABmKTGpss-iOJ4Oex6vpYtaiPSznlUxB6ob8pYYDdHUJdAFAQDS', '1539831501');
INSERT INTO `fa_token` VALUES ('46', '14_YVFCndf7sGc9_jw8_cYtUapfxb6qWEY6R1LkgZFeDoIuOjePP0IP9X5woo5PfEESoaRG_1Jouebnn396jo9VEHD2jbgCJwtX2YHlr0MBaKdr2_KE-3N4a-WW2YqtSOE-KVDoCvokOw3CmkmQBRRdAFAIYY', '1539831504');
INSERT INTO `fa_token` VALUES ('47', '14_V5E-DmjATjtUh7Jn_cYtUapfxb6qWEY6R1LkgZFeDoIuOjePP0IP9X5woo7LKkP84whsvHQCcgeZX5SeE__RW3U03uwG_mebScQs4BDtLMOwR7A8kveDWbudpO9HQRk_l63VOPORPOiWPP25YLSdAFADQX', '1539831509');
INSERT INTO `fa_token` VALUES ('48', '14_Mp9R-PIwIJk9MP5MnxYa8D5T2DoyUNNhWmAj_VK2wIZ5ePEk6IbUiMfP-Os5Jq7Eh85QPbBEHRn4Uk78o4t2KZnt3YlS2fD13gYEhcbzvB8VRGKssdIbK_ByfnoBPLfAAANBX', '1539928289');
INSERT INTO `fa_token` VALUES ('49', '14_umBahuBOVrGhHSyqIHm_Ee4QF10YvvALiPT90vgU8RvdAiuWsAgxDu8niU3hri--gpv7Sok_EO1ctlbbHONeGA08ff1HiMQhDqO2W9_v_nUM_JGwgZ_GUlmRNkMgkFEPKjdWgA1q-hUmYSm8ZGMeABAKRX', '1539928911');
INSERT INTO `fa_token` VALUES ('50', '14_QuLDon-UJK6Z1XNC-zYiqNFSW0XIrsqlv-xLPAKMwxbB9Vjh67ZZR9r6zdRs3jil3O06830D4gRmz9BVzSJqS__Tk5c53vbrwbEJNvI-zkwTh-nAkkST0GzRs9r7H6yr8BBdxtc94jja5eZKGVAeADAUJO', '1539940189');
INSERT INTO `fa_token` VALUES ('51', '14_jVZ7qfomQxPb6xWiIHm_Ee4QF10YvvALiPT90gPzfSXYLybMauQE2xdv0qWWb4Jnb4VQ0Ne63QoIZqh7d9OuhM_SlsCCL5HgyJY4sIpEdHuGKtT4Te3vj_2cQxog0N8uFIep50NPtsXUuq5vPWUiAJACJH', '1540170453');
INSERT INTO `fa_token` VALUES ('52', '14_P8UlkGHnMm1hv2vQzgnuc39S1nTuibNxIkT2c2FdcAksRBH5TkTXI1afm7G6HvCH1C7EgmEchxhRNjiibb0reREGksB_wYxkOovFrElX8YZcqVeRe034tfyK3ncHl22mjdY2tQMxTLkbqLQaZPZdACAGWG', '1540275954');
INSERT INTO `fa_token` VALUES ('53', '14_rwZm3uYALt9MenfK3jnEwLqoSIAAstZXod6o78qCk5v9_ZHZjK_8SS4TZnx9culRsZVQW9kCysfdCZqy29WHaw_E3QtXlHB0Dekn7Qm0FAY0TsmNNpT2BTw2ZVMDod1vgy-wOMkPkDOeDEDaWFWbAFADMD', '1540277406');
INSERT INTO `fa_token` VALUES ('54', '14_RibDJ0Zsjx2Nkykv3jnEwLqoSIAAstZXod6o78qCk5v9_ZHZjK_8SS4TZnyAe2DiIL64Ef50zPv2GMyJhQr_CGoq_3vYh9NI4UYVAEGJLUO42hNk4PV94NHJeebUYLV4_9uhI8HvjxhzGeR1ANTbAFAOBH', '1540277408');
INSERT INTO `fa_token` VALUES ('55', '14_H5zmDVPj57-4TFEC3jnEwLqoSIAAstZXod6o78qCk5v9_ZHZjK_8SS4TZnw0o7bMnaZX6gr7gQUwzcd_UuS0PCIKuFyoifvLf4fPSFxdtWRtkNnRPsGU-cXRtVZgtv4MNSzGFYHs1lx4w_aYBSAbAFAOFN', '1540277411');
INSERT INTO `fa_token` VALUES ('56', '14_PNL8HI_8KUBDttJq8Jzjz18iaFQ_dJgzC7e51K9FSpvr6amr1aZvj8nHdnZ3V0VlBwtYOj8FxuGtf_g-UQxsRM6gfNKLEdQ6X0wrL1vx1rh06tACaIsBx_xt0VBIXyFNIy2EzKGRW_jL0hsfKAXaAGASIF', '1540280765');
INSERT INTO `fa_token` VALUES ('57', '14_MckGcLinuiE1MyTt8Jzjz18iaFQ_dJgzC7e51K9FSpvr6amr1aZvj8nHdnaeXy2symGuQMYtTQmm_hdmeCNIJSTE-7UPlnHR77cnhIfh5E7KWG3NEA_3smM3qqzIRZS20wZw8b8BlVNYOOE6TDYaAGABLG', '1540280782');
INSERT INTO `fa_token` VALUES ('58', '14_RvGET0spUMZ7oRwtCxS0Z-QaREQgV3eUYzegQcAU1xnDQefw24n8Kb9nYyrAURuQjWUXIKL-unpHN7exf2exir7DJYl9xlTozRu-op3SrRWAXFar_G0pOEPvsnjdstBB2RyEvXcOVU6LwsG7ZRAdADAUMV', '1540281680');
INSERT INTO `fa_token` VALUES ('59', '14_uisfCYSYLBYG7GRwO_rfRYST6KGYtnsx4L_w16GfF-OXVQJ9hh9CKr7v3PNBd8myxPy2P_PTCOnrLN0mZhqXCrMZ4GAcdNJcIjJwrzC9dTYIMJImAKLqfuHMYoETGXcABAJWN', '1540281951');
INSERT INTO `fa_token` VALUES ('60', '14_sww9K7-RbW4irASQO_rfRYST6KGYtnsx4L_w16GfF-OXVQJ9hh9CKr7v3PNpN7FcBEVe12xLsmgeZVqTq89Ci_1CeleWzmi8bDj8p8GU2AjdGzRy9oJQZ4EefewCKRcABAMUB', '1540281964');
INSERT INTO `fa_token` VALUES ('61', '14_siKJpRjyyGbJs3qhQXJC_BKQumV4F-SoglV-CKxEJlvqQ3vL2qKAzkFipH5jV9U69Y9KSpTMUhdJ0AkS6MPttz-m5cLuX2cZV8OuQQ0GcQp-ilPACiS7Fm-ZDjJzxUqn0amVH-YfpCdyDQKMCQFgAJAYMB', '1540281972');
INSERT INTO `fa_token` VALUES ('62', '14_3Ojvq75LzVynOTpqQXJC_BKQumV4F-SoglV-CKxEJlvqQ3vL2qKAzkFipH5mtYUnLYmRLpgzzF4nhWLJHCdJZjNvYscSNAC6iPFZ7WI1QiFKYl4fa6m4dMgQ8BtyWm9t2um4zVw9fWuRBPPQSABgAJABJK', '1540281980');
INSERT INTO `fa_token` VALUES ('63', '14__QO-8iPn5OsnlPvrpHbdTxqGtxRz3tby9KDYm2fKG7qK4r0JJOpXz6rinLBXydJQ2OvFmNOKD0ceCg1_eJfE3xu3nHCAD0sjrBymsq6glu6Ogx7FBK0MI6haD_-TRDKnQpwtz1IN5thkoKrKWMJiAIABRO', '1540281992');
INSERT INTO `fa_token` VALUES ('64', '14_vDv_7adYKLpq6lUkpHbdTxqGtxRz3tby9KDYm2fKG7qK4r0JJOpXz6rinLDkhbMN73VlXCjtXGmKE8u6VuW5z5nz7CX0IUDPYiTfsAC5iehhInpTPXe0Ah_TIv7U8SZ_iRpbJX0dJNRVDP-sXBYiAIABFC', '1540281998');
INSERT INTO `fa_token` VALUES ('65', '14_0fKrtZX5v8Dj5TxWpHbdTxqGtxRz3tby9KDYm2fKG7qK4r0JJOpXz6rinLD3PpvQlFBCjV8rIjXNnH0kz4LVfDnIqR9CsiY-niFUZ1qLyliFgolpw_2m_YLlcXnBPOlEI_hM7FZ9v_9SA5ZGJHEiAIAPNK', '1540282009');
INSERT INTO `fa_token` VALUES ('66', '14_JN8s1aZxal1o822SXr-L8FbLe4DPH0MLm9Slzy2kX20anunDMe6gjKqhb5c59yxyQxWYfnJODbVx-7DEAipMl3lSpfpJg3EDqqa_UoaKuiTQT0IEf-BS6hKaloToHwqig9m6y1RJzeiPZrQXZYUcAAAQPL', '1540282028');
INSERT INTO `fa_token` VALUES ('67', '14_yWLteucmUCNNKyVc1nHlh_0w6f8RbmbiiAC3x6o4zUZlR4Q2mOzCCjIheK1Cp3cfvCl0BZN4juR1uuDeJ1sElL0X_qZgu1F70e2bv_6YqrUE7P26cZ-umQeSD6Sy95tluEVdYjTuzYsyMrYXMKKgAJAPNN', '1540282571');
INSERT INTO `fa_token` VALUES ('68', '14_Fo36jcx1vaJOoZkpxe8-x5y0FkZmeuCeFyc6ZYBK9_Ax9YgyFU9sSctASFSO3gBCV6e03wqKyvRPLY7x1B1cUotRSGMMOAstwqPYgEqKTAtImlh5w5Fsgi9d3YlUHFvnKAVcJep7bVi9vd0EPAGdAAAALR', '1540282619');
INSERT INTO `fa_token` VALUES ('69', '14_sziZXpn4HQ1cQf0MHARx2CHYlyTa5cIEyVmuAldvHEA1NIBfAzTDJmLJx1z386SaWdX5WRvlInbGVZVgB3dVAFNZuhgRJHpWDyXhQ-7Z3ienxEd_rJ2pwHzorDUFFZhAIAJJD', '1540282645');
INSERT INTO `fa_token` VALUES ('70', '14_iDvz1pdIZ0MXGgJZNCRlnGFBWVvX0Q1Fr7WFYWu-rsXbEtw4wECMKVZXV1Zbk3omtlqI5YIsCD6nrlMa-CgEpFr-En3UTHPfHdlE5OSs6Ui3RqCHmjX3-RTHRE9U_0JKxi2xThx49nyw7OkBTXFjAEAGKS', '1540283164');
INSERT INTO `fa_token` VALUES ('71', '14_bNelmARZYsPwVNF4GAue36Hj9sduxPBkDX9STT9m0E9CakUPfuPJRtuGgNfjAEw7JG4cQLMH18BBPmX3BM1J_ouBpt8Y74GIk7NKNrMA_B1qz0hez8AbOIi8oJkWBAaAAAEJI', '1540343800');
INSERT INTO `fa_token` VALUES ('72', '14_Jb5CiTh6dyBAkPm9x54rsNX4jep3UtZEJSooHIK6GyJdB4JptDH44FmT-XAUbBXkzAEhPYMhHPHACOAWF25WC8NRohAK0dDcDyBQ-FejqWtGvBW1PHhPQvu-6rkMadOYFMjtlhw0MJ0JhIe7QMAfAFAIES', '1540344877');
INSERT INTO `fa_token` VALUES ('73', '14_yCaqlK-lyv6G1MYc3OM9UNy073C5xwKQ_kj0ASV7H0GNZe7GN4p_58ODJ2dR05Ixq0AO_CpcfARHTHFp4Zhdfl_kWQx-F0Cy8NNG3zx7wZWd6qUo7t5lg5NunvIb_XCUOD8z7hT2fEbBl35wPEXbAIALAT', '1540344922');
INSERT INTO `fa_token` VALUES ('74', '14_LVI7Zn9uj19m3bOe8Jzjz18iaFQ_dJgzC7e51EU3DUQNDnPSMfnkXTjQ07PhYxc4lR0KwaNLSvgt2iTg58kn0FpmpBTKlLCPAF0n35XCdB7czkATZa0jvwO0YO1DzQdehAtLdjIBa-OAYl8pXDDeAGAEKK', '1540344949');
INSERT INTO `fa_token` VALUES ('75', '14_PG8F3Nb8z2f_aAlxTJK7jesRSRlSqlOm8yflsoROL0xCJmTA0UPXyE6B6dTB5gYTfyZ9eiQ7MHWFIEyZunewbKDjYA2jZZyOkybIj3TcB9g5pIq1zbgkL3FtjmMCcTuuv-nExD3J0xreYx3BOSLgAIAAEX', '1540345092');
INSERT INTO `fa_token` VALUES ('76', '15_3i0VsUrbVbv_lrmZbqQJ8QjGzubjJxd4UVXYxVn6xQnmoUNSZ6dKB3bGWd-j1AhhdPoeoz801psM-OIWgIAprQVVyIcNA3xy3EyFmUQ03z-epYjyx8UPB_4hZ1zA3aLzVm2VDbmaYgKA52HHHYSjAEABSM', '1540369775');
INSERT INTO `fa_token` VALUES ('77', '15_h9oFwZ4QNgHao_S4bqQJ8QjGzubjJxd4UVXYxVn6xQnmoUNSZ6dKB3bGWd8W9_v7pYaIcwTDVOHpgC6J7i7VwG5fxegFZe3nNJdV8Gg4F_Zk_Dll_ja-KnIWJZRYxyo6-WVJr1Q6lCehdI6xQTDjAEATWG', '1540369778');
INSERT INTO `fa_token` VALUES ('78', '15_OCL-13erCHnIgy8H8EZqXctaqBCkCt7BQ9KaAwIU1u42UASCb_hQCyqxuyN7BQBnjPi6hCdQWQZYYERUmLKFDD-I9xhlyF0d0QCIpYcVJI0HbL11kw3BC1UaWDAG1mPxuQCXESCV220RERzWYWGdAFANLV', '1540371685');
INSERT INTO `fa_token` VALUES ('79', '15_J_BT4jsK7TAm2R6r4GKIP75Xo_riiB3h83hjYHWSgljpa1wYZ8XnEi4gtpcybxoFE9GRGT5v2GeCmaZe3U_G0oqVhETXjbReOBM9sunFbiTg0wvW_OUGlG3fNNwdeQeI8G8FmmHjQbecdjYfAFUbAGATYN', '1540371869');
INSERT INTO `fa_token` VALUES ('80', '15_t4If_6B1AiHgsimqDaI0aMgSW7ZWUsg39Ql4pwftrXsWj0fv8_BoC-MWW4xxY_SzznJrPmPSYBtXoegKhJCsAlw0NdIpCDR4iUhhGp7avlMXcWNsaUjIdoFc1pn7Nw8qUzHwNlrmxxZQQ8uVBNMgAJAIUT', '1540778761');
INSERT INTO `fa_token` VALUES ('81', '15_p-kPjZ6IcZ4uLy5sDaI0aMgSW7ZWUsg39Ql4pwftrXsWj0fv8_BoC-MWW4ybg0A4swD91D510ouz4otrjvgIJ82UU5Lj85pLyyyU1W7lEQsEQ60bbN-wY3Md_W2UYpX1-btj5GIz_ggFTiI1HNZgAJAQWI', '1540778777');
INSERT INTO `fa_token` VALUES ('82', '15_JzeQYZRxBNsvo7oFX1ghxu_my01hTOymy95fbdqgaR1DETSWn_ieRzyO2rnBqJx0Vz6chkkY4598TkzUPbB9-dsl0azENV8td2yz9tQg-BngxGL6s0vThZGP5B_BeSRhCZB8PWkAk5h8W05hQESeAFAAOC', '1540778783');
INSERT INTO `fa_token` VALUES ('83', '15_FY09NIS1i-cWgA5iX1ghxu_my01hTOymy95fbdqgaR1DETSWn_ieRzyO2rnkJb2LZqcU-kYO8ZNPoWbKAB9U11PRi80bH7G_ZlDTiu--8uzrmApEsJoEonIgGJFtzz9-1fIT-gW68c-IvVe1CVZeAFAOHL', '1540778786');
INSERT INTO `fa_token` VALUES ('84', '15_z28zNUDz8KpTMB460aPB0VhSQkLVrlLF-rGZDLb7n0VSmwLuV6htYV8K0fUtkLc1DoGspLkcdurnXu8FTeLB2QOU0nEkKQ4Cv7eCoLLFIQ1XP96fgHthkeZDgNsdxGCgR22mxlf_S4vOjZyAJHCcACAQOJ', '1540790394');
INSERT INTO `fa_token` VALUES ('85', '15_XPj5_i9bXrAIlj3a0aPB0VhSQkLVrlLF-rGZDLb7n0VSmwLuV6htYV8K0fV4T6mBmeD2gE7JnQaO7YUxTlFNMVClajueVHyfogNDemJvclAxNX5Rpyslk695_Y_3J03S1ymly1lhDXAzgiV5TIPcACACRY', '1540790397');
INSERT INTO `fa_token` VALUES ('86', '15_xpPciL51hiqc_RaBHrof5j9ru3OtvfnIMQRN65tBD92G7NYlp1BbmbdAGeHGVbjSQpVvotNJf-v1UMQmEbOoNeDumSNGH3JAwPzn1OWRU_YFM5y7CTi6QTRvJMtgOZjsdqHJT5RXlF4K1m6bZWIiAFAGDP', '1540801644');
INSERT INTO `fa_token` VALUES ('87', '15_QHol0ONugL8zxAG1X1ghxu_my01hTOymy95fbVk_C7yc9kHy7Z3IBCbXKDH1OGybVGv15P8TumTSfJ2x0Rui_ICswaHDENJkfjG8gYb_wkCfdtUtuzWm8d0aoIxeg2UoAbh9qGICHJpfmuvOKSGeADABJX', '1540868872');
INSERT INTO `fa_token` VALUES ('88', '15_vdikTxROzQPOheVP2Df_OBj2xuil_7Xwk_-fCaEkW7Q9Yjo87SyydTCHwcHm6EA-NqZRIQDdH7esvCbyDgv0Rs70kmGFynNXIsIM7F5I4KfnBEtvm9U2VAubq97JuSBIGmkIkH8yaML7_TofGIVdAHAYAN', '1540870172');
INSERT INTO `fa_token` VALUES ('89', '15_V3ExlhEYzgJboYU5V0keKlro6jzKdbQVAOM4lMRG4EOrEDMF1Oz782wkVgfr5iiAs8ri8_pwohUsE3SQhHNTebYkTty9EJ9SLuVDRzFjKVs-O3B_w9oQ8xQ05YI4WMYFDo0vLUxJgteY6aT_BZPeAHALJZ', '1540947377');
INSERT INTO `fa_token` VALUES ('90', '15_6vLr7eQIuOUOWoJzux24iXB_hjq2IOgxFl4yPK_heDdUhXSN6-ZNyQcpd_jKC7RZWVcvQV6ELvyUm0kWCY6PdHiPtsmj3UcgwFx7Z_zb6rHttQnkU1qrtD-HA_zIALOUMWVhDQ8mI0fNrfD9KSYdAHAZHN', '1540969640');
INSERT INTO `fa_token` VALUES ('91', '15_lEnSv9jB551hI_FOkDp89N3kOhRsrPWG1ZK_THYrFRIsP0pu3MzfGLe8U1v0tTttaRhY8wNucKj8xncpjQe6AlrNTbYofYMu9kR2MIdwe4GSMuf21_NkKpL159zsRD1tB-Sdklt7a_TPNtFnIHSbAEAPOZ', '1540972853');
INSERT INTO `fa_token` VALUES ('92', '15_ne-FcXBnHcXzvX2P1Z0dwMphF83Auz2RzIOp2fHNVg6vS2CWPmvFShv3TPqFXyXhzV_AJMCxrAfExY4YmfgdWToB2z9FNf3v5kahwDG42RVc1fSZ8IQeA0v6Kih8e13cpyesWjFzeogvI936EZJaAEAZUE', '1540972928');
INSERT INTO `fa_token` VALUES ('93', '15_-OIbWoDKXtYRJuYykDp89N3kOhRsrPWG1ZK_TFf9xNHIBzHl7gEsbY_wMo4iqT2dChUp_1B6KOKsi3t_NtPw477lE-xp0A3mr3vOrwTWv8IhVbhKymQs4vBnmUqZ2DNd5RXUreGgOmKvAYsNQFJdAFAWLP', '1541043893');
INSERT INTO `fa_token` VALUES ('94', '15_ute_N0l8l870Do3uIkL2Z1Lz3yNdxnnybH3dsYSIhaGUkloaEyJDR94UBWwEk1sQf3sm986ZuLGvSPVFRCz1wskc3-QbFjy2Riyq0iYwRxVFxtd4nUjXyq4w6b3GpuSqzzPsB_MPyVbtEzYWZKZjAFALWL', '1541055737');
INSERT INTO `fa_token` VALUES ('95', '15_bUGQyf73i0eejGBCBj3z-pp35QZTQ_Z25KGaUW7UbE9jH4jgXWNvzLo9oQXzuE1HPvWVcPINac8zP35A51m-Fp5vtFcmT-t1o8A3WyyFE96Jmo104Q3IeRqTPGyfW1YzvTGIO2-H0qug8rk8MKZgABAZXM', '1541055773');
INSERT INTO `fa_token` VALUES ('96', '15_mj5XzvtLZ1OjMqotG3TVCsozvB8fR2PQPBw45piVmDcGY5aJZT-1Y9ftyQ-i4zcOxQMOJEv_x3vbrUov_3hqYvNmEBxJgnuZAWl70Zf5-dFFJ_DI-WV2fX3eZvYMLDSnhSNjhgavcieDrSXJZTJgABARLB', '1541059421');
INSERT INTO `fa_token` VALUES ('97', '15_KxSAtheDYZdxqVZ2tWUlpEX39-52w05SClEEDewSOGrbwiux2F0oiNzct7XuRv-tD4wjFx6S7qyYhKeA6MyxiW1zKkL16RtR_i1mEDWJ28rwwQ0Rqtnf3hjmn0Ye2GxaiTjWTpRM2CecJbA0TQZdAFAPMV', '1541061659');
INSERT INTO `fa_token` VALUES ('98', '15_ejx55RtaNeUU02n0pitNQaKZzcIjgxheprqQSHD6Sj1jFY9Ivi3IfwoXPa3mU5kU2voeN-yPFqYAKg0wq6cJNIcY7bMrEk_VY1OuKDXnT6eIT7hfMUNoz7oG5mP5s75AY17PMS-TxAeTOqDIYIIhAEACMM', '1541066327');
INSERT INTO `fa_token` VALUES ('99', '15_tkYMSdntyfHxp5r_pitNQaKZzcIjgxheprqQSHD6Sj1jFY9Ivi3IfwoXPa0R8mEzduyva9N0QUt5HZf4D8DQZ8uuMoLjWDrTHRpQROoQKervgK49-rWhhgm_41yW-IDZCs00XqaeQLXXBcZPCTEhAEAIZK', '1541066337');
INSERT INTO `fa_token` VALUES ('100', '15_XtGbu4yUYTN5TCsAyp2M_AVznq91Bd_Z14UvBVuD3qmfelZ9kzOF0k08CvRy-d9K0hHaRQQhxkbOxUOgJt2g6K4n7fR7CTqqDgKhR0siJ9ccibdKNSvD1Ot0ExmFTxzmgw57uvqpXBvHQXyqSCBdAIANXW', '1541066358');
INSERT INTO `fa_token` VALUES ('101', '15_v2Hu35COOdyM7boMTP0u79fyqVa_0ojBjfDoq0qzbCPQhjFc_wNyyf6a4PRL7L_GsbuUivUJqNdW3bdQVMte-nKOTjFfskkPGJmBlen5ePyqXsN1LfdXcj_pXaLi8dxwfUOwOgx4Ni8C-NnnVMZbAJAOFS', '1541066527');
INSERT INTO `fa_token` VALUES ('102', '15_UuOpTcemBgPbe-8V7qezMe6RqEXqKdXXVD-JYlglzDWRGQW593phM9di7XizIMwowFg1blXGAIhSV2LePpUtkgQkwb9OBBGA-_D4mUDxQdiDj9beQjHvdPAdFrFgnzEf8lUIJWgolZxdNOWEOHCbAGAKDY', '1541657212');
INSERT INTO `fa_token` VALUES ('103', '15_Ngt0VWz6I4954AzwqeFVazDq2PS5QVyCUjJPcSahFbw9vcI5Blcg0ruDOMFzAmiSeZE9ZD4CkrM-Kg-ymPE_rA8zd-UZz0kJdR9AB6psJmvgTcYJoM4GDnXXBD6WGWgYZKwH6QpgO8357mT0IURfAJACOL', '1541731317');
INSERT INTO `fa_token` VALUES ('104', '15_4TLHjxuzCcAMOH5cN6DhJCK2h6bJGunh2Af05Qp0dzYNr7ZdiBzd6Q0ujeRLS-iH8pSuUSKTlNOKbL8UxW_piSEmldlKaW69_xDKtsPRFYBAvq6TabKHUAbDBYE9G9qjbAot88K6lPPh7cisKHPeABASPX', '1542694725');

-- ----------------------------
-- Table structure for fa_turndesc
-- ----------------------------
DROP TABLE IF EXISTS `fa_turndesc`;
CREATE TABLE `fa_turndesc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `desc` varchar(255) NOT NULL COMMENT '转盘描述',
  `size` int(11) NOT NULL COMMENT '字体大小',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='转盘描述';

-- ----------------------------
-- Records of fa_turndesc
-- ----------------------------
INSERT INTO `fa_turndesc` VALUES ('1', '0元抽取iPhone XS', '18');

-- ----------------------------
-- Table structure for fa_turntable
-- ----------------------------
DROP TABLE IF EXISTS `fa_turntable`;
CREATE TABLE `fa_turntable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `image` varchar(255) NOT NULL COMMENT '物品图片',
  `name` varchar(255) NOT NULL COMMENT '物品名称',
  `pid` varchar(255) NOT NULL COMMENT '奖励ID',
  `num` int(11) NOT NULL COMMENT '奖励数量',
  `face_value` int(11) NOT NULL COMMENT '显示面值',
  `value` int(11) NOT NULL COMMENT '物品价值',
  `probability` int(11) NOT NULL COMMENT '抽取概率',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='转盘管理';

-- ----------------------------
-- Records of fa_turntable
-- ----------------------------
INSERT INTO `fa_turntable` VALUES ('1', '/uploads/20190315/51d9751b01230485990b16f99f5d9b08.png', '谢谢参与', '4', '1', '-1', '0', '899', '1');
INSERT INTO `fa_turntable` VALUES ('2', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '2活跃值', '3', '1', '2', '2', '4500', '2');
INSERT INTO `fa_turntable` VALUES ('3', '/uploads/20181101/b982b33c030a20350d23dd2fa53e6d37.png', '2元话费', '话费-5', '1', '2', '400', '1', '3');
INSERT INTO `fa_turntable` VALUES ('4', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '5活跃值', '3', '1', '5', '5', '4000', '4');
INSERT INTO `fa_turntable` VALUES ('5', '/uploads/20190315/5f7a024aa56afad67b72aa9bd5cefa10.png', '10元京东卡', '6', '1', '10', '2000', '0', '5');
INSERT INTO `fa_turntable` VALUES ('6', '/uploads/20181101/bd9564c48972f272e5770cb0bc34c859.png', '50活跃值', '3', '1', '50', '50', '100', '6');
INSERT INTO `fa_turntable` VALUES ('7', '/uploads/20181010/3793aeffcd03c21092d3d433dd0831e6.png', 'iPhone Xs 64G', '7', '1', '-1', '1630000', '0', '7');
INSERT INTO `fa_turntable` VALUES ('8', '/uploads/20190315/bd9564c48972f272e5770cb0bc34c859.png', '10活跃值', '3', '1', '10', '10', '500', '8');

-- ----------------------------
-- Table structure for fa_turntableconfig
-- ----------------------------
DROP TABLE IF EXISTS `fa_turntableconfig`;
CREATE TABLE `fa_turntableconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '抽取次数',
  `astrict` int(11) NOT NULL DEFAULT '-1' COMMENT '投放上线',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='转盘配置';

-- ----------------------------
-- Records of fa_turntableconfig
-- ----------------------------
INSERT INTO `fa_turntableconfig` VALUES ('1', '1', '1000', '1539159854', 'normal');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `idnumber` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `constellation` varchar(255) NOT NULL COMMENT '星座',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `openid` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `gold` int(11) NOT NULL COMMENT '金币',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `sign` varchar(255) NOT NULL COMMENT '签名',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `isnew` bit(1) NOT NULL DEFAULT b'0' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES ('1', '1000001', '李新宝', '%E5%85%BB%E4%B9%90%E5%A4%9A', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLWqtPXqwR8qWiaQuyIR0UUUr1RcpPUrZO9V5dds5waNqaiawmACrR9KRAKrqRn1iadJU8B3m3hL1mFQ/132', '', '', '18591407523', '610427199511124512', '', '0', '1', null, 'o7G-45Q8f5sVDUYdrmHeWPFXW_BA', '1005', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552611760', '1552611761', '', '', '');
INSERT INTO `fa_user` VALUES ('3', '1000003', '潘越', 'Panyue_', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIvLicv6X970mqvEibSBIbQMqmNq3pibA4bsLQz43qJWPcTmyWef181XnPHCnVLHbuAFDMHvt9c0xpDQ/132', '', '', '15565128656', '410221199702201318', '', '0', '1', null, 'o7G-45WlMvTR3F9p6VhN0wSvZO_Y', '1049', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552617305', '1552617306', '', '', '');
INSERT INTO `fa_user` VALUES ('4', '1000004', '黄蔚', 'tiger%E2%81%B6%E2%81%B6%E2%81%B6%E2%82%86%E2%82%86', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqibs0Qq5MBky9A8m9gEx10FqN7zjibJPENHw7BnjLVlM7UWRHyPLsicHFUXYHSle8UzibvsIZ1stVhqw/132', '', '', '15062513200', '320582198610126034', '', '0', '1', null, 'o7G-45bBrqz44ZDhHTNdC3zK3I5g', '1041', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552620375', '1552620375', '', '', '');
INSERT INTO `fa_user` VALUES ('5', '1000005', '周万里', '%E5%91%A8%E4%B8%87%E9%87%8C+Kevin', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2JZOd85J2fd4TIpjOW549uAPWuicHW3ufWCsQ9QzYcvKKJTIfmbozKT40fLQQNqShSLAgWQoEWUw/132', '', '', '13761351568', '320684199307038712', '', '0', '1', null, 'o7G-45RNIus2MPI0axzeCKXmoZLk', '1000', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552621263', '1552621264', '', '', '');
INSERT INTO `fa_user` VALUES ('6', '1000006', '', '%E9%99%88%E9%9F%A6%E8%8D%A3', 'https://wx.qlogo.cn/mmhead/rM7w4VxbZ6aMAWFR4fNZ0aUMGGko1K8lFVPqgiclnje4/132', '', '', '', '', '', '0', '0', null, 'o7G-45aWaZ_qOWouMTBulPGM2_As', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552647918', '1552647966', '', '', '\0');
INSERT INTO `fa_user` VALUES ('7', '1000007', '', '%E8%8F%9C%E8%8F%9C', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLWlL2gOYBVrib5WOLQK5gN5qfGAc5EkxKQ6TBKpWSd7HEOy09G66rMP157d7POWdK6F39eVD237gQ/132', '', '', '', '', '', '0', '1', null, 'o7G-45ZYQFUm_DkJyEQwNadC0Zic', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552659442', '1552659450', '', '', '\0');
INSERT INTO `fa_user` VALUES ('8', '1000008', '', '', '', '', '', '', '', '', '0', '0', null, 'o7G-45TXsiPvh_IOWVKMPv9kZN00', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552818134', '0', '', '', '\0');
INSERT INTO `fa_user` VALUES ('9', '1000009', '', '%E9%BB%84%E9%9D%99%E9%9B%AF', 'https://wx.qlogo.cn/mmhead/icmv082120ltR8MG3dibcm0G0dLKUJyaDabHbhwwXnpicc/132', '', '', '', '', '', '0', '0', null, 'o7G-45UGVy1W3iQvK1V1xgtNjc5Q', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552873821', '1552873840', '', '', '\0');
INSERT INTO `fa_user` VALUES ('10', '1000010', '郭蕴莹', 'GYY', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIRAqjw9wTDHUsvHficgw2U2KYMfiaWhSrXJyndF0cKlemicmjhQdEjLPpx6xmP0lcXjpuBQCGZVe08g/132', '', '', '18201738127', '510503199510207026', '', '0', '2', null, 'o7G-45d1xP4aATXeGc1nDLgU07gE', '235', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552888362', '1552888362', '', '', '');
INSERT INTO `fa_user` VALUES ('12', '1000012', '庄智东', 'Z+z+d.', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCDXicHPrPYheaP1omT8GR9xeoN0LAFKRqB8FkqQdRT77Q0ruBr6M8W7X8vMweWazic8EwsicYzgJgw/132', '', '', '13701943927', '320621199312128135', '', '0', '1', null, 'o7G-45dxv8ma59yc-1_LlDIZI3ng', '200', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552903106', '1552903106', '', '', '');
INSERT INTO `fa_user` VALUES ('13', '1000013', '', '%E8%83%A1%E4%BF%8A', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJvrBiahEB4eV5jCMzG8KNsE2jnwfoXp0WSY15f0Ssuq4RyvOCmmmFdstHCT1tfBGap2cjl8JyJ0uA/132', '', '', '', '', '', '0', '1', null, 'o7G-45XT70ik53cUkrGLb0hcDdAM', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552967832', '1552967843', '', '', '\0');
INSERT INTO `fa_user` VALUES ('14', '1000014', '', '', '', '', '', '', '', '', '0', '0', null, 'o7G-45QnkS3GMa5lfBbpYh95HwrQ', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1552979593', '0', '', '', '\0');
INSERT INTO `fa_user` VALUES ('24', '1000016', '', '%E7%8E%8B%E9%9B%85%E9%9B%AF', 'https://wx.qlogo.cn/mmhead/Xkvp7uC7uP94U44hFJ0XVJUy7pq3chJ7LPYTS2gfOr4/132', '', '', '', '', '', '0', '0', null, 'o7G-45bbbsGIeQAZxeKWBHCjdpzA', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553160117', '1553160165', '', '', '\0');
INSERT INTO `fa_user` VALUES ('25', '1000017', '', '', '', '', '', '', '', '', '0', '0', null, 'o7G-45TSM3fAeK4TA-r3asKjU4Lc', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553175294', '0', '', '', '\0');
INSERT INTO `fa_user` VALUES ('26', '1000018', '胡公靖', '%E8%83%A1%E5%85%AC%E9%9D%96', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmwiaTw5qEF70jx65mibZrAj6szKOm2UwrUg3XpZjctew2Yfe0q06ytEMjvGXfPTOntufkGDRkYGLA/132', '', '', '17765118447', '330382198507094055', '', '0', '1', null, 'o7G-45QF613d8bE0JWQCllc90eJg', '200', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553218123', '1553218124', '', '', '');
INSERT INTO `fa_user` VALUES ('28', '1000020', '', '', '', '', '', '', '', '', '0', '0', null, 'o7G-45UUSzDif4QOqo-mS2N9RYsE', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553220779', '0', '', '', '\0');
INSERT INTO `fa_user` VALUES ('29', '1000021', '', '%E6%88%91%E6%98%AF%E8%B0%81', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKcibbqSaADlAsQf0IWAmg8DBbe48icnQkJ14UDcdTMhDGeiaialj3ZIzf2Ev8mXQkw9ggtA8lLAj3keg/132', '', '', '', '', '', '0', '1', null, 'o7G-45XNATRY2saHNWU8kb4LvITA', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553221693', '1553221701', '', '', '\0');
INSERT INTO `fa_user` VALUES ('30', '1000022', '姚刚', '%E5%95%86%E4%B8%9A%E9%AB%98%E6%96%B0-%E5%A7%9A%E5%88%9A', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erBFRQKrn4E0Q0ZiaF74oux50sBu7Una3ZON1q1WhZZVnDkz2rxicvCv5f1HwU0EnFW5icH3xFkumLJQ/132', '', '', '18018686768', '310105197107012012', '', '0', '1', null, 'o7G-45RPx32xX5hRDiQYJqn33agI', '200', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553221718', '1553221723', '', '', '');
INSERT INTO `fa_user` VALUES ('31', '1000023', '', '%E5%90%83%E7%9B%B8%E9%9A%BE%E7%9C%8B', 'https://wx.qlogo.cn/mmopen/vi_32/qh869sib5HsXTiblKDwzbTmSrNYLmochhXhDBK8D21Ldt7JDnniaHIQy8b5lsiaYpurlOIQ25sl1sZDpHKo29ib0meA/132', '', '', '', '', '', '0', '0', null, 'o7G-45WScyR0NaZBbnErguH3x9H4', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553231681', '1553231689', '', '', '\0');
INSERT INTO `fa_user` VALUES ('33', '1000024', '纪洪波', 'BULL', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK1Zm6RglHCCswMfpleXv1TibSNkr7ruaD5opzW23lmZBBnibg6PPTziaicLkhYhvVGSOict7qhpbiaIPnw/132', '', '', '17511696527', '232330199305204013', '', '0', '1', null, 'o7G-45a7u9fhzxOoEFlnjMkmJ0ys', '200', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553236426', '1553236427', '', '', '');
INSERT INTO `fa_user` VALUES ('34', '1000025', '', '', '', '', '', '', '', '', '0', '0', null, 'o7G-45fyAFX9WR8iqeaR9rKxGi_A', '0', '0', '1', '1', '0', '', '0', '', '0', '', '', '0', '1553237148', '0', '', '', '\0');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员组表';

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES ('1', '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', '1515386468', '1516168298', 'normal');

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员规则表';

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES ('1', '0', 'index', '前台', '', '1', '1516168079', '1516168079', '1', 'normal');
INSERT INTO `fa_user_rule` VALUES ('2', '0', 'api', 'API接口', '', '1', '1516168062', '1516168062', '2', 'normal');
INSERT INTO `fa_user_rule` VALUES ('3', '1', 'user', '会员模块', '', '1', '1515386221', '1516168103', '12', 'normal');
INSERT INTO `fa_user_rule` VALUES ('4', '2', 'user', '会员模块', '', '1', '1515386221', '1516168092', '11', 'normal');
INSERT INTO `fa_user_rule` VALUES ('5', '3', 'index/user/login', '登录', '', '0', '1515386247', '1515386247', '5', 'normal');
INSERT INTO `fa_user_rule` VALUES ('6', '3', 'index/user/register', '注册', '', '0', '1515386262', '1516015236', '7', 'normal');
INSERT INTO `fa_user_rule` VALUES ('7', '3', 'index/user/index', '会员中心', '', '0', '1516015012', '1516015012', '9', 'normal');
INSERT INTO `fa_user_rule` VALUES ('8', '3', 'index/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '4', 'normal');
INSERT INTO `fa_user_rule` VALUES ('9', '4', 'api/user/login', '登录', '', '0', '1515386247', '1515386247', '6', 'normal');
INSERT INTO `fa_user_rule` VALUES ('10', '4', 'api/user/register', '注册', '', '0', '1515386262', '1516015236', '8', 'normal');
INSERT INTO `fa_user_rule` VALUES ('11', '4', 'api/user/index', '会员中心', '', '0', '1516015012', '1516015012', '10', 'normal');
INSERT INTO `fa_user_rule` VALUES ('12', '4', 'api/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '3', 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分变动表';

-- ----------------------------
-- Records of fa_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for fa_usergift
-- ----------------------------
DROP TABLE IF EXISTS `fa_usergift`;
CREATE TABLE `fa_usergift` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `images` varchar(255) NOT NULL COMMENT '按钮',
  `title` int(255) NOT NULL COMMENT '标题',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='新手礼包';

-- ----------------------------
-- Records of fa_usergift
-- ----------------------------
INSERT INTO `fa_usergift` VALUES ('1', '/uploads/20181009/8bb0801d1c3f5ec29058e98bb162944a.png', '/uploads/20181009/d0fd00345a44a519714e8bcfabe3295f.png', '200', '1539052258', 'normal');

-- ----------------------------
-- Table structure for fa_userslideshow
-- ----------------------------
DROP TABLE IF EXISTS `fa_userslideshow`;
CREATE TABLE `fa_userslideshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户背景';

-- ----------------------------
-- Records of fa_userslideshow
-- ----------------------------
INSERT INTO `fa_userslideshow` VALUES ('1', '/uploads/20181010/24ef3154e3f53f428c43b6e6b23cea15.png', '1539150756', 'normal');

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of fa_version
-- ----------------------------
INSERT INTO `fa_version` VALUES ('1', '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', '1', '1520425318', '0', '0', 'normal');
