/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : soraka

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-01-22 15:55:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) NOT NULL COMMENT '部门名称',
  `code` varchar(20) NOT NULL COMMENT '部门编码',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父部门ID',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态：0不可用1可用',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `modify_user` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '研发部', 'D001', '0', '1', '1', '0', '1', '1', '2018-08-16 20:04:41', '2018-08-16 20:04:40');
INSERT INTO `sys_dept` VALUES ('2', '市场部', 'D002', '0', '1', '2', '0', '1', '1', '2018-08-29 14:31:45', '2018-08-29 14:31:45');
INSERT INTO `sys_dept` VALUES ('3', '运营部', 'D003', '0', '1', '3', '0', null, null, '2018-09-13 18:11:58', '2018-09-13 18:11:58');
INSERT INTO `sys_dept` VALUES ('4', '客服部', 'D004', '3', '1', '1', '0', null, null, '2018-09-13 18:13:16', '2018-09-13 18:13:16');
INSERT INTO `sys_dept` VALUES ('5', '商品部', 'D005', '3', '1', '2', '0', null, null, '2018-09-13 18:13:42', '2018-09-13 18:13:42');
INSERT INTO `sys_dept` VALUES ('6', '仓储部', 'D006', '3', '1', '3', '0', null, null, '2018-09-13 18:14:09', '2018-09-13 18:14:09');
INSERT INTO `sys_dept` VALUES ('7', '技术部', 'D007', '1', '1', '1', '0', null, null, '2018-09-13 18:14:32', '2018-09-13 18:14:32');
INSERT INTO `sys_dept` VALUES ('8', '运维部', 'D008', '1', '1', '2', '0', null, null, '2018-09-13 18:14:44', '2018-09-13 18:14:44');
INSERT INTO `sys_dept` VALUES ('10', '国际事业部', 'D009', '7', '0', '4', '0', null, null, '2018-10-16 18:24:10', '2018-10-16 18:28:53');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '资源名称',
  `component` varchar(100) DEFAULT NULL COMMENT '组件',
  `redirect` varchar(255) DEFAULT NULL COMMENT '重定向地址,noredirect的时候该路由在面包屑导航中不可被点击',
  `type` int(10) NOT NULL COMMENT '类型：1菜单2按钮',
  `path` varchar(255) DEFAULT NULL COMMENT '前端路径',
  `url` varchar(255) DEFAULT NULL COMMENT '资源地址',
  `method` varchar(10) DEFAULT NULL COMMENT '方法GET/PUT/POST/DELETE等',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限字符串',
  `ico` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点ID',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态：0不可用1可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', 'Layout', 'noredirect', '1', '/sys', '', null, '', 'system', '0', '1', '1', '2018-08-16 16:53:22', '2018-08-16 16:53:22');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', 'views/sys/user/list', '/sys/user', '1', 'user', '', null, '', 'peoples', '1', '0', '1', '2018-08-29 13:27:19', '2018-08-29 13:27:19');
INSERT INTO `sys_menu` VALUES ('3', '角色管理', 'views/sys/role/list', '/sys/role', '1', '/sys/role', '', null, null, 'role', '1', '2', '1', '2018-08-29 13:27:59', '2018-08-29 13:27:59');
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', 'views/sys/menu/list', '/sys/menu', '1', '/sys/menu', '', null, null, 'system', '1', '3', '1', '2018-08-29 13:28:23', '2018-08-29 13:28:23');
INSERT INTO `sys_menu` VALUES ('5', '部门管理', 'views/sys/dept/list', '/sys/dept', '1', '/sys/dept', '', null, null, 'dept', '1', '4', '1', '2018-08-29 13:30:47', '2018-08-29 13:30:47');
INSERT INTO `sys_menu` VALUES ('6', '内容管理', 'Layout', 'noredirect', '1', '/sys', '', null, null, 'system', '0', '5', '1', '2018-08-29 13:34:33', '2018-08-29 13:34:33');
INSERT INTO `sys_menu` VALUES ('7', '系统监控', 'Layout', 'noredirect', '1', '/monitor', '', null, null, 'system', '0', '6', '1', '2018-08-30 16:11:02', '2018-08-30 16:12:05');
INSERT INTO `sys_menu` VALUES ('11', '系统设置', 'Layout', null, '1', '/monitor', '', null, null, 'system', '0', '4', '1', '2018-10-16 11:13:30', '2018-10-16 11:46:02');
INSERT INTO `sys_menu` VALUES ('12', '用户查看', null, null, '2', null, '/admin/user/**', 'GET', 'sys_user_get', null, '2', '0', '1', '2018-10-16 11:49:06', '2018-10-16 11:49:06');
INSERT INTO `sys_menu` VALUES ('13', '用户新增', null, null, '2', null, '/admin/user/**', 'POST', 'sys_user_add', null, '2', '0', '1', '2018-10-30 10:17:04', '2018-10-30 10:17:04');
INSERT INTO `sys_menu` VALUES ('14', '用户修改', null, null, '2', null, '/admin/user/**', 'PUT', 'sys_user_update', null, '2', '0', '1', '2018-10-30 10:54:39', '2018-10-30 10:54:39');
INSERT INTO `sys_menu` VALUES ('15', '用户删除', null, null, '2', null, '/admin/user/**', 'DELETE', 'sys_user_delete', null, '2', '0', '1', '2018-10-30 10:56:08', '2018-10-30 10:56:08');
INSERT INTO `sys_menu` VALUES ('16', '角色查看', null, null, '2', null, '/admin/role/**', 'GET', 'sys_role_get', null, '3', '0', '1', '2018-10-30 11:01:16', '2018-10-30 11:01:16');
INSERT INTO `sys_menu` VALUES ('18', '角色新增', null, null, '2', null, '/admin/role/**', 'POST', 'sys_role_add', null, '3', '0', '1', '2018-10-30 11:04:11', '2018-10-30 11:04:11');
INSERT INTO `sys_menu` VALUES ('19', '角色修改', null, null, '2', null, '/admin/role/**', 'PUT', 'sys_role_update', null, '3', '0', '1', '2018-10-30 11:04:11', '2018-10-30 11:04:11');
INSERT INTO `sys_menu` VALUES ('20', '角色删除', null, null, '2', null, '/admin/role/**', 'DELETE', 'sys_role_delete', null, '3', '0', '1', '2018-10-30 11:04:11', '2018-10-30 11:04:11');
INSERT INTO `sys_menu` VALUES ('21', '菜单查看', null, null, '2', null, '/admin/menu/**', 'GET', 'sys_menu_get', null, '4', '0', '1', '2018-10-30 11:05:48', '2018-10-30 11:05:48');
INSERT INTO `sys_menu` VALUES ('22', '菜单新增', null, null, '2', null, '/admin/menu/**', 'POST', 'sys_menu_add', null, '4', '0', '1', '2018-10-30 11:05:48', '2018-10-30 11:05:48');
INSERT INTO `sys_menu` VALUES ('23', '菜单修改', null, null, '2', null, '/admin/menu/**', 'PUT', 'sys_menu_update', null, '4', '0', '1', '2018-10-30 11:05:48', '2018-10-30 11:05:48');
INSERT INTO `sys_menu` VALUES ('24', '菜单删除', null, null, '2', null, '/admin/menu/**', 'DELETE', 'sys_menu_delete', null, '4', '0', '1', '2018-10-30 11:05:48', '2018-10-30 11:05:48');
INSERT INTO `sys_menu` VALUES ('25', '部门查看', null, null, '2', null, '/admin/dept/**', 'GET', 'sys_dept_get', null, '5', '0', '1', '2018-10-30 11:08:01', '2018-10-30 11:08:01');
INSERT INTO `sys_menu` VALUES ('26', '部门新增', null, null, '2', null, '/admin/dept/**', 'POST', 'sys_dept_add', null, '5', '0', '1', '2018-10-30 11:08:01', '2018-10-30 11:08:01');
INSERT INTO `sys_menu` VALUES ('27', '部门修改', null, null, '2', null, '/admin/dept/**', 'PUT', 'sys_dept_update', null, '5', '0', '1', '2018-10-30 11:08:01', '2018-10-30 11:08:01');
INSERT INTO `sys_menu` VALUES ('28', '部门删除', null, null, '2', null, '/admin/dept/**', 'DELETE', 'sys_dept_delete', null, '5', '0', '1', '2018-10-30 11:08:01', '2018-10-30 11:08:01');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(50) NOT NULL COMMENT '主键，用于唯一标识每一个客户端(client)',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '客户端所能访问的资源id集合,多个资源时用逗号(,)分隔,如: "unity-resource,mobile-resource".',
  `client_secret` varchar(256) DEFAULT NULL COMMENT '用于指定客户端(client)的访问密匙',
  `scope` varchar(256) DEFAULT NULL COMMENT '指定客户端申请的权限范围,可选值包括read,write,trust;',
  `authorized_grant_types` varchar(256) DEFAULT NULL COMMENT '指定客户端支持的grant_type,可选值包括authorization_code,password,refresh_token,implicit,client_credentials,',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '客户端的重定向URI,可为空',
  `authorities` varchar(256) DEFAULT NULL COMMENT '指定客户端所拥有的Spring Security的权限值,可选',
  `access_token_validity` int(11) DEFAULT NULL COMMENT '设定客户端的access_token的有效时间值(单位:秒),',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT '设定客户端的refresh_token的有效时间值(单位:秒),可选,',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '这是一个预留的字段,在Oauth的流程中没有实际的使用,可选',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '设置用户是否自动Approval操作',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('soraka', null, '$2a$10$JuDBWyd6769RO8HZjcdaQOZnG3iVUH7N857dcBNpEfopP3tzTVqpm', 'server', 'password,refresh_token,authorization_code', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL COMMENT '角色Key',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态：0不可用1可用',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `modify_user` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '超级管理员', '拥有系统所有权限', '1', '1', '1', '2018-08-15 13:35:36', '2018-10-16 16:56:10');
INSERT INTO `sys_role` VALUES ('2', 'tech', '研发', '拥有研发人员权限', '1', '1', '1', '2018-08-29 14:27:05', '2018-11-05 16:48:12');
INSERT INTO `sys_role` VALUES ('3', 'editor', '编辑', '拥有编辑人员权限', '1', '1', '1', '2018-08-29 14:27:30', '2018-08-29 14:27:30');
INSERT INTO `sys_role` VALUES ('4', 'string', 'string', 'string', '1', '1', '0', '2018-08-30 16:47:33', '2018-10-16 16:26:57');
INSERT INTO `sys_role` VALUES ('8', 'ceshi', '测试', '测试', '0', null, null, '2018-10-16 16:32:48', '2018-10-16 16:44:49');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('12', '3', '6');
INSERT INTO `sys_role_menu` VALUES ('59', '4', '1');
INSERT INTO `sys_role_menu` VALUES ('60', '4', '2');
INSERT INTO `sys_role_menu` VALUES ('61', '4', '8');
INSERT INTO `sys_role_menu` VALUES ('62', '4', '3');
INSERT INTO `sys_role_menu` VALUES ('63', '4', '4');
INSERT INTO `sys_role_menu` VALUES ('64', '4', '5');
INSERT INTO `sys_role_menu` VALUES ('65', '4', '11');
INSERT INTO `sys_role_menu` VALUES ('73', '8', '1');
INSERT INTO `sys_role_menu` VALUES ('74', '8', '2');
INSERT INTO `sys_role_menu` VALUES ('75', '8', '8');
INSERT INTO `sys_role_menu` VALUES ('76', '8', '12');
INSERT INTO `sys_role_menu` VALUES ('77', '8', '4');
INSERT INTO `sys_role_menu` VALUES ('78', '8', '5');
INSERT INTO `sys_role_menu` VALUES ('79', '8', '11');
INSERT INTO `sys_role_menu` VALUES ('80', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('81', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('82', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('83', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('84', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('85', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('86', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('87', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('88', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('89', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('90', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('91', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('92', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('93', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('94', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('95', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('96', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('97', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('98', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('99', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('100', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('101', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('102', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('103', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('146', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('147', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('148', '2', '14');
INSERT INTO `sys_role_menu` VALUES ('149', '2', '13');
INSERT INTO `sys_role_menu` VALUES ('150', '2', '12');
INSERT INTO `sys_role_menu` VALUES ('151', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('152', '2', '19');
INSERT INTO `sys_role_menu` VALUES ('153', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('154', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('155', '2', '21');
INSERT INTO `sys_role_menu` VALUES ('156', '2', '5');
INSERT INTO `sys_role_menu` VALUES ('157', '2', '27');
INSERT INTO `sys_role_menu` VALUES ('158', '2', '25');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mobilephone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `gender` int(10) NOT NULL DEFAULT '0' COMMENT '性别：0未知1女2男',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态：0不可用1可用',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `modify_user` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记：0未删除1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'soraka', '索拉卡', '13199998888', 'soraka@soraka.com', '$2a$10$vEDFbWM5OzmMBQCKopTrCujtnQgq.sN1cSNLoRXjKFN5lS9C3rHbq', '1', '1', '1', '1', '1', '2018-08-15 17:58:07', '2018-09-12 11:53:03', '0');
INSERT INTO `sys_user` VALUES ('2', 'mayun', '马云', '13177778888', 'yun.ma@soraka.com', '$2a$10$vEDFbWM5OzmMBQCKopTrCujtnQgq.sN1cSNLoRXjKFN5lS9C3rHbq', '0', '2', '0', '1', '1', '2018-08-29 14:31:13', '2018-08-29 14:31:13', '0');
INSERT INTO `sys_user` VALUES ('3', 'mahuateng', '马化腾', '13166668888', 'huateng.ma@soraka.com', '$2a$10$vEDFbWM5OzmMBQCKopTrCujtnQgq.sN1cSNLoRXjKFN5lS9C3rHbq', '1', '1', '1', '1', '1', '2018-08-29 14:32:44', '2018-08-29 14:32:44', '0');
INSERT INTO `sys_user` VALUES ('4', 'liyanhong', '李彦宏', '13155552222', 'liyanhong@baidu.com', '$2a$10$vEDFbWM5OzmMBQCKopTrCujtnQgq.sN1cSNLoRXjKFN5lS9C3rHbq', '1', '1', '1', null, null, '2018-09-11 18:46:28', '2018-09-11 19:26:09', '0');
INSERT INTO `sys_user` VALUES ('5', 'liuqiangdong', '刘强东', '13111112222', 'liuqiangdong@jd.com', '$2a$10$vEDFbWM5OzmMBQCKopTrCujtnQgq.sN1cSNLoRXjKFN5lS9C3rHbq', '2', '2', '1', null, null, '2018-09-12 11:46:24', '2018-09-12 11:46:24', '0');
INSERT INTO `sys_user` VALUES ('6', 'dinglei', '丁磊', '13122224444', 'dinglei@163.com', '$2a$10$vEDFbWM5OzmMBQCKopTrCujtnQgq.sN1cSNLoRXjKFN5lS9C3rHbq', '2', '1', '1', null, null, '2018-09-12 11:49:24', '2018-09-13 15:59:49', '0');
INSERT INTO `sys_user` VALUES ('7', 'sunwukong', '孙悟空', '13111112222', 'sunwukong@soraka.com', '$2a$10$.OWPFLTMtS3PM2ebyzgW0OwoWjddtLDdxbZ1NRmNRVOH4aqAd5vS.', '2', '7', '1', null, null, '2018-11-05 17:51:45', '2018-11-05 17:51:45', '0');
INSERT INTO `sys_user` VALUES ('8', 'tangseng', '唐僧', '13122223333', 'tangseng@soraka.com', '$2a$10$/.ntcn6RnViZI18QkROxP.PUXYWkmXtIZZfQvK3NRquZ.E3muViG6', '2', '4', '1', null, null, '2018-11-05 18:02:13', '2018-11-05 18:02:13', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '2', '3');
INSERT INTO `sys_user_role` VALUES ('3', '3', '2');
INSERT INTO `sys_user_role` VALUES ('11', '4', '4');
INSERT INTO `sys_user_role` VALUES ('12', '4', '3');
INSERT INTO `sys_user_role` VALUES ('13', '5', '4');
INSERT INTO `sys_user_role` VALUES ('17', '1', '1');
INSERT INTO `sys_user_role` VALUES ('18', '6', '2');
INSERT INTO `sys_user_role` VALUES ('19', '7', '2');
INSERT INTO `sys_user_role` VALUES ('20', '8', '2');
