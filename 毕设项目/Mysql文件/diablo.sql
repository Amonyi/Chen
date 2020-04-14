/*
Navicat MySQL Data Transfer

Source Server         : chen
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : diablo

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-04-13 17:52:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blue_stickers
-- ----------------------------
DROP TABLE IF EXISTS `blue_stickers`;
CREATE TABLE `blue_stickers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blue_stickers
-- ----------------------------
INSERT INTO `blue_stickers` VALUES ('1', '蓝贴：并未改变大秘境密度以适应19赛季BUFF', '19赛季的独有BUFF“喧嚣杀意”对奈非天的战斗的帮助非常大，而触发它需要我们击杀一定数量的怪物，但是我们不会对大秘境中的怪物进行改动以方便玩家们触发这个BUFF。', '2020-01-05 19:44:55');
INSERT INTO `blue_stickers` VALUES ('2', '社区经理最爱军阵 大秘境千杀菠萝不掉战利品', '斗阵玩法是我最喜欢的玩法之一，我最喜欢它的弓箭手符文，那些 piupiupiu 射箭的萨卡兰姆士兵让我非常满意。你还喜欢什么非主流的BD构筑？我想多看一些你觉得有趣的技能以及传奇装备搭配，即使他们看起来在推进中没有竞争力。', '2020-01-07 19:45:11');
INSERT INTO `blue_stickers` VALUES ('3', '蓝贴：2.6.8PTR加紧筹备中，相关博客即将发布', '博客的发布正在进行中，我在新年假期前已经完成了大部分的文章，回来后做了一些润色，现在它必须经过多阶段的发布准备：与我们的开发团队一起验证文本的准确性和语调（现在已经进行到了这里），与我们的编辑团队一起检查语法和润色，交付给我们的本地化团队，然后翻译成我们所支持的所有语言，接着重新分发给我们所有的区域社区经理进行格式化和发布。还有一些项目的创作和审查是同步进行的，比如标题和缩略图或博客中的任何图片，所有这些都遵循类似的结构。除非出现任何不可预见的情况，否则它应该在2.6.8 PTR发布之前发布。', '2020-01-08 19:45:26');
INSERT INTO `blue_stickers` VALUES ('4', '蓝帖：新的一年谈谈未来暗黑起源的期望', '暗黑4正处于非常非常早期的开发阶段。我们之所以提出每季度进度更新，其部分原因是现在也没有很多东西可以给大家分享。所有已经准备好给大家展示的东西，你都在嘉年华上看到了。', '2020-01-09 19:45:52');
INSERT INTO `blue_stickers` VALUES ('5', '黑荆棘套装有机会在未来的赛季得到加强', '在每一个赛季，我们都会权衡所有套装的强度，以及对它们再平衡。这其中我们也收集了大量关于黑荆棘套装的反馈。我们会看看它是否有机会在未来的赛季中大放光彩。P.S.尽量不要在帖子的标题说出我们的名字——我们总是在看所有的帖子，不管你是不是把我的名字放在那儿。', '2020-01-12 19:46:11');
INSERT INTO `blue_stickers` VALUES ('6', '蓝贴：关于本次滥用赛季BUFF处理措施的说明', '首先，利用多人组队时buff的效果进行单人大秘境冲榜，这将被视为作弊。我们根据玩家滥用的严重程度以及账号的历史违规记录，来视情况进行不同时长的封禁。第三，我们将修复此问题，在我们上线修复补丁的同时也提醒大家不要利用此漏洞。', '2020-01-14 19:46:37');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `txttype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('5', '张三', '标题一', '心得');
INSERT INTO `comment` VALUES ('6', '李四', '标题二', '讨论');
INSERT INTO `comment` VALUES ('7', '王五', '标题三', '攻略');
INSERT INTO `comment` VALUES ('8', '佚名', '标题四', '活动');
INSERT INTO `comment` VALUES ('10', '佚名', '标题五', '投票');
INSERT INTO `comment` VALUES ('11', '佚名', '标题六', '艺术');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_tx` varchar(255) DEFAULT NULL,
  `num_tz` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `good_num` int(11) DEFAULT NULL,
  `bad_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('3', '张三', '2020-03-19 15:19:25', '太棒了，正好想找个速刷攻略', 'http://localhost:3000/src/images/rotate_1.png', '5', '3', '5', '0');
INSERT INTO `comments` VALUES ('4', '李四', '2020-03-19 15:21:01', '这攻略写的很清楚详细', 'http://localhost:3000/src/images/rotate_1.png', '3', '3', '6', '0');

-- ----------------------------
-- Table structure for game_data
-- ----------------------------
DROP TABLE IF EXISTS `game_data`;
CREATE TABLE `game_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_data
-- ----------------------------
INSERT INTO `game_data` VALUES ('1', '2.67补丁更新一览');
INSERT INTO `game_data` VALUES ('2', '套装地下城专题');
INSERT INTO `game_data` VALUES ('3', '2.67怪物大全');
INSERT INTO `game_data` VALUES ('4', '游戏机制手册');
INSERT INTO `game_data` VALUES ('5', '武器科普与选择指南');
INSERT INTO `game_data` VALUES ('6', '暗黑起源地图构成解析');
INSERT INTO `game_data` VALUES ('7', '二十赛季前瞻');
INSERT INTO `game_data` VALUES ('8', '传奇宝石特效全解');
INSERT INTO `game_data` VALUES ('9', '暗黑地图学');
INSERT INTO `game_data` VALUES ('10', '装饰道具掉落一览');
INSERT INTO `game_data` VALUES ('11', '传奇宝石升级工具');
INSERT INTO `game_data` VALUES ('12', '速刷地精路线');

-- ----------------------------
-- Table structure for heroism
-- ----------------------------
DROP TABLE IF EXISTS `heroism`;
CREATE TABLE `heroism` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_img_txt` varchar(255) DEFAULT NULL,
  `brief` varchar(5555) DEFAULT NULL,
  `brief_img1` varchar(255) DEFAULT NULL,
  `brief_img2` varchar(255) DEFAULT NULL,
  `brief_img3` varchar(255) DEFAULT NULL,
  `story_txt` varchar(5555) DEFAULT NULL,
  `zb_txt` varchar(255) DEFAULT NULL,
  `zb_img` varchar(255) DEFAULT NULL,
  `zbjz_img` varchar(255) DEFAULT NULL,
  `zbjz_txt` varchar(255) DEFAULT NULL,
  `jntx_img` varchar(255) DEFAULT NULL,
  `jnxq_icon1` varchar(255) DEFAULT NULL,
  `jnxq_icon1_txt` varchar(255) DEFAULT NULL,
  `jnxq_icon2` varchar(255) DEFAULT NULL,
  `jnxq_icon2_txt` varchar(255) DEFAULT NULL,
  `jnxq_icon3` varchar(255) DEFAULT NULL,
  `jnxq_icon3_txt` varchar(255) DEFAULT NULL,
  `jnxq_icon4` varchar(255) DEFAULT NULL,
  `jnxq_icon4_txt` varchar(255) DEFAULT NULL,
  `energy_img` varchar(255) DEFAULT NULL,
  `energy_txt` varchar(5555) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of heroism
-- ----------------------------
INSERT INTO `heroism` VALUES ('1', '野蛮人', '<p>野蛮人是从来不惧怕近身战的野蛮的流浪者。强大的撼地践踏、跳跃攻击和双持横斩让他们的敌人还没挪步就被斩杀成碎块，或让试图临阵脱逃者被顺势砍翻在地</p><p>感谢他们强壮的身体，尽管他们都是用沉重而巨大的武器，野蛮人却可以在近战中通过武器和距离支配一切。野蛮人对战争的威胁一点也不陌生，他们经常要面对数个敌人，给予或得到无数伤口，这比他们试图追杀一个目标要频繁得多。</p><p>野蛮人的攻击主要是以近战为主。他们的武器挥动速度极快，并瞬间削弱敌人的耐力，而他们使用更缓慢却更强大的震地攻击时，足以撼动千军万马并击破强敌厚重的铠甲。</p>', 'http://localhost:3000/src/images/hero-b1.jpg', 'http://localhost:3000/src/images/hero-b2.jpg', 'http://localhost:3000/src/images/hero-b1.jpg', '<p class=\"tit\">“先祖庇护着我”</p><p>数个世纪以来，野蛮人居住在神圣的亚瑞特山脚下，拥有巨大的体型和无法比拟的力量，并将自己锻炼得坚如磐石。他们从出生以来就接受了世代相传的使命：保护神圣的山脉。</p><p>当他们的家园毁灭之后，很多野蛮人失去了信仰，沉溺在过去阴影里，成为了漫无目的、毫无荣誉感的流浪者。</p><p>但并非所有野蛮人都失去了危机感。很多人仍然对亚瑞特山脉充满荣誉感并在附近徘徊。他们在很多城里小孩还喜欢玩具的年龄时就将亲手制作的战斧和长矛送给自己的后代，并让他们铭记曾经的耻辱。这份传承让野蛮人世世代代都遵循着守护亚瑞特山脉的神圣使命！</p>\r\n<p>这些野蛮人在这个不同的世界中努力寻找着心得目标，任何试图阻挡他们前进的人都将被无情的粉碎。</p>', '<p>野蛮人有使用常人所无法使用的武器的力量。他们可以挥动那些常人无法举起的尺寸过大的巨型武器，并运用自如。野蛮人强壮的肌肉也可以双手持有两把武器，比如剑和斧，并同时对敌人施放多种打击效果。</p>', 'http://localhost:3000/src/images/bar-zb.jpg', 'http://localhost:3000/src/images/bar-zb2.png', '<p>在角色外观方面， 初级（左）：早期形态，只给小试身手的野蛮人提供了少量的保护，但这个时候多数敌人的攻击甚至不能伤害到他们的身体。 中级（中）：装备大大改良，此时野蛮人已经可以通过头盔、尖刺铠甲和护甲来保护自己并更好地战斗。 高级（右）：野蛮人的铠甲从外观上看就很厚重，造型对人类来说如同噩梦一般恐怖，这个时候他们对打击有很大的抗性。</p>', 'http://localhost:3000/src/images/ymr-icon.png', 'http://localhost:3000/src/images/bar-jn1.png', '<span class=\"jn-name\">近战大师</span><p>野蛮人可以轻松使用普通战士难以挥动的武器。他们可以使用大剑、锤子甚至双手持斧，甚至可以挥动巨大而笨重的大型武器瞬间将敌人砸成肉泥。</p>', 'http://localhost:3000/src/images/bar-jn2.png', '<span class=\"jn-name\">凶猛进攻</span><p>力量和愤怒是同步攀升的。当他们拥有大量的怒气时，野蛮人可以把他们的敌人打飞上天，把他们的肢体切开，或者将骨头从身体里砸出来。</p>', 'http://localhost:3000/src/images/bar-jn3.png', '<span class=\"jn-name\">呐喊</span><p>他们凶狠的战争吼叫可以让自己和盟友的怒气和斗志迸发，让敌人感到害怕和压抑。再强大的敌人听到野蛮人的怒吼之后都会对他们畏惧三分。</p>', 'http://localhost:3000/src/images/bar-jn4.png', '<span class=\"jn-name\">越战越勇</span><p>没有一个英雄能像野蛮人一样承受敌人的攻击。他们强壮的躯体可以让他们使用巨大的盾牌，而身体可以坚硬到反弹剑砍或牙咬的伤害。</p>', 'http://localhost:3000/src/images/bar-fury.gif', '<p>人物能量：Fury</p><p>愤怒就是野蛮人永远不会枯竭的动力。怒气，由仇恨和战斗欲所充斥的这个能量源，能让野蛮人的每次攻击都是那般致命。</p><p>愤怒在他们受到伤害时或尝到敌人的鲜血时也会提升。野蛮人受到的伤害越多，他们获得的怒气也越多。怒气可以让野蛮人彻底粉碎战场上的一切，暴怒中的野蛮人是最恐怖的，可以瞬间让敌人身首异处。</p><p>在非战斗状态，怒气会很快被缓解，所以野蛮人都会不停地冲锋陷阵并让自己一直保持战斗的欲望。</p>');
INSERT INTO `heroism` VALUES ('2', '猎魔人', '<p>猎魔人是无情的复仇者，任何被盯上的目标都会瞬间被她们从远处狙杀。她们会远离危险，并依靠手里的弓弩、致命的陷阱和弹幕将这个世界一切可憎的生物消灭殆尽。</p><p>对敌人进行带有爆炸物的扫射，从天而降的箭雨和各种爆破的处理方式，猎魔人最擅长的就是消灭成群结队的敌人。猎魔人有着百步穿杨的精准度，可以从远处轻松狙杀强壮的怪物，可以在远处精准地狙击并在有敌人靠近时全身而退。</p><p>但猎魔人更加专注于远程战斗，对近战武器的技术掌握有限，一旦被包围将处于十分危险的局势。翻滚和跳跃，致残和减速这样的逃生技能，如同任何猎人的弓箭一般犀利。</p>', 'http://localhost:3000/src/images/hero-b1.jpg', 'http://localhost:3000/src/images/hero-b2.jpg', 'http://localhost:3000/src/images/hero-b1.jpg', '<p class=\"tit\">“无尽的复仇”</p><p>这些自称为猎魔人的人并非一个人群或国家。她们都是幸存者 -- 或者说是被地狱生物摧毁了过去的躯壳。她们的家园被焚毁，多数人会因此放弃生活 -- 但也会有少数人，安葬死去的人，联合在一起，寻求复仇之路。</p><p>醒来之后，猎魔人们看到的东西其实和梦境差不多。但，现在，她们已经拥有了可以“回敬”的力量！</p><p>她们人数虽少，但猎魔人会追寻恶魔的踪迹到天涯海角，对她们来说哪怕只是拯救多一条生命，世界也会变的更好。</p>', '<p>猎魔人使用多种特殊武器，并用她们擅长的方式战斗。她们是弩专家，装弹和射击速度极快的远程武器，可以让她们把恶魔变成刺猬。同时也擅长双持弩，两把弩可以双倍的速度把她们的敌人送向死亡</p>', 'http://localhost:3000/src/images/dh-zb.jpg', 'http://localhost:3000/src/images/dh-zb2.png', '<p>在角色外观方面， 初级（左）：新入行的猎魔人穿着轻盈、柔软的皮甲来保护她们的手腕和喉咙，用斗篷蒙住面颊。可以遮蔽稍许日光，但这就是她们的着装。 中级（中）：改进后的护甲提供了一些精心制作的甲片包裹身体的要害部位。由于材质经过强化，所以即便是注重实用性的猎魔人也不得不对腿甲和披肩的装饰做出让步。 高级（右）：强壮的护甲包括更结实的帽子，满是尖刺的面甲可以提供更好的视野也能保护住她们的双眼。无数的弓箭和小暗器都可以隐藏在这样一副精密设计的盔甲里。</p>', 'http://localhost:3000/src/images/lmr-icon.png', 'http://localhost:3000/src/images/dh-jn1.png', '<span class=\"jn-name\">远程武器</span><p>猎魔人可以让战场里布满弓箭或者弹幕的痕迹，远处狙击敌人，并有着其他人所无法比拟的精准度。她们擅长的武器包括长弓、手弩、手雷和投掷武器，甚至双持弩。</p>', 'http://localhost:3000/src/images/dh-jn2.png', '<span class=\"jn-name\">暗影魔法</span><p>为了拥有对抗燃烧地狱的势力，猎魔人接受了可疑的魔法。他们可以藏身于暗影之中，让敌人感到恐慌，并突然从暗影中出现猎杀她们的目标。</p>', 'http://localhost:3000/src/images/dh-jn3.png', '<span class=\"jn-name\">陷阱</span><p>猎魔人把敌人吸引到地雷，铁蒺藜或者钢牙陷阱里可以瞬间让它们脆弱下来，并保证可以被猎魔人轻松地击杀。</p>', 'http://localhost:3000/src/images/dh-jn4.png', '<span class=\"jn-name\">战斗战术</span><p>他们会使用致残箭拉开和敌人的距离，或者用流星索缠绕目标，甚至用烟雾弹使自己从包围中逃脱出来。</p>', 'http://localhost:3000/src/images/dhmana.gif', '<p>人物能量：Discipliney</p><p>但凡期待能做出真正的成就的猎魔人都会用另外一种能量源来控制自己的仇恨：戒律值，用来确认和保证自己可以再活下去进行明天的猎杀的根本。</p><p>戒律值对猎魔人来说十分珍贵。而且每一项防御技能都要消耗戒律值 - 给敌人放陷阱，跳跃躲避爪牙的攻击，以及闪避尖刺和箭矢陷阱。</p><p>对猎魔人来说能站在原地，通过箭矢弹幕将怒火倾泻在敌人身上是再好不过的事情了。但如果她们不能依靠戒律来保护自己，猎魔人则很可能成为怪物的盘中餐。</p>');
INSERT INTO `heroism` VALUES ('3', '魔法师', '<p>魔法师放弃了多数魔法使用者所认可的安全的方法，是以自己身体作为奥术能量容器的叛逆的施法者。她们操作任何力量来瓦解、点燃或冻住她们的敌人，她们也可以控制时间和光线来传送、创造强大的幻象和折射攻击。</p><p>法师抓住魔杖和法杖来强化她们不是特别熟练的魔法，将敌人轰杀并同时争取能量和必要的时间来施放更加华丽而具有毁灭性的奥术魔法。</p><p>除了个别例外，魔法师通常都远离危险而保持一定距离。就如同一台活的炮台一样，魔法师非常擅长远距离的攻击。</p>', 'http://localhost:3000/src/images/hero-b1.jpg', 'http://localhost:3000/src/images/hero-b2.jpg', 'http://localhost:3000/src/images/hero-b1.jpg', '<p class=\"tit\">“势不可挡”</p><p>无论是仙赛还是卡迪安，魔法使用者都被以“法师”或“魔术师”冠名，但对比那些被冠上“魔法师”之名的施法者，他们就如同雄狮面前的猫咪一样弱小。虽然两者的共性也仅止于都掌握并使用神秘的奥术能量。</p><p>如果她们可以掌握双刃剑一样的礼物并避免把自己毁灭，那么这些崛起的奥术专家们将能最终看透自己命运的终点。</p><p>她们不仅天资过人而且可以根据自己的意愿或本能随意掌控魔法的力量。</p>', '<p>魔法师可以通过几乎任何物品来作为魔力的引导，但也有几样更加有用。魔法师可以使用魔法宝珠，这是一种副手装备为她们提供视野和知识来辅助她们施法，或者作为能量的容器来使用。魔法师通常会使用传统的（带有附魔的）法杖，这些短小的棍子是引导她们的奥术能量用于杀伤敌人的最好武器。</p>', 'http://localhost:3000/src/images/wiz-zb.jpg', 'http://localhost:3000/src/images/wiz-zb2.png', '<p>在角色外观方面， 初级（左）：早期的魔法师护甲和卡迪安魔法学院的装束格格不入，而且几乎无法帮助年轻的魔法师们抵御弓箭或者爪牙的伤害。 中级（中）：在战场上获得一定的经验之后根据情况作出了调整，中期的护甲除了包裹在身上便于旅行的装束和飘逸的长袍之外，还有了较为结实的胸甲和保胫。 高级（右）：真正成功的魔法师穿着她们的战利品：仙赛式的飘荡的披风和头冠，只有关键部位才穿戴和士兵一样的金属护甲</p>', 'http://localhost:3000/src/images/fs-icon.png', 'http://localhost:3000/src/images/wid-jn1.png', '<span class=\"jn-name\">范围攻击</span><p>法师的攻击可以同时对大群敌人造成伤害，光束技能可以对靠的越近的敌人造成越多的创伤，而那些在战场上犹豫不决的人会被法师召唤的落石砸瘪。</p>', 'http://localhost:3000/src/images/wid-jn2.png', '<span class=\"jn-name\">保护魔法</span><p>虽然比起其他职业，魔法师在物理上非常脆弱，但他们可以使用防御魔法来保护自己。可以给自己穿上钻石的护甲，或是创造镜像来迷惑敌人。</p>', 'http://localhost:3000/src/images/wid-jn3.png', '<span class=\"jn-name\">元素大师</span><p>魔法师已经完全掌握了庇护所世界的元素之力。火焰、雷电、寒冰和狂风都为她们所掌控，她们可以找出对手的弱点并针对性地攻击。</p>', 'http://localhost:3000/src/images/wid-jn4.png', '<span class=\"jn-name\">无尽能量</span><p>法师很少用光她们的能量。托恢复速度极快的奥术能量之福，她们可以非常随心所欲地施放法术，并随着经验的增长更好地控制着这些力量。</p>', 'http://localhost:3000/src/images/fs.gif', '<p>人物能量：Arcane Power</p><p>魔法师持续地激活着奥术能量 -- 一种恢复速度极快，并看似永远不会枯竭的能量。只有当她们处于危险时大量地施放多种法术时才有可能暂时导致自己能量枯竭。</p><p>这些技能 -- 比如从星空召唤来一颗燃烧的流星，用力量引发旋风斩断敌人的腿，或者可以停止住时间的能量泡等等 -- 强而有力，并值得魔法师们付出小小地等待。</p><p>和那些深思熟虑而小心的施法者不同，魔法师自己就是奥术的导能媒介。让剧烈的能量直接穿过身体，并指引这股能量成为自己躯体的延伸。</p>');
INSERT INTO `heroism` VALUES ('4', '巫医', '<p>巫医是召唤亡灵和邪恶生物来为他们而战的灵魂战士。他们的身边满是僵尸和毒虫，巫医可以随意使用会爆炸的颅骨，流淌酸毒的云雾和可怕的诅咒来攻击他们的敌人。</p><p>受能力的影响，让敌人在被控制中痛苦而缓慢地死去是巫医的拿手好戏。他们可以得心应手地对敌人进行攻击或者诅咒减速，以及群体控制，并用自己饥饿的宠物们将敌人吞噬尽矣。巫医可以在战场上点燃火焰或者放毒，缓慢地吞噬靠近的敌人的生命。</p><p>虽然有些巫医会避免近战以强化他们的宠物和避免敌人近身，他们也有和敌人直接交火的战斗能力。</p>', 'http://localhost:3000/src/images/hero-b1.jpg', 'http://localhost:3000/src/images/hero-b2.jpg', 'http://localhost:3000/src/images/hero-b1.jpg', '<p class=\"tit\">“恶灵助我”</p><p>在乌姆巴鲁部落里只有被选中的男人和女人才能成为巫医。她们必须展示出自己的战绩和控制灵魂的能力才能得此殊荣。只有接受过无形之地 —— 乌姆巴鲁人认为这里是死者的灵魂在离开庇护所之后的居住地 —— 被其触碰之后诞生的孩子才能获得这些后天能力。</p><p>巫医无法遮盖他们的耳朵来阻拦灵魂之音的呐喊。那些声音越来越大时，就决定了他们的命运。他们必须恢复自己的世界和无形之地的平衡，并终身监护这些饱受折磨的灵魂……直到永远。</p>', '<p>巫医可以使用多种武器，他们也有数种特色武器。魔法蛊是副手装备的法宝；除了直接作为武器使用之外，它们可以协助巫医避免错误的黑暗力量…… 并呼唤正确的力量。巫医同样也带着附魔过的仪式匕首。和普通的小刀不同，这些匕首是为活人献祭而专门设计的，所以非常符合它们终结生命的含义。</p>', 'http://localhost:3000/src/images/wy-zb.jpg', 'http://localhost:3000/src/images/wy-zb2.png', '<p>在角色外观方面， 初级（左）：巫医的身上涂满了战绘和布饰来保护身体的关键要害。 中级（中）：有经验的巫医会使用一些强化过的材料来加强防御，包括金属片和造型奇特的面具。 高级（右）：装束完整的巫医通过服装上远古生物的头颅和恐怖的羽毛就能把人吓的半死。厚重的护甲片和结实的护肩使得他们很难被杀死</p>', 'http://localhost:3000/src/images/wy-icon.png', 'http://localhost:3000/src/images/wy-jn1.png', '<span class=\"jn-name\">宠物</span><p>巫医周围有成千上万的奇怪生物 - 亚种生物，僵尸，蝙蝠，傀儡人和蜘蛛等等。很多生物都会在它们的主人身边徘徊，直到死亡为止。</p>', 'http://localhost:3000/src/images/wy-jn2.png', '<span class=\"jn-name\">元素攻击</span><p>巫医可以召唤毁灭性的魔法来群体伤害的毒云，一团满是蝙蝠的火焰和蝗虫群。甚至还能牺牲宠物的身体，产生爆炸的碎片来攻击敌人。</p>', 'http://localhost:3000/src/images/wy-jn3.png', '<span class=\"jn-name\">诅咒妖术</span><p>削弱和减速敌人的妖术可以帮助削弱那些燃烧地狱的爪牙们。巫医有一大堆诅咒的能力，包括下毒和盗取生命的灵魂箭等。</p>', 'http://localhost:3000/src/images/wy-jn4.png', '<span class=\"jn-name\">战场控制</span><p>所有和巫医战斗过的人身体和精神都发生了扭曲，限制了他们在战斗中的能力。来自无形之地的鬼魂触碰了敌人的身体之后会把他们变成小鸡，甚至让他们在精神的打击中落荒而逃。</p>', 'http://localhost:3000/src/images/wy.gif', '<p>人物能量：Mana</p><p>巫医天生就和无形之地有了联系，允许他们从灵魂之井中获得能量，那个能量被叫做法力。</p><p>法力是大量而缓慢再生的资源，巫医必须选择是要释放攻击法术还是要确保他们不会让自己面对敌人时毫无还手之力。</p><p>由于法力回复速度很慢，巫医需要地依靠半永久型召唤物来增加效率，比如召唤的僵尸犬或者恐怖的巨像，同时还能给巫医提供一定保护而不会消耗更多。</p>');
INSERT INTO `heroism` VALUES ('5', '武僧', '<p>武僧是神圣的战士，他们把神力通过强大的意志力转化为他们的武器。不管是治疗、防护真言还是带有神圣之力的攻击，武僧都是信手拈来。</p><p>技巧高超的武僧可以赤手空拳或者使用一系列简单的武器来打出他们迅速的攻击。在实战中，他们注重机动性而非蛮力。他们在战场中进出自如，避免激烈的互殴拖延之战。</p><p>武僧的进攻主要专注于近战攻击。他们可以对单个敌人造成巨大的伤害，也可以使用掌击、腿法带来的元素力量对短距离内的敌人造成范围攻击。</p>', 'http://localhost:3000/src/images/hero-b1.jpg', 'http://localhost:3000/src/images/hero-b2.jpg', 'http://localhost:3000/src/images/hero-b1.jpg', '<p class=\"tit\">“攻无不克”</p><p>来自梵罗达尼的武僧刻苦地训练着他们的身体和意志，期望自己成为伊夫葛洛中最强大的神圣战士。在修道院中，他们忍受着肉体和精神上的双重考验，以此来学习无法比拟的纪律并以此证明他们的专注。</p><p>日积月累的净化帮助武僧拥有了纯净的灵魂，并得以克服那些侵蚀普通人内心的邪恶。在习武的过程中，他们铸就了无人能敌的身体，也修炼出了高于常人的思想境界。他们不但是徒手战斗的大师，也是擅使各种兵器的高人。</p><p>经过了毕生的修行，炼成正果的武僧获得允许，离开修道院去外面执行万神的意愿。他们额头上的符号标志着他们是幸存者、修成者以及社会的基石。</p>', '<p>武僧们的武艺构成通常会采用专门的武器装备。虽然武僧们赤手空拳也能造成巨大伤害，但是他们也可以通过装备拳类兵器诸如拳剑和手里剑等获得提升。武僧也是唯一的经过训练可以使用武杖[daibo]的英雄，那是一种用来敲破头骨并且可以旋转偏转攻击的长条木杖。</p>', 'http://localhost:3000/src/images/monk-zb.jpg', 'http://localhost:3000/src/images/monk-zb2.png', '<p>在角色外观方面， 初级（左）：一开始武僧用的盔甲是素甲，那是拼凑起来并没有太严格的保护自己的装备。它总比赤裸裸的在战场上游荡来的强。。 中级（中）：有经验的武僧可以获得更好的技术，资金和设备，提供给他们的盔甲质量大幅度的提高了，并结合了个人的纹饰以及优良的材料。 高级（右）：然而，即使是如此精细的盔甲与那些拯救生命的英雄们的装束，为提升武僧的迅捷战斗风格而精挑细选，在烈焰，利爪和宝剑的攻击下保护他们的装备相比简直是小巫见大巫。</p>', 'http://localhost:3000/src/images/ws-icon.png', 'http://localhost:3000/src/images/monk-jn1.png', '<span class=\"jn-name\">真言</span><p>戒律的武僧们可以使用他们精神的力量，通过真言的形式释放出来，这是一种持续较长的笼罩力量，能够起到治疗或者增强武僧或者任何附近的友军的作用。</p>', 'http://localhost:3000/src/images/monk-jn2.png', '<span class=\"jn-name\">连击</span><p>武僧的近战攻击在仔细的进行连续进攻时变得更为强力。他们可以获得更多的精神能量，提升输出伤害，并产生独特的效果让一位武僧可以击败任何敌人。</p>', 'http://localhost:3000/src/images/monk-jn3.png', '<span class=\"jn-name\">精神能量</span><p>武僧在连击时，他们将储存了精神能量让他们可以消耗以作出惊人的技巧--迷惑多个敌人，击退一群敌人，或者在近战中向后跃出脱离战斗。</p>', 'http://localhost:3000/src/images/monk-jn4.png', '<span class=\"jn-name\">移动和速度</span><p>武僧们在战场上拥有无可匹敌的战术机动性。任何武僧都能够在敌人之间或周围快速移动，突击敌人的命脉所在，相比其他角色他们更擅长闪躲敌人的攻击。</p>', 'http://localhost:3000/src/images/ws.gif', '<p>人物能量：Spirit</p><p>为了对抗邪恶，武僧依靠自身蓄积的精气，一种与他们个人掌握与训练相关的能量源。</p><p>精气的补充是缓慢的。它的再生有两种方式--由特定的技能和攻击，以及由完整的连击产生。仔细的将攻击连锁起来的武僧们可以几乎无止境的发动增加内力的攻击。</p><p>精气是一种宝贵的资源，不过大量的使用这种能量可以使得武僧们作出强力的躲闪和防御动作，以及屠杀怪物的最后一击。</p>');
INSERT INTO `heroism` VALUES ('6', '圣教军', '<p>圣教军永远捍卫信仰与律令。他们堪称是活生生的堡垒，穿着坚不可摧的盔甲并手持庇御之盾穿越眼前的敌阵，留下恶魔在炙热中闷燃烧尽。</p><p>尽管战火无情，圣教军仍然义无反顾，依靠神圣魔法与坚实护甲来取得胜利。训练有素的圣教军擅长卸除对方的攻击劲道，对于猛烈轰击往往不屑一顾。但危急时，他们也能放弃速度与行动力以酝酿足以承受攻击的无穷后劲。</p><p>足以碎骨的连枷与厚实的盾牌相当适合进行近身作战，但是圣教军杀敌的本事并不局限于这个距离。当这些具有神圣能量的勇士加入战局，也能以熊熊烈焰与眩目强光，惩罚不服从审判的敌人。</p>', 'http://localhost:3000/src/images/hero-b1.jpg', 'http://localhost:3000/src/images/hero-b2.jpg', 'http://localhost:3000/src/images/hero-b1.jpg', '<p class=\"tit\">“圣战的使命在召唤我”</p><p>200年前，高阶教士阿克汉察觉到有股腐败的影响力正在侵蚀教会的信仰核心，于是他派遣侍僧游历各方寻找净化这股邪恶势力的方法。阿克汉所招募的圣教军是一群年轻的信徒，具备荣誉感与美德，精通武器与杀戮魔法。不过，他们最重要的特质是坚定不移的责任感。</p><p>如今，圣教军扩大了净化邪恶这个目标的涵盖范围。过去单纯的「遏止」让邪魔有许多壮大的机会。游历四方的圣教军，往往是师徒一起铲除圣休亚瑞的邪魔。他们有些出于正义而战；有些希望有一天能驱除撒卡兰姆的腐化。当一对圣教军当中的师父死去，弟子便接手师父的武器与身分…圣战的使命永不休止。</p>', '<p>圣教军需要经过特别的训练才能使用其特制的盾，因为这个盾牌的用途，不仅仅是用来抵挡敌人的攻击而已。圣教军能把盾牌像标枪一样投出去，或者直接痛殴对方让他们头晕目眩。圣教军也会挥舞连枷、甩动锁炼上的精钢尖刺施展残酷的连环痛击。经验丰富的圣教军能学会以单手拿起巨大的双手武器，身穿厚实的装备，缓缓踏出脚步进击。</p>', 'http://localhost:3000/src/images/crs-zb.jpg', 'http://localhost:3000/src/images/crs-zb2.png', '<p>在角色外观方面， 初级（左）：早期形态，初出茅庐的圣教军穿着简单的装备游历各方。撒卡兰姆的教徽充分展现圣教军的传统，可是就跟旗帜或战旗一样没有什么保护作用。 中级（中）：经历长时间战场洗礼的圣教军，会为自己装备重甲与精密的护颈来防卫身上易受恶魔攻击的致命部位。 高级（右）：达到传奇境界的圣教军则会穿着巨盔与精心挑选的战袍，从头到脚都犹如铜墙铁壁。圣教军每天都生活在危险之中，他们会依照现实状况调整装备。</p>', 'http://localhost:3000/src/images/sjj-icon.png', 'http://localhost:3000/src/images/crs-jn1.png', '<span class=\"jn-name\">天生的防御者</span><p>他们在战斗中能迫使敌人转而攻击他们来保护盟友。当圣教军遭到围攻时，他们会展现出惊人韧性，因为他们能阻挡攻击并将伤害反击到打破他们坚实防御的敌人身上。</p>', 'http://localhost:3000/src/images/crs-jn2.png', '<span class=\"jn-name\">天堂的愤怒</span><p>圣教军的敌人会受到来自天堂的惩罚。圣教军施放圣怒来歼灭烈焰地狱的爪牙，以雷霆电击、用净化圣火吞噬，或召唤神圣的武器来消灭对方。</p>', 'http://localhost:3000/src/images/crs-jn3.png', '<span class=\"jn-name\">律令</span><p>圣教军浑身散发出英勇果敢与牺牲奉献的精神，当圣教军诵读律令时，可以暂时使他们身上的能量爆发，也可以产生长时间的强化效果，只要有圣教军活着，律令便能一直发挥效果。</p>', 'http://localhost:3000/src/images/crs-jn4.png', '<span class=\"jn-name\">无处可逃</span><p>圣教军能骑着召唤来的坐骑，凭靠跳跃攻击与熟练地在战场上冲锋陷阵，毫不留情地追击敌人。他们能对敌人施展致盲或定身，确保它们逃不过正义的裁决。</p>', 'http://localhost:3000/src/images/wrath.png', '<p>人物能量：Wrath</p><p>圣教军怀着纯粹的目的纵横战场。圣光的支持与圣洁的使命让圣教军得以行使名为圣怒的能量严惩敌人。</p><p>当圣教军准备战斗时，他们的圣怒会缓慢但持续地高涨，等到杀敌的时候爆发出来。充满圣怒的圣教军是危险的对手：他们化身为铜筋铁骨，施展天谴烈焰一举收拾对手；用炽热的光束将敌人四分五裂，而且被击败之后能死而复生。</p><p>圣教军不靠杀死敌人来补充圣怒，他们在许多状况下可以恢复消耗的能量，像是抵挡攻击、受到严重伤害或者受愤怒的恶魔围剿时。</p>');
INSERT INTO `heroism` VALUES ('7', '死灵法师', '<p>对拉斯玛的祭司而言，死亡只是生命中最自然的一部分。他们并不追求延缓死亡那无可避免的降临，而是以无畏的态度面对它。他们唯一的目标是维持光明与黑暗力量间的平衡，因为当平衡被打破时，人类将面临极度危险的局面。</p><p>尽管有人辱骂他们，把他们称为死灵法师或是异教徒，但拉斯玛的祭司们仍一如既往地强大。他们隐秘地工作，施展他们独有的死亡法术，维护庇护之地的平衡。</p>', 'http://localhost:3000/src/images/hero-b1.jpg', 'http://localhost:3000/src/images/hero-b2.jpg', 'http://localhost:3000/src/images/hero-b1.jpg', '<p class=\"tit\">“不必害怕死亡”</p><p>拉斯玛本人是天使伊纳瑞斯与恶魔莉莉丝之子。生活在第一代人类之中，他发现了一条基本法则：光明与黑暗势力的冲突是永恒的，而二者都是这个世界的威胁。他将自己的哲学传递给他的弟子卡兰，后来卡兰成立了拉斯玛祭司的教团。</p><p>长久以来，复活和操纵亡者的魔法一直被凡人所滥用，这些遭人谩骂的行为让拉斯玛祭司蒙上了“死灵法师”的污名。外人认为此类行为会招来恶魔，让庇护之地陷入危险。然而，死灵法师的追求是用他们的力量以维护平衡，而不是破坏它。</p><p>他们明白，只要魔神在凡间出现，就会颠覆自然的协调，正因如此，他们不能袖手旁观。</p>', '<p>从教团成立之初，拉斯玛的祭司就开始从各种来源搜集充满力量的宝物。当中最著名的是他们的魂匣，这些不同寻常的物件可以强化他们支配亡者的能力，还能够让他们的镰刀变得更加致命。</p>', 'http://localhost:3000/src/images/sl-zb.jpeg', 'http://localhost:3000/src/images/sl-zb2.png', '<p>在角色外观方面， 初级（左）：新受洗的拉斯玛祭司身着黑袍，几乎不戴护甲。他们宁愿依赖自己的魔法技能来提供保护。 中级（中）：更有经验的死灵法师会知道他们面对的敌人比过去要凶险得多，因此会相应地武装自己。 高级（右）：拉斯玛的精英祭司的外观令人难忘。他们从钙化的白骨装甲中获得卓越的防护，并足够强壮，可以穿戴这些护甲而不会影响速度和灵活性。</p>', 'http://localhost:3000/src/images/slfs-icon.png', 'http://localhost:3000/src/images/sl-jn1.png', '<span class=\"jn-name\">召唤</span><p>死灵法师可以学习召唤亡灵战士、法师和傀儡的仪式。与凡人不同的是，这些仆从将战斗到最后一刻，不需要睡眠、饮食或休息。</p>', 'http://localhost:3000/src/images/sl-jn2.png', '<span class=\"jn-name\">诅咒</span><p>死灵法师可以学习饱含折磨之边的法术，并用它们来摧毁敌人的躯体与灵魂。无法反击的敌人对付起来自然容易了很多。</p>', 'http://localhost:3000/src/images/sl-jn3.png', '<span class=\"jn-name\">战场控制</span><p>你召唤的骷髅和傀儡仆从都将听从你的命令。只要你下令，他们会毫不犹豫地扑向任何目标并将其摧毁。</p>', 'http://localhost:3000/src/images/sl-jn4.png', '<span class=\"jn-name\">鲜血魔法</span><p>死灵法师依靠精魂来操控战场并摧毁敌人。他们也必须学会使用自己的血液来强化法术。想要让那些最强大的法术发挥最大的潜力，需要的不仅是精魂而已。</p>', 'http://localhost:3000/src/images/sl.gif', '\r\n<p>人物能量：Spirit</p><p>精魂赋予造物生命。通过操控精魂，死灵法师可以决定造物的生与死。掌握了驾驭精魂的技巧，就能够复活和控制骷髅仆从，或引导其力量构建血液与骨骼。</p><p>死灵法师会借助精魂的能量来强化他们的法术。凭借自身的努力，死灵法师就能从凡人、恶魔或天使身上获得精魂。</p><p>在需要精魂时，他们可以使用幽魂般的镰刀收割敌人的灵魂，或直接从血液中吸取。精魂是不灭的，不会随着时间而消逝。</p>');

-- ----------------------------
-- Table structure for hero_station
-- ----------------------------
DROP TABLE IF EXISTS `hero_station`;
CREATE TABLE `hero_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_icon` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `hero_tech` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hero_station
-- ----------------------------
INSERT INTO `hero_station` VALUES ('1', 'http://localhost:3000/src/images/bar-icon.jpg', '2.6.7野蛮人痛割旋风斩攻略', '革荒S', 'http://localhost:3000/src/images/build_tech1.png');
INSERT INTO `hero_station` VALUES ('2', 'http://localhost:3000/src/images/monk-icon.jpg', '2.6.7猴王冰奔（风雷冲）玩法入门', 'sss', 'http://localhost:3000/src/images/build_tech2.png');
INSERT INTO `hero_station` VALUES ('3', 'http://localhost:3000/src/images/cru-icon.jpg', '2.6.7圣教军勇气三光组队攻略', 'aaa', 'http://localhost:3000/src/images/build_tech3.png');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', 'http://localhost:3000/src/images/rotate_1.png', '光怪陆离的混沌界（上）：暗黑宇宙的基石和枢纽', '2020-03-20 20:40:58');
INSERT INTO `images` VALUES ('2', 'http://localhost:3000/src/images/rotate_2.png', '庇护之地建筑现象调查：伟大城市威斯特玛（上）', '2020-03-20 20:41:10');
INSERT INTO `images` VALUES ('3', 'http://localhost:3000/src/images/rotate_3.jpg', '新崔斯特姆版规 v2.05 发帖前必读', '2020-03-21 20:41:24');
INSERT INTO `images` VALUES ('4', 'http://localhost:3000/src/images/rotate_4.png', '暗黑起源特别活动：“崔斯特姆的黑化”已经上线', '2020-03-27 20:41:32');
INSERT INTO `images` VALUES ('5', 'http://localhost:3000/src/images/rotate_5.png', '最新论坛来了许多新手，希望大家互帮互助，和谐进步！ ', '2020-03-28 20:41:37');

-- ----------------------------
-- Table structure for list_info
-- ----------------------------
DROP TABLE IF EXISTS `list_info`;
CREATE TABLE `list_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `contents` varchar(5555) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `good_num` int(11) DEFAULT NULL,
  `bad_num` int(11) DEFAULT NULL,
  `collect_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`),
  CONSTRAINT `list_info_ibfk_1` FOREIGN KEY (`id`) REFERENCES `list_item` (`id`),
  CONSTRAINT `list_info_ibfk_2` FOREIGN KEY (`add_time`) REFERENCES `list_item` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of list_info
-- ----------------------------
INSERT INTO `list_info` VALUES ('3', '20赛季散件死灵引导新星大秘速刷配置分享', '<p>在20赛季中，死灵最主流的单人散魂玩法身娇体弱，非常容易被怪物“推倒”，为了帮助新晋拉斯玛祭司，我们为你带来了这套既轻松又稳健、肉的要命的同时输出还高的单人散件引导新星玩法，本攻略同样适用NS版，一起来看看吧~</p><b class=\"black\">本攻略的用途是赛季速刷，冲层请使用散件尸枪或者纯新星赌BOSS。</b><p>核心思路是新星推进度，尸矛戳BOSS。同时利用20赛季的额外萃取最大化输出的同时，配装尽可能的硬。</p><p>如果你玩魂法死到自闭，不妨试试这套。</p><img src=\"http://localhost:3000/src/images/listinfo1_bd1.jpg\"><p>上为BD整体，萃取为血潮长刀、轮回镰刀，纳伊尔的黑镰。传奇宝石必选困者、梦之遗礼，备选火牛（穿攀冰者）、活力（穿血步鞋）。</p><span class=\"title2\">一、bd改动</span><p>1、额外萃取了轮回和黑镰，一个用于增伤新星，一个用于增伤尸矛。<br>2、不带活力的情况下需要带攀冰免疫岩石负面效果，带活力需要下火牛，但可以把鞋子换成血步鞋<br>3、减伤总额为骨甲30%+但提50%+团结50%+天鹰50%+传奇宝石理论52%+孤魂死灵额外100%护甲+岩石额外250%甲，坚韧差不多是魂法的20-30倍，带火牛的情况下配合被动还可以在怪堆一秒满血，非常适合新手。</p><span class=\"title2\">二、技能</span><img src=\"http://localhost:3000/src/images/listinfo1_jn1.jpg\" alt=\"\"><p>因为是被动引导新星，靠铁玫瑰引导打输出，所以不带新星技能，但是要洗新星技能伤害。因为额外萃取了增伤新星400%的轮回镰刀，为了补充尸矛的伤害防止出现一轮死地尸矛打不死BOSS，选择技能带三毒萃取黑镰打毒尸矛。萃取影镰也可以但尸矛伤害太低了，速刷不效率。鲜血虹吸用于触发铁玫瑰特效，毒符文可以叠一层黑镰。尸矛用来打BOSS和难缠的精英，毒符文可以享受黑镰刀增伤，同时自身也叠一层毒。鲜血奔行赶路。亡者领域用来配合尸矛打BOSS，冰符文可以触发克戒。脆弱选择无消耗的灵气，触发蚀牙增伤、但提减伤。骨甲选择晕符文，触发克戒和轮回增伤如果觉得足够硬，被动吸收生命可以换别的，比如弱点加深和鲜血之力。一个偏进度一个偏BOSS</p><span class=\"title2\">三、推荐词缀</span><p>李奥瑞克王冠：智力、暴击率、体能<br>天鹰斗衣：智力、体能、尸矛技能、3孔<br>拜尸者的护肩：智力、体能、尸矛技能、cdr或护甲或生命值<br>岩石手套：暴击率、暴击伤害、攻击速度、体能或力量<br>复仇者护腕：物理元素伤、暴击率、智力、体能<br>但提的束缚：智力、体能、生命值、护甲<br>沼泽裤（巫医制作）：物理元素伤、智力、体能、护甲、2孔<br>攀冰鞋：智力、体能、死亡新星技能、护甲或全抗<br>约翰石：物理元素伤、暴击率、暴击伤害、孔<br>克里斯宾的审判：暴击率、暴击伤害、攻击速度、孔<br>团结：暴击率、暴击伤害、精英伤、孔<br>蚀牙：10ED、攻击速度、智力、孔<br>铁玫瑰：智力、暴击率、尸矛或死亡新星技能、冷却缩减或体能或生命值</p><span class=\"title2\">四、bd特性</span><p>1、NS端无BUG，操作简单适合主机玩。<br>2、没有爆发周期和能量循环，适合新手理解并上手。<br>3、坚韧较高，基本不会死，适合新手。<br>4、不用宏，适合新手。</p><span class=\"title2\">五、打法</span><p>1、打一波大招能扎死boss的层数，最划算。<br>2、贴着精英，引导虹吸时按住不要松手，小怪炸完后利用地上尸体戳残血精英，距出BOSS还早的话也可以开了大招戳。<br>3、由于轮回、骨甲消耗比较快，注意补充。<br>4、不要吃加速塔，会改变攻速，卡铁玫瑰ICD。</p>', '2020-03-03 15:17:15', '20', '0', '33');
INSERT INTO `list_info` VALUES ('4', '探秘庇护之地：地下世界深处的秘密', '暗黑起源系列的扛鼎开端，是从地下迷宫发始的。也是从那个时候，暗黑破坏神的地下世界第一次出现在了玩家们的面前。而暴雪设计师们把这个地下世界的入口设计为崔斯特姆大教堂是有其浓厚文化背景的。', '2020-03-06 15:21:15', '30', '0', '10');

-- ----------------------------
-- Table structure for list_item
-- ----------------------------
DROP TABLE IF EXISTS `list_item`;
CREATE TABLE `list_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `com_num` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of list_item
-- ----------------------------
INSERT INTO `list_item` VALUES ('3', '20赛季散件死灵引导新星大秘速刷配置分享', '在20赛季中，死灵最主流的单人散魂玩法身娇体弱，非常容易被怪物“推倒”，为了帮助新晋拉斯玛祭司，我们为你带来了这套既轻松又稳健、肉的要命的同时输出还高的单人散件引导新星玩法，本攻略同样适用NS版~', 'http://localhost:3000/src/images/list-item1.jpg', '33', '2020-03-03 15:17:15');
INSERT INTO `list_item` VALUES ('4', '探秘庇护之地：地下世界深处的秘密', '暗黑起源系列的扛鼎开端，是从地下迷宫发始的。也是从那个时候，暗黑破坏神的地下世界第一次出现在了玩家们的面前。而暴雪设计师们把这个地下世界的入口设计为崔斯特姆大教堂是有其浓厚文化背景的。', 'http://localhost:3000/src/images/list-item5.jpg', '43', '2020-03-06 15:21:15');
INSERT INTO `list_item` VALUES ('5', '20赛季开荒系列活动第三站：挑战80层大秘境', '为了迎接20赛季，凯恩之角论坛举办了开荒系列活动。让我们一起跟着大家在赛季中成长的脚步，见证你的每一次突破与成就。欢迎大家来到第三站，我们的任务是要求英雄们完成单人80层大秘境。', 'http://localhost:3000/src/images/list-item2.jpg', '54', '2020-03-10 14:19:12');
INSERT INTO `list_item` VALUES ('6', '强势平推！2.6.8版本组队毒新星死灵攻略', '操作简便、伤害迅捷、装备好凑、队友轻松。在20赛季的BUFF之下，死灵法师的新星玩法获得了额外两把镰刀的巨幅增伤，从而在四人队伍中获取了一席之地，赛季四人利用这一玩法仅用2天便通关了150层。', 'http://localhost:3000/src/images/list-item3.jpg', '26', '2020-03-12 14:20:17');
INSERT INTO `list_item` VALUES ('7', '20赛季开荒系列活动第二站：完成1-5幕悬赏', '欢迎大家来到赛季开荒第二站，我们的任务是要求英雄们完成1-5幕的悬赏这个目标（不限制组队人数）。只要你完成目标，在本帖上传你的成绩就有机会领取奖励，不过可要注意我们的截图规则哦~', 'http://localhost:3000/src/images/list-item4.jpg', null, '2020-03-14 14:43:20');
INSERT INTO `list_item` VALUES ('8', '暗黑3第20赛季现已开启，实用开荒攻略一览', '第20赛季已经在3月13日17时正式开启，玩家们可以进入游戏进行新赛季的开荒之旅。不过在进游戏之前，你还得先了解一下开荒的实用攻略，这样才能有备无患，领先在起跑线上。', 'http://localhost:3000/src/images/list-item4.jpg', '200', '2020-03-14 14:43:57');
INSERT INTO `list_item` VALUES ('9', '探秘庇护之地：失落的矿洞', '在坎杜拉斯的苦难旷野设计了很多地下场景，其中一个地下世界叫做失落的矿洞。这个矿洞有个专属任务，当玩家抵达失落的矿洞二层时会触发矿工塔苏恩的任务，现在就让我们一起来看看这个矿洞中有什么秘密。', 'http://localhost:3000/src/images/uczyjp.jpg', '10', '2020-03-15 14:14:18');
INSERT INTO `list_item` VALUES ('10', '冰风扫掠！2.6.8武僧正义套风雷冰爆攻略', '武僧作为最万能的职业，很多玩家都非常熟悉，比如奶僧、上帝僧、猴王火钟、电奔速刷等等，本文旨在向那些还不是很了解武僧正义套冰爆流玩法的玩家做浅显说明。用一句话概括正义冰爆流——万能的流派。', 'http://localhost:3000/src/images/syo8jy.jpg', '22', '2020-03-15 17:16:55');
INSERT INTO `list_item` VALUES ('11', '狂风扫落叶！20赛季速刷用死灵魂法队全解析', '20赛季的赛季BUFF对魂法队是相当大的提升，额外萃取了一个蚀牙的散魂大大提升了速刷的层数。在经过对机制的研究之后我们改进了各个位置的配置，让魂法和辅助的操作变得更加轻松，大秘境的效率进一步提升。', 'http://localhost:3000/src/images/lfh1ap.jpg', '30', '2020-03-16 17:17:08');
INSERT INTO `list_item` VALUES ('12', '20赛季国服天梯单人榜周报vol.2：仅此一季，失不再来', '20赛季开始已有2周，在这个解锁了卡奈魔盒全部威能的禁忌赛季，不同的奈非天在挑战大秘境时有着不同的选择，让我们来看看在第二周的国服天梯榜中，有多少个“仅限于赛季使用”的玩法登顶吧！', 'http://localhost:3000/src/images/thumb.jpg', null, '2020-03-18 14:22:10');
INSERT INTO `list_item` VALUES ('13', '2.6.8法师提丰蛇与散件蛇完整攻略分享', '法师新套装的出现和多头蛇相关装备的加强让这一玩法重新走上了舞台，而现在论坛很多玩家对套蛇与散蛇的理解均比较片面，没有更深层探究他们的原理与打法，所以 瞬瞄 就撰写了这篇攻略，供大家参考。', 'http://localhost:3000/src/images/nvopcq.jpg', null, '2020-03-19 14:22:16');
INSERT INTO `list_item` VALUES ('14', '野蛮人九十蛮狂乱第一视角视频与狂乱各变种玩法', '2.6.8版本野蛮人得到了一套新的九十蛮套装，这套以狂乱为输出核心的套装给了野蛮人全新的玩法体验。论坛玩家 蛮3刀 已经用此玩法通关了140层，现在他放出了自己的实战视频，以及操作心得，来看看吧。', 'http://localhost:3000/src/images/egosb4.jpg', null, '2020-03-21 14:24:32');
INSERT INTO `list_item` VALUES ('15', '五套配装畅游大小秘！赛季圣教军勇气天拳玩法分享', '20赛季专属BUFF“禁忌档案”，令战马套勇气天拳玩法本就极好的速刷体验更上一层楼。小秘境又想要贤者有想要坚韧？大秘境嫌双手武器打的太慢？下面我将结合视频为你带来20赛季中勇气天拳的大小秘境配装分享。', 'http://localhost:3000/src/images/xtpakg.png', null, '2020-03-22 14:26:55');
INSERT INTO `list_item` VALUES ('16', '探秘庇护之地：大教堂地下世界的秘密', '在李奥瑞克成为坎杜拉斯王之后，在崔斯特姆荒废修道院的基础之上修葺一新，使之成为了矗立在坎杜拉斯大地上最雄伟壮观的萨卡兰姆大教堂，今天我们就要一探大教堂的秘密。', 'http://localhost:3000/src/images/qpo.jpg', null, '2020-03-23 14:27:00');
INSERT INTO `list_item` VALUES ('17', '把新星玩成小型奥陨—简析死灵新星组队速刷的操作', '近日，新星死灵成为了玩家们攻略四人天梯的首选，但在日常的组队中新星因为其较为独特的节奏和机制，很容易出现精英收不掉从而导致通关时间被拉长的情况，本帖将详细为你描述新星死灵速刷时的节奏、操作与机制。', 'http://localhost:3000/src/images/mxaivh.jpg', null, '2020-03-25 14:34:18');

-- ----------------------------
-- Table structure for rec_video
-- ----------------------------
DROP TABLE IF EXISTS `rec_video`;
CREATE TABLE `rec_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_url` varchar(255) DEFAULT NULL,
  `banner_title` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rec_video
-- ----------------------------
INSERT INTO `rec_video` VALUES ('1', 'http://localhost:3000/src/images/wnyhmo.png', '拜命三归！暗黑起源2宣布震撼CG', '冲榜视频鉴赏：野蛮人150和四人3分半150', '2020-01-14 10:13:59');
INSERT INTO `rec_video` VALUES ('2', 'http://localhost:3000/src/images/1573261511589.jpg', '这是banner视频图片标题', '9分钟145层！野蛮人痛割撕裂玩法冲榜实录', '2020-01-15 10:37:56');
INSERT INTO `rec_video` VALUES ('3', null, null, '人人都有泰瑞尔地精！十九赛季旅程心得分享', '2020-01-15 10:38:26');
INSERT INTO `rec_video` VALUES ('4', null, null, '气势恢宏！暗黑破坏神4世界BOSS战演示', '2020-01-17 10:38:48');
INSERT INTO `rec_video` VALUES ('5', null, null, '圣教军实战演示：被动三光135与主动三光140', '2020-01-18 10:39:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '329472242@qq.com', '987654321', '2020-04-07 15:29:31');
INSERT INTO `user` VALUES ('3', '763071532@qq.com', '123456789', '2020-04-07 16:29:34');
INSERT INTO `user` VALUES ('17', '3079297144@qq.com', 'cbf3079297144', '2020-04-09 21:32:02');
INSERT INTO `user` VALUES ('29', '123456789@qq.com', '123456789', '2020-04-10 13:20:09');
INSERT INTO `user` VALUES ('30', '202042@qq.com', '20200413', '2020-04-13 14:45:22');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `video_src` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('http://localhost:3000/src/video/diablo.mp4', '1');
INSERT INTO `video` VALUES ('http://localhost:3000/src/video/high.mp4', '2');
