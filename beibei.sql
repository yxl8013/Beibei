/*
Navicat MySQL Data Transfer

Source Server         : YXL
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : beibei

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-10-27 19:44:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '13288888888', '123456');
INSERT INTO `admin` VALUES ('2', '13288988888', '123456');
INSERT INTO `admin` VALUES ('3', '13288888889', '88888888');
INSERT INTO `admin` VALUES ('4', '13200000000', '123456');
INSERT INTO `admin` VALUES ('5', '13266666666', '123456');

-- ----------------------------
-- Table structure for carlist
-- ----------------------------
DROP TABLE IF EXISTS `carlist`;
CREATE TABLE `carlist` (
  `username` varchar(255) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `goodsname` varchar(255) NOT NULL,
  `goodsimgurl` varchar(255) NOT NULL,
  `goodsprice` decimal(10,0) NOT NULL,
  `goodszhekou` decimal(10,0) NOT NULL,
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carlist
-- ----------------------------
INSERT INTO `carlist` VALUES ('13266666666', '31', '1', '深蓝', '28', '巴布豆童鞋运动鞋男童贝壳头 2018春秋季新款1-7岁男女童鞋夏季单网贝壳头童鞋', 'images/goods31.jpg', '299', '5', '2018-10-27 09:18:45', '25', '童鞋');
INSERT INTO `carlist` VALUES ('13266666666', '84', '1', '其他', '一箱', '俞兆林正品【决明子枕芯一对】超值2只装 定型决明子薰衣草荞麦枕芯单人枕头 【可水洗】纤维枕头 舒适保健枕48*74cm', 'images/goods84.jpg', '200', '3', '2018-10-27 09:19:11', '26', '居家');
INSERT INTO `carlist` VALUES ('13266666666', '51', '1', '五段', '800g', '原装进口荷兰版3段幼儿配方奶粉 800g*1罐', 'images/goods51.jpg', '880', '8', '2018-10-27 09:19:20', '27', '奶粉');
INSERT INTO `carlist` VALUES ('13266666666', '58', '1', '三段', '800g', '英国爱他美奶粉3段900g*3（1-2岁）', 'images/goods58.jpg', '999', '8', '2018-10-27 09:20:18', '28', '奶粉');

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES ('美妆', '颜色', '粉色');
INSERT INTO `color` VALUES ('童装', '颜色', '紫色');
INSERT INTO `color` VALUES ('童装', '颜色', '粉色');
INSERT INTO `color` VALUES ('童装', '颜色', '麻灰色');
INSERT INTO `color` VALUES ('童装', '颜色', '米色');
INSERT INTO `color` VALUES ('童装', '颜色', '雪青');
INSERT INTO `color` VALUES ('美食', '口味', '苹果味');
INSERT INTO `color` VALUES ('母婴', '适用', '通用');
INSERT INTO `color` VALUES ('女装', '颜色', '少女粉');
INSERT INTO `color` VALUES ('女装', '颜色', '草莓红');
INSERT INTO `color` VALUES ('女装', '颜色', '玫瑰紫');
INSERT INTO `color` VALUES ('女装', '颜色', '星空黑');
INSERT INTO `color` VALUES ('居家', '颜色', '其他');
INSERT INTO `color` VALUES ('童鞋', '颜色', '星空黑');
INSERT INTO `color` VALUES ('童鞋', '颜色', '深蓝');
INSERT INTO `color` VALUES ('童鞋', '颜色', '粉红');
INSERT INTO `color` VALUES ('奶粉', '适用阶段', '五段');
INSERT INTO `color` VALUES ('奶粉', '适用阶段', '三段');
INSERT INTO `color` VALUES ('纸尿裤', '颜色', '通用');

-- ----------------------------
-- Table structure for fenlei
-- ----------------------------
DROP TABLE IF EXISTS `fenlei`;
CREATE TABLE `fenlei` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `imgurl` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fenlei
-- ----------------------------
INSERT INTO `fenlei` VALUES ('1', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('2', '热销分类', 'images/class_02.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('3', '热销分类', 'images/class_04.jpg', '奶粉');
INSERT INTO `fenlei` VALUES ('4', '热销分类', 'images/class_05.jpg', '套装');
INSERT INTO `fenlei` VALUES ('5', '热销分类', 'images/class_06.jpg', '鞋包配饰');
INSERT INTO `fenlei` VALUES ('6', '儿童服饰', 'images/class_11.jpg', '套装');
INSERT INTO `fenlei` VALUES ('7', '儿童服饰', 'images/class_12.jpg', '外套');
INSERT INTO `fenlei` VALUES ('8', '儿童服饰', 'images/class_13.jpg', '外套');
INSERT INTO `fenlei` VALUES ('9', '儿童服饰', 'images/class_14.jpg', '外套');
INSERT INTO `fenlei` VALUES ('10', '儿童服饰', 'images/class_15.jpg', '卫衣');
INSERT INTO `fenlei` VALUES ('11', '儿童服饰', 'images/class_16.jpg', '裤子');
INSERT INTO `fenlei` VALUES ('12', '儿童服饰', 'images/class_17.jpg', '袜子');
INSERT INTO `fenlei` VALUES ('13', '儿童服饰', 'images/class_18.jpg', '休闲裤');
INSERT INTO `fenlei` VALUES ('14', '儿童服饰', 'images/class_19.jpg', '休闲裤');
INSERT INTO `fenlei` VALUES ('15', '婴儿装', 'images/class_21.jpg', '哈衣爬服');
INSERT INTO `fenlei` VALUES ('16', '婴儿装', 'images/class_22.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('17', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('18', '婴儿装', 'images/class_24.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('19', '婴儿装', 'images/class_25.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('20', '婴儿装', 'images/class_26.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('21', '婴童鞋', 'images/class_31.jpg', '学步鞋');
INSERT INTO `fenlei` VALUES ('22', '婴童鞋', 'images/class_32.jpg', '单鞋');
INSERT INTO `fenlei` VALUES ('23', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('24', '婴童鞋', 'images/class_34.jpg', '机能鞋');
INSERT INTO `fenlei` VALUES ('25', '婴童鞋', 'images/class_35.jpg', '机能鞋');
INSERT INTO `fenlei` VALUES ('26', '婴童鞋', 'images/class_36.jpg', '休闲鞋');
INSERT INTO `fenlei` VALUES ('27', '婴童鞋', 'images/class_37.jpg', '休闲鞋');
INSERT INTO `fenlei` VALUES ('28', '婴童鞋', 'images/class_38.jpg', '休闲鞋');
INSERT INTO `fenlei` VALUES ('29', '奶粉辅食', 'images/class_41.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('30', '奶粉辅食', 'images/class_42.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('31', '奶粉辅食', 'images/class_43.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('32', '奶粉辅食', 'images/class_44.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('33', '奶粉辅食', 'images/class_45.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('34', '奶粉辅食', 'images/class_46.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('35', '奶粉辅食', 'images/class_47.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('36', '奶粉辅食', 'images/class_48.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('37', '纸尿裤', 'images/class_51.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('38', '纸尿裤', 'images/class_52.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('39', '纸尿裤', 'images/class_53.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('40', '纸尿裤', 'images/class_54.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('41', '纸尿裤', 'images/class_55.jpg', '帮宝适');
INSERT INTO `fenlei` VALUES ('42', '纸尿裤', 'images/class_56.jpg', '帮宝适');
INSERT INTO `fenlei` VALUES ('43', '纸尿裤', 'images/class_57.jpg', '帮宝适');
INSERT INTO `fenlei` VALUES ('44', '纸尿裤', 'images/class_58.jpg', '帮宝适');
INSERT INTO `fenlei` VALUES ('45', '纸尿裤', 'images/class_59.jpg', '帮宝适');
INSERT INTO `fenlei` VALUES ('46', '哺育喂养', 'images/class_61.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('47', '哺育喂养', 'images/class_62.jpg', '奶嘴');
INSERT INTO `fenlei` VALUES ('48', '洗护清洁', 'images/class_71.jpg', '湿巾');
INSERT INTO `fenlei` VALUES ('49', '洗护清洁', 'images/class_72.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('50', '洗护清洁', 'images/class_73.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('51', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('52', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('53', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('54', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('55', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('56', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('57', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('58', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('59', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('60', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('61', '热销分类', 'images/class_01.jpg', '纸尿裤');
INSERT INTO `fenlei` VALUES ('62', '儿童服饰', 'images/class_14.jpg', '外套');
INSERT INTO `fenlei` VALUES ('63', '儿童服饰', 'images/class_14.jpg', '外套');
INSERT INTO `fenlei` VALUES ('64', '儿童服饰', 'images/class_14.jpg', '外套');
INSERT INTO `fenlei` VALUES ('65', '儿童服饰', 'images/class_14.jpg', '外套');
INSERT INTO `fenlei` VALUES ('66', '儿童服饰', 'images/class_15.jpg', '卫衣');
INSERT INTO `fenlei` VALUES ('67', '儿童服饰', 'images/class_15.jpg', '卫衣');
INSERT INTO `fenlei` VALUES ('68', '儿童服饰', 'images/class_15.jpg', '卫衣');
INSERT INTO `fenlei` VALUES ('71', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('72', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('73', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('74', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('75', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('76', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('77', '婴儿装', 'images/class_23.jpg', '婴儿外套');
INSERT INTO `fenlei` VALUES ('78', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('79', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('80', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('81', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('82', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('83', '奶粉辅食', 'images/class_43.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('84', '奶粉辅食', 'images/class_43.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('85', '奶粉辅食', 'images/class_43.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('86', '奶粉辅食', 'images/class_43.jpg', '婴儿奶粉');
INSERT INTO `fenlei` VALUES ('87', '纸尿裤', 'images/class_53.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('88', '纸尿裤', 'images/class_53.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('89', '纸尿裤', 'images/class_53.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('90', '纸尿裤', 'images/class_53.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('91', '纸尿裤', 'images/class_53.jpg', '拉拉裤');
INSERT INTO `fenlei` VALUES ('92', '哺育喂养', 'images/class_61.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('93', '哺育喂养', 'images/class_61.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('94', '哺育喂养', 'images/class_61.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('95', '哺育喂养', 'images/class_61.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('96', '哺育喂养', 'images/class_61.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('97', '哺育喂养', 'images/class_61.jpg', '奶瓶');
INSERT INTO `fenlei` VALUES ('98', '洗护清洁', 'images/class_72.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('99', '洗护清洁', 'images/class_72.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('100', '洗护清洁', 'images/class_72.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('101', '洗护清洁', 'images/class_72.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('102', '洗护清洁', 'images/class_72.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('103', '洗护清洁', 'images/class_72.jpg', '衣物清洁');
INSERT INTO `fenlei` VALUES ('104', '婴儿装', 'images/class_21.jpg', '哈衣爬服');
INSERT INTO `fenlei` VALUES ('105', '婴儿装', 'images/class_21.jpg', '哈衣爬服');
INSERT INTO `fenlei` VALUES ('106', '婴儿装', 'images/class_21.jpg', '哈衣爬服');
INSERT INTO `fenlei` VALUES ('107', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('108', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('109', '婴童鞋', 'images/class_33.jpg', '运动鞋');
INSERT INTO `fenlei` VALUES ('110', '哺育喂养', 'images/class_62.jpg', '奶嘴');
INSERT INTO `fenlei` VALUES ('111', '哺育喂养', 'images/class_62.jpg', '奶嘴');
INSERT INTO `fenlei` VALUES ('112', '哺育喂养', 'images/class_62.jpg', '奶嘴');
INSERT INTO `fenlei` VALUES ('113', '哺育喂养', 'images/class_62.jpg', '奶嘴');
INSERT INTO `fenlei` VALUES ('114', '哺育喂养', 'images/class_62.jpg', '奶嘴');
INSERT INTO `fenlei` VALUES ('115', '洗护清洁', 'images/class_71.jpg', '湿巾');
INSERT INTO `fenlei` VALUES ('116', '洗护清洁', 'images/class_71.jpg', '湿巾');
INSERT INTO `fenlei` VALUES ('117', '洗护清洁', 'images/class_71.jpg', '湿巾');
INSERT INTO `fenlei` VALUES ('118', '哺育喂养', 'images/class_71.jpg', '湿巾');
INSERT INTO `fenlei` VALUES ('119', '洗护清洁', 'images/class_71.jpg', '湿巾');
INSERT INTO `fenlei` VALUES ('120', '哺育喂养', 'images/class_62.jpg', '奶嘴');
INSERT INTO `fenlei` VALUES ('121', '洗护清洁', 'images/class_71.jpg', '湿巾');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `imgurl` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `zhekou` decimal(10,0) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '十支装植物香薰护手霜', 'images/goods01.jpg', '59.00', '2018-10-21 23:08:22', '2', '美妆');
INSERT INTO `goods` VALUES ('2', '冬季爆款 销量第一 超萌加厚套装', 'images/goods02.jpg', '169.00', '2018-10-21 23:10:44', '3', '童装');
INSERT INTO `goods` VALUES ('3', '伊利 畅意 100 乳酸菌饮品', 'images/goods03.jpg', '79.00', '2018-10-21 23:12:04', '4', '美食');
INSERT INTO `goods` VALUES ('4', '加绒加厚 童森童吗保暖三件套', 'images/goods04.jpg', '299.00', '2018-10-21 23:13:31', '5', '童装');
INSERT INTO `goods` VALUES ('5', '婴儿纯棉连体秋冬宝宝保暖棉服', 'images/goods05.jpg', '299.00', '2018-10-21 23:14:53', '2', '母婴');
INSERT INTO `goods` VALUES ('6', '两套四件装婴儿长袖冬款宝宝套装', 'images/goods06.jpg', '399.00', '2018-10-21 23:16:13', '1', '童装');
INSERT INTO `goods` VALUES ('7', '两套四件装婴儿夹棉加厚保暖套装', 'images/goods07.jpg', '299.00', '2018-10-21 23:17:58', '6', '童装');
INSERT INTO `goods` VALUES ('8', '女童秋冬装中大儿童呢子连帽', 'images/goods08.jpg', '500.00', '2018-10-21 23:19:07', '3', '童装');
INSERT INTO `goods` VALUES ('9', '5双装棉袜儿童袜子纯棉春秋冬宝宝0-1-3-5-7-9-12岁10男童女童中筒婴', 'images/goods09.jpg', '300.00', '2018-10-21 23:20:17', '1', '童装');
INSERT INTO `goods` VALUES ('10', '萌祖驾到女童套装 2018新款秋装儿童韩版兔耳连帽长袖卫衣+裤子洋气两件套潮', 'images/goods10.jpg', '200.00', '2018-10-21 23:21:48', '3', '童装');
INSERT INTO `goods` VALUES ('11', '女童春秋新款单层风衣 韩版公主宝宝儿童秋季中小童童装秋装2018', 'images/goods11.jpg', '330.00', '2018-10-21 23:22:43', '5', '童装');
INSERT INTO `goods` VALUES ('12', '唯朵小妈童装女童两面穿风衣秋冬装儿童中长款加厚保暖外套中大童连帽开衫女孩洋气棉衣', 'images/goods12.jpg', '200.00', '2018-10-21 23:23:30', '3', '童装');
INSERT INTO `goods` VALUES ('13', '【南极人】纯棉睡衣女秋冬保暖内衣长袖新款圆领韩套头纯色家居服睡衣套装', 'images/goods13.jpg', '300.00', '2018-10-21 23:24:42', '6', '女装');
INSERT INTO `goods` VALUES ('14', '法依婷儿童袜子宝宝冬季纯棉袜男童女童中筒袜婴儿袜子3-7-9-12岁五双礼盒装', 'images/goods14.jpg', '100.00', '2018-10-21 23:25:24', '2', '童装');
INSERT INTO `goods` VALUES ('15', '2-15岁儿童内衣套装纯棉男童装女童秋衣秋裤宝宝男女孩小孩薄款保暖内衣套装棉毛衫', 'images/goods15.jpg', '360.00', '2018-10-21 23:32:58', '6', '童装');
INSERT INTO `goods` VALUES ('16', '【10月21日开抢，9.9元两条，不退不换】南极人超值儿童裤子福袋大礼包', 'images/goods16.jpg', '20.00', '2018-10-21 23:33:02', '8', '居家');
INSERT INTO `goods` VALUES ('17', '女童加绒加厚卫衣2018新款秋冬季中大童外套韩版洋气保暖拉链带帽子上衣', 'images/goods17.jpg', '199.00', '2018-10-21 23:33:05', '5', '童装');
INSERT INTO `goods` VALUES ('18', '秋冬新款儿童羽绒棉服轻薄款外套', 'images/goods18.jpg', '99.00', '2018-10-21 23:33:10', '6', '童装');
INSERT INTO `goods` VALUES ('19', '新款宝宝小童男童女童儿童装羽绒棉服轻薄款婴幼童棉服儿童羽绒服（建议拍大一码）', 'images/goods19.jpg', '130.00', '2018-10-21 23:33:15', '5', '童装');
INSERT INTO `goods` VALUES ('20', '萌祖驾到女童裤子2018新款秋装中大童洋气休闲绒裤儿童秋冬季百搭小脚长裤', 'images/goods20.jpg', '199.00', '2018-10-21 23:33:23', '6', '童装');
INSERT INTO `goods` VALUES ('21', '可爱卡通小宝宝小童居家服浴袍', 'images/goods21.jpg', '180.00', '2018-10-21 23:33:28', '3', '童装');
INSERT INTO `goods` VALUES ('22', '【热销30000+彩棉套装】童有所衣秋季婴儿装纯棉高腰内衣套装儿童装秋衣秋裤', 'images/goods22.jpg', '190.00', '2018-10-21 23:43:23', '3', '童装');
INSERT INTO `goods` VALUES ('23', 'LOVE BABE 【加绒款】冬装爆款男女童纯棉卫衣休闲百搭中小童加厚保暖上衣可爱佩奇卡通图案绒衫儿童新款套头衫', 'images/goods23.jpg', '150.00', '2018-10-21 23:43:27', '3', '童装');
INSERT INTO `goods` VALUES ('24', '【4条装】女童内裤纯棉中小大童平角宝宝内裤女孩短裤1/3/5/7/9岁儿童三角内裤女童底裤短裤头', 'images/goods24.jpg', '100.00', '2018-10-21 23:43:30', '2', '童装');
INSERT INTO `goods` VALUES ('25', '恩恩熊女童外套春秋2018新款韩版潮公主秋装长袖1岁3儿童上衣女宝宝开衫', 'images/goods25.jpg', '500.00', '2018-10-21 23:43:12', '8', '童装');
INSERT INTO `goods` VALUES ('26', '【两套减1元】新款儿童内衣套装春秋婴儿纯棉秋衣秋裤宝宝彩棉睡衣男童女童内衣童装', 'images/goods26.jpg', '300.00', '2018-10-21 23:53:16', '2', '童装');
INSERT INTO `goods` VALUES ('27', 'LOVE BABE 【加绒款】冬装新款男女童纯棉卫衣加绒加厚保暖舒适套头衫上衣', 'images/goods27.jpg', '199.00', '2018-10-21 23:53:20', '3', '童装');
INSERT INTO `goods` VALUES ('28', '快乐嘀嗒 （二件）春秋冬婴儿马甲男女宝保暖棉背心0-6-12-18个', 'images/goods28.jpg', '99.00', '2018-10-21 23:53:24', '3', '童装');
INSERT INTO `goods` VALUES ('29', '桂诗兰宝宝儿童内裤女童纯棉三角平角宝宝小女孩内衣裤短裤头4条装', 'images/goods29.jpg', '99.00', '2018-10-21 23:53:30', '2', '童装 ');
INSERT INTO `goods` VALUES ('30', '迅焱童装男童时尚毛毛衣外套2018新款长袖童装中小童加绒加厚保暖衣', 'images/goods30.jpg', '299.00', '2018-10-21 23:53:41', '6', '童装');
INSERT INTO `goods` VALUES ('31', '巴布豆童鞋运动鞋男童贝壳头 2018春秋季新款1-7岁男女童鞋夏季单网贝壳头童鞋', 'images/goods31.jpg', '299.00', '2018-10-21 23:54:21', '5', '童鞋');
INSERT INTO `goods` VALUES ('32', '史努比童鞋男女孩潮流休闲跑步鞋', 'images/goods32.jpg', '199.00', '2018-10-21 23:59:54', '5', '童鞋');
INSERT INTO `goods` VALUES ('33', '巴布豆/BOBDOG童鞋2018秋季新款中轻便舒适大童休闲鞋男童时尚悟道板鞋', 'images/goods33.jpg', '99.00', '2018-10-21 23:59:57', '5', '童鞋');
INSERT INTO `goods` VALUES ('34', '史努比童鞋男童春秋舒适透气儿童跑步鞋', 'images/goods34.jpg', '99.00', '2018-10-21 23:57:28', '5', '童鞋');
INSERT INTO `goods` VALUES ('35', '回力男童板鞋2018新款韩版休闲鞋秋季透气鞋子女童单鞋运动鞋', 'images/goods35.jpg', '188.00', '2018-10-22 00:00:05', '3', '童鞋');
INSERT INTO `goods` VALUES ('36', '双星童鞋儿童板鞋男童休闲鞋女童运动鞋25-37码', 'images/goods36.jpg', '190.00', '2018-10-22 00:00:12', '6', '童鞋');
INSERT INTO `goods` VALUES ('37', '史努比童鞋男童新款透气休闲跑步鞋', 'images/goods37.jpg', '160.00', '2018-10-22 00:00:17', '5', '童鞋');
INSERT INTO `goods` VALUES ('38', 'B.Dcuk小黄鸭童鞋新款儿童运动鞋男休闲跑步鞋', 'images/goods38.jpg', '199.00', '2018-10-22 00:00:21', '8', '童鞋');
INSERT INTO `goods` VALUES ('39', '回力男童板鞋2018新款韩版休闲鞋秋季透气鞋子女童单鞋运动鞋', 'images/goods39.jpg', '199.00', '2018-10-22 00:03:48', '5', '童鞋');
INSERT INTO `goods` VALUES ('40', 'abckids童鞋春秋季新品男童运动鞋中小童透气儿童跑步鞋男孩休闲鞋', 'images/goods40.jpg', '199.00', '2018-10-22 00:04:49', '8', '童鞋');
INSERT INTO `goods` VALUES ('41', '【已抢4.2万件、10包/30包可选】植护本色四层抽纸*30包整箱装卫生纸抽纸', 'images/goods41.jpg', '69.00', '2018-10-23 20:32:33', '3', '居家');
INSERT INTO `goods` VALUES ('42', '【四条装】禧诺纯棉毛巾四条装 全棉加厚成人毛巾 超值家庭组合', 'images/goods42.jpg', '98.00', '2018-10-23 20:32:36', '2', '居家');
INSERT INTO `goods` VALUES ('43', '【已抢18万件】植护无芯4层卷纸70/g*10/20/30/36卷卫生纸抽纸', 'images/goods43.jpg', '88.00', '2018-10-23 20:32:38', '3', '居家');
INSERT INTO `goods` VALUES ('44', '【40卷】柔之选纸巾本色无芯卷纸家用卫生纸厕纸', 'images/goods44.jpg', '59.00', '2018-10-23 20:32:41', '5', '居家');
INSERT INTO `goods` VALUES ('45', '佳益原浆抽纸36包三层加厚整箱家庭装卫生纸不漂白面巾纸宝宝母婴适用餐巾纸擦手纸', 'images/goods45.jpg', '99.00', '2018-10-23 20:32:49', '3', '居家');
INSERT INTO `goods` VALUES ('46', '【裸价直降】新美素佳儿幼儿奶粉 3段 900g*1罐（1-3岁）', 'images/goods46.jpg', '199.00', '2018-10-22 00:15:07', '8', '奶粉');
INSERT INTO `goods` VALUES ('47', '荷兰牛栏婴儿奶粉4段 800g*3（1-2岁）', 'images/goods47.jpg', '890.00', '2018-10-22 00:16:20', '4', '奶粉');
INSERT INTO `goods` VALUES ('48', '荷兰牛栏婴儿奶粉5段 800g*3 （2岁以上）', 'images/goods48.jpg', '660.00', '2018-10-22 00:22:58', '5', '奶粉');
INSERT INTO `goods` VALUES ('49', '【裸价直降】新美素佳儿奶粉1段/2段/3段/4段单罐', 'images/goods49.jpg', '680.00', '2018-10-22 00:23:02', '5', '奶粉');
INSERT INTO `goods` VALUES ('50', '德国爱他美奶粉2+段600g*4（2岁以上)', 'images/goods50.jpg', '780.00', '2018-10-22 00:18:38', '6', '奶粉');
INSERT INTO `goods` VALUES ('51', '原装进口荷兰版3段幼儿配方奶粉 800g*1罐', 'images/goods51.jpg', '880.00', '2018-10-22 00:23:12', '8', '奶粉');
INSERT INTO `goods` VALUES ('52', '德国爱他美奶粉1+段600g*4（1-2岁）', 'images/goods52.jpg', '990.00', '2018-10-22 00:23:16', '6', '奶粉');
INSERT INTO `goods` VALUES ('53', '德国喜宝益生菌奶粉2+段 600g*3（2岁以上）', 'images/goods53.jpg', '880.00', '2018-10-22 00:23:19', '8', '奶粉');
INSERT INTO `goods` VALUES ('54', '贝因美 菁爱幼儿配方奶粉 3段 1000g*1罐（1-3岁）', 'images/goods54.jpg', '680.00', '2018-10-22 00:23:23', '6', '奶粉');
INSERT INTO `goods` VALUES ('55', '荷兰牛栏婴儿奶粉6段 400g*3（3岁以上）', 'images/goods55.jpg', '799.00', '2018-10-22 00:23:27', '8', '奶粉');
INSERT INTO `goods` VALUES ('56', '英国牛栏奶粉3段 900g*3 （1-2岁）', 'images/goods56.jpg', '899.00', '2018-10-22 00:23:31', '6', '奶粉');
INSERT INTO `goods` VALUES ('57', '德国爱他美奶粉3段800g*3（9-12个月）', 'images/goods57.jpg', '799.00', '2018-10-22 00:24:28', '8', '奶粉');
INSERT INTO `goods` VALUES ('58', '英国爱他美奶粉3段900g*3（1-2岁）', 'images/goods58.jpg', '999.00', '2018-10-22 00:24:22', '8', '奶粉');
INSERT INTO `goods` VALUES ('59', '【官方直采】帮宝适拉拉裤XL108片 超薄干爽 成长裤', 'images/goods59.jpg', '299.00', '2018-10-22 00:33:53', '6', '纸尿裤');
INSERT INTO `goods` VALUES ('60', '爽然超薄干爽纸尿裤S108片/M96/L87/XL78片', 'images/goods60.jpg', '888.00', '2018-10-22 00:40:21', '6', '纸尿裤');
INSERT INTO `goods` VALUES ('61', '【官方直采】帮宝适超薄干爽纸尿裤L164片【9-14kg】尿不湿', 'images/goods61.jpg', '666.00', '2018-10-22 00:37:11', '5', '纸尿裤');
INSERT INTO `goods` VALUES ('62', '爽然超薄干爽纸尿裤S108片/M96/L87/XL78片', 'images/goods62.jpg', '599.00', '2018-10-22 00:40:25', '3', '纸尿裤');
INSERT INTO `goods` VALUES ('63', '【官方直采】帮宝适超薄干爽纸尿裤L164片【9-14kg】尿爽然 超柔瞬吸银装纸尿裤S84/M76/L68/XL60片湿', 'images/goods63.jpg', '399.00', '2018-10-22 00:40:51', '3', '纸尿裤');
INSERT INTO `goods` VALUES ('64', '【官方直采】帮宝适超薄干爽纸尿裤L164片【9-14kg】尿不湿', 'images/goods64.jpg', '499.00', '2018-10-22 00:37:34', '6', '纸尿裤');
INSERT INTO `goods` VALUES ('65', 'Merries/花王 > 花王纸尿裤L54 4包装（9-14KG）', 'images/goods65.jpg', '399.00', '2018-10-22 00:38:09', '5', '纸尿裤');
INSERT INTO `goods` VALUES ('66', 'Merries/花王 > 花王纸尿裤L54 4包装（9-14KG）Merries/花王 > 花王拉拉裤 XL44（12-22KG） 【4包装】', 'images/goods66.jpg', '299.00', '2018-10-22 00:41:18', '8', '纸尿裤');
INSERT INTO `goods` VALUES ('67', '好奇金装成长裤拉拉裤加大号XL72片（男女通用) 新老包装随机发货', 'images/goods67.jpg', '299.00', '2018-10-22 00:39:16', '6', '纸尿裤');
INSERT INTO `goods` VALUES ('68', '【官方直采】帮宝适拉拉裤XL108片【12-22kg】超薄干爽 成长裤', 'images/goods68.jpg', '599.00', '2018-10-22 00:39:53', '2', '纸尿裤');
INSERT INTO `goods` VALUES ('69', '【南极人】睡衣情侣纯棉秋冬女保暖内衣长袖长裤男家居服套装', 'images/goods69.jpg', '688.00', '2018-10-22 00:54:58', '6', '女装');
INSERT INTO `goods` VALUES ('70', '【5双装】5双秋冬加厚保暖袜子加厚袜子女士加绒加厚中筒袜秋冬季厚袜子孕妇袜月子袜', 'images/goods70.jpg', '699.00', '2018-10-22 00:55:03', '5', '女装');
INSERT INTO `goods` VALUES ('71', '慕百合【4条装】日系无痕内裤女士纯棉裆性感中腰大码女内裤提臀收腹舒适三角裤', 'images/goods71.jpg', '599.00', '2018-10-22 00:55:09', '8', '女装');
INSERT INTO `goods` VALUES ('72', '【浪莎正品】秋冬季加绒牛仔裤女2018新款韩版显瘦高腰弹力加厚保暖小脚长裤子', 'images/goods72.jpg', '399.00', '2018-10-22 00:55:15', '5', '女装');
INSERT INTO `goods` VALUES ('73', '【浪莎正品】加绒松紧腰牛仔裤女小脚2018春秋冬新款高腰韩版显瘦胖mm大码裤子', 'images/goods73.jpg', '399.00', '2018-10-22 00:55:21', '6', '女装');
INSERT INTO `goods` VALUES ('74', '【浪莎正品】秋冬季2018新款加绒牛仔裤女长裤韩版高腰加绒加厚保暖小脚铅笔裤', 'images/goods74.jpg', '299.00', '2018-10-22 00:55:27', '8', '女装');
INSERT INTO `goods` VALUES ('75', '毛呢哈伦裤女秋冬宽松韩版小脚裤2018新款加厚呢子休闲裤显瘦大码高腰萝卜裤', 'images/goods75.jpg', '699.00', '2018-10-22 00:55:32', '5', '女装');
INSERT INTO `goods` VALUES ('76', '初愫秋冬新款220g加绒加厚显瘦连裤袜可外穿打底裤踩脚裤', 'images/goods76.jpg', '599.00', '2018-10-22 00:55:38', '5', '女装');
INSERT INTO `goods` VALUES ('77', '南极人2018新款打底裤女九分铅笔小脚高腰黑色裤子女外穿薄款春秋', 'images/goods77.jpg', '399.00', '2018-10-22 00:55:42', '6', '女装');
INSERT INTO `goods` VALUES ('78', '2018秋装新款网红毛衣女套头中长款收腰显瘦长袖打底针织衫连衣裙', 'images/goods78.jpg', '299.00', '2018-10-22 00:55:47', '8', '女装');
INSERT INTO `goods` VALUES ('79', '外搭毛衣女外套2018早春新款韩版宽松长袖中长款针织衫女开衫大码', 'images/goods79.jpg', '899.00', '2018-10-22 00:55:53', '5', '女装');
INSERT INTO `goods` VALUES ('80', '2018春秋新款韩版宽松纯色绣花针织衫半高领打底衫套头上衣女毛衣', 'images/goods80.jpg', '899.00', '2018-10-22 00:55:57', '3', '女装');
INSERT INTO `goods` VALUES ('81', '2018春秋新款韩版宽松纯色绣花针织衫半高领打底衫套头上衣女毛衣', 'images/goods81.jpg', '399.00', '2018-10-22 01:06:55', '3', '女装');
INSERT INTO `goods` VALUES ('82', '雅彩娜 加绒加厚2018冬季新款宽松长袖字母上衣女时尚百搭连帽保暖卫衣女', 'images/goods82.jpg', '299.00', '2018-10-22 01:05:52', '6', '女装');
INSERT INTO `goods` VALUES ('83', '2018秋装新款网红毛衣女套头中长款收腰显瘦长袖打底针织衫连衣裙搭连帽保暖卫衣女', 'images/goods83.jpg', '399.00', '2018-10-22 01:07:00', '6', '女装');
INSERT INTO `goods` VALUES ('84', '俞兆林正品【决明子枕芯一对】超值2只装 定型决明子薰衣草荞麦枕芯单人枕头 【可水洗】纤维枕头 舒适保健枕48*74cm', 'images/goods84.jpg', '200.00', '2018-10-23 20:20:33', '3', '居家');
INSERT INTO `goods` VALUES ('85', '【2双装】泰蜜熊简约珊瑚绒情侣款厚底防滑棉拖鞋居家男女保暖冬季棉拖', 'images/goods85.jpg', '199.00', '2018-10-23 20:21:53', '2', '居家');
INSERT INTO `goods` VALUES ('86', '【买就送芝士蒸蛋糕 品牌直降】冠达阳光果粒菠萝夹心口袋面包 日期新鲜 买一送一', 'images/goods86.jpg', '100.00', '2018-10-23 20:23:51', '3', '美食');
INSERT INTO `goods` VALUES ('87', '朵艾微2018秋季新款运动鞋女鞋休闲款短靴女厚底松糕鞋原宿ulzzang鞋子女款', 'images/goods87.jpg', '199.00', '2018-10-23 20:31:15', '2', '童鞋');
INSERT INTO `goods` VALUES ('88', '德曼霖双肩包女新款旅行包大容量妈咪包防盗背包简约大容量书包潮离家出走包', 'images/goods88.jpg', '100.00', '2018-10-23 20:31:27', '3', '童鞋');

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `type` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('美妆', '100克', '净含量');
INSERT INTO `size` VALUES ('童装', '90', '尺码');
INSERT INTO `size` VALUES ('童装', '100', '尺码');
INSERT INTO `size` VALUES ('童装', '110', '尺码');
INSERT INTO `size` VALUES ('童装', '130', '尺码');
INSERT INTO `size` VALUES ('童装', '120', '尺码');
INSERT INTO `size` VALUES ('童装', '140', '尺码');
INSERT INTO `size` VALUES ('童装', '150', '尺码');
INSERT INTO `size` VALUES ('美食', '1000克', '净含量');
INSERT INTO `size` VALUES ('母婴', 'M码', '尺码');
INSERT INTO `size` VALUES ('女装', 'M', '尺码');
INSERT INTO `size` VALUES ('女装', 'L', '尺码');
INSERT INTO `size` VALUES ('女装', 'XL', '尺码');
INSERT INTO `size` VALUES ('女装', 'XXL', '尺码');
INSERT INTO `size` VALUES ('居家', '一箱', '规格');
INSERT INTO `size` VALUES ('童鞋', '26', '尺码');
INSERT INTO `size` VALUES ('童鞋', '27', '尺码');
INSERT INTO `size` VALUES ('童鞋', '28', '尺码');
INSERT INTO `size` VALUES ('奶粉', '800g', '净含量');
INSERT INTO `size` VALUES ('纸尿裤', '小号(S)', '规格');
INSERT INTO `size` VALUES ('纸尿裤', '中号(M)', '规格');
INSERT INTO `size` VALUES ('纸尿裤', '大号(L)', '规格');

-- ----------------------------
-- Table structure for typename
-- ----------------------------
DROP TABLE IF EXISTS `typename`;
CREATE TABLE `typename` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typename
-- ----------------------------
INSERT INTO `typename` VALUES ('1', '热销分类');
INSERT INTO `typename` VALUES ('2', '儿童服饰');
INSERT INTO `typename` VALUES ('3', '婴儿装');
INSERT INTO `typename` VALUES ('4', '婴童鞋');
INSERT INTO `typename` VALUES ('5', '奶粉辅食');
INSERT INTO `typename` VALUES ('6', '纸尿裤');
INSERT INTO `typename` VALUES ('7', '哺育喂养');
INSERT INTO `typename` VALUES ('8', '洗护清洁');
SET FOREIGN_KEY_CHECKS=1;
