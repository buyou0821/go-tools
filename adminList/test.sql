  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT

  `parent_adcode` varchar(16) NOT NULL COMMENT '父级代码',
  `citycode` varchar(16) DEFAULT NULL COMMENT '城市12编码',
  `level` varchar(16) NOT NULL COMMENT 'aa',
  `center` varchar(32) DEFAULT NULL COMMENT '经纬度',
  `pinyin` varchar(32) DEFAULT NULL COMMENT '拼音全称',
  `short_pinyin` varchar(16) DEFAULT NULL COMMENT '拼音简称',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',

  `exterior_color_id` tinyint(4) DEFAULT NULL COMMENT '外饰颜色id',

  `is_open` int(1) DEFAULT '0' COMMENT '启用/禁用',





