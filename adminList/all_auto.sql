CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `adcode` varchar(16) NOT NULL COMMENT '城市唯一代码',
  `parent_adcode` varchar(16) NOT NULL COMMENT '父级代码',
  `citycode` varchar(16) DEFAULT NULL COMMENT '城市编码',
  `level` varchar(16) NOT NULL COMMENT 'country/province/city/district',
  `center` varchar(32) DEFAULT NULL COMMENT '经纬度',
  `pinyin` varchar(32) DEFAULT NULL COMMENT '拼音全称',
  `short_pinyin` varchar(16) DEFAULT NULL COMMENT '拼音简称',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_citycode` (`adcode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8 COMMENT='地区表';




CREATE TABLE `auto_brand` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `letters` varchar(2) DEFAULT NULL COMMENT '首字母',
  `brand_name` varchar(128) NOT NULL COMMENT '品牌名',
  `brand_py` varchar(128) DEFAULT NULL COMMENT '品牌拼音',
  `brand_internat` varchar(128) DEFAULT NULL COMMENT '品牌国际化',
  `brand_logo` varchar(128) DEFAULT NULL COMMENT '品牌logo',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热门',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `brand_name` (`brand_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='汽车品牌';




CREATE TABLE `auto_exterior_color` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) NOT NULL COMMENT '颜色',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='外饰颜色';


CREATE TABLE `auto_gear_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) NOT NULL COMMENT '变速箱类型',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='变速箱类型';


CREATE TABLE `auto_interior_color` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) NOT NULL COMMENT '颜色',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='内饰颜色';

CREATE TABLE `auto_interior_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(20) NOT NULL COMMENT '材料',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='内饰材料';


CREATE TABLE `auto_maker` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_id` bigint(20) unsigned NOT NULL COMMENT '品牌id',
  `maker_name` varchar(128) NOT NULL COMMENT '厂商名',
  `maker_internat` varchar(128) DEFAULT NULL COMMENT '厂商国际化',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COMMENT='汽车厂商';



CREATE TABLE `auto_model` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '车型id',
  `brand_id` bigint(20) unsigned NOT NULL COMMENT '品牌id',
  `maker_id` bigint(20) unsigned NOT NULL COMMENT '厂商id',
  `series_id` bigint(20) unsigned NOT NULL COMMENT '车型id',
  `model_ly_code` varchar(128) NOT NULL COMMENT '车型力洋code',
  `model_name` varchar(128) NOT NULL COMMENT '车型名称',
  `model_internat` varchar(128) DEFAULT NULL COMMENT '车型国际化',
  `model_sell_name` varchar(128) DEFAULT NULL COMMENT '销售名称',
  `model_year` varchar(128) DEFAULT NULL COMMENT '年款',
  `emission_standards` varchar(128) DEFAULT NULL COMMENT '排放标准',
  `type` varchar(128) DEFAULT NULL COMMENT '车辆类型',
  `level` varchar(128) DEFAULT NULL COMMENT '车辆级别',
  `recommend_price` varchar(128) DEFAULT NULL COMMENT '指导价格',
  `gear_type` varchar(128) DEFAULT NULL COMMENT '变速器描述',
  `displacement` varchar(128) DEFAULT NULL COMMENT '排量(升)',
  `country_type` varchar(128) DEFAULT NULL COMMENT '国产合资进口',
  `sell_status` varchar(128) DEFAULT NULL COMMENT '销售状态',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=165925 DEFAULT CHARSET=utf8 COMMENT='汽车车型';



CREATE TABLE `auto_series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '车系id',
  `brand_id` bigint(20) unsigned NOT NULL COMMENT '品牌id',
  `maker_id` bigint(20) unsigned NOT NULL COMMENT '厂商id',
  `series_name` varchar(128) NOT NULL COMMENT '车系名称',
  `series_internat` varchar(128) DEFAULT NULL COMMENT '车系国际化',
  `country_type` varchar(128) DEFAULT NULL COMMENT '国产,合资,进口',
  `position` tinyint(4) DEFAULT '1' COMMENT '排序位置',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1994 DEFAULT CHARSET=utf8 COMMENT='汽车车系';




CREATE TABLE `dealer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '经销商名字/门店名称',
  `mobile` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `province_adcode` varchar(16) DEFAULT NULL COMMENT '省',
  `city_adcode` varchar(16) DEFAULT NULL COMMENT '市',
  `district_adcode` varchar(16) DEFAULT NULL COMMENT '区',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `address` varchar(255) DEFAULT NULL COMMENT '门店地址',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `is_open` int(1) DEFAULT '0' COMMENT '启用/禁用',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='经销商表';



CREATE TABLE `inquiryed_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicle_id` bigint(20) unsigned NOT NULL COMMENT '车源id/车辆ID',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号码',
  `submitted_at` datetime DEFAULT NULL COMMENT '提交时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否被删除',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6656 DEFAULT CHARSET=utf8 COMMENT='询价客户信息表';



CREATE TABLE `inventory_vehicle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dealer_id` bigint(20) unsigned NOT NULL COMMENT '经销商id',
  `city_adcode` varchar(16) DEFAULT NULL COMMENT '城市adcode',
  `province_adcode` varchar(16) DEFAULT NULL COMMENT '省adcode',
  `brand_id` bigint(20) unsigned NOT NULL COMMENT '品牌id',
  `maker_id` bigint(20) unsigned NOT NULL COMMENT '厂商id',
  `series_id` bigint(20) unsigned NOT NULL COMMENT '车系id',
  `model_id` bigint(20) unsigned NOT NULL COMMENT '车型id',
  `model_title` varchar(255) DEFAULT NULL COMMENT '车型简称',
  `vin` varchar(32) DEFAULT NULL COMMENT '车架号',
  `plate_number` varchar(8) DEFAULT NULL COMMENT '车牌',
  `reg_date` date DEFAULT NULL COMMENT '上牌时间yyyy-MM-dd',
  `mile` int(10) DEFAULT NULL COMMENT '里程.公里',
  `sell_price` int(10) DEFAULT NULL COMMENT '现售价.元',
  `certified` tinyint(1) DEFAULT '1' COMMENT '是否认证',
  `mian_pic_url` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `small_pics_url` varchar(5000) DEFAULT NULL COMMENT '小图片',
  `full_pics_url` varchar(5000) DEFAULT NULL COMMENT '大图片',
  `car_desc` varchar(500) DEFAULT NULL COMMENT '车辆描述',
  `switch_from_service` int(2) DEFAULT NULL COMMENT '是否营转非 (5:非营运)',
  `source` int(2) DEFAULT NULL COMMENT '车辆来源（3:库融推送  4:系统推送)',
  `transfer_times` tinyint(4) DEFAULT NULL COMMENT '过户次数',
  `score` tinyint(4) DEFAULT '50' COMMENT '搜索排名0-100',
  `inspection_expiry_date` varchar(16) DEFAULT NULL COMMENT '年检有效期',
  `compulsory_insurance_expiry_date` varchar(16) DEFAULT NULL COMMENT '交强险到期时间',
  `exterior_color_id` tinyint(4) DEFAULT NULL COMMENT '外饰颜色id',
  `interior_color_id` tinyint(4) DEFAULT NULL COMMENT '内饰颜色id',
  `interior_material_id` tinyint(4) DEFAULT NULL COMMENT '内饰材料id',
  `gear_type_id` tinyint(4) DEFAULT NULL COMMENT '变速器类型id',
  `retail_price` int(10) DEFAULT NULL COMMENT '新车价.元',
  `displacement` int(6) DEFAULT NULL COMMENT '排量(毫升)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_up` int(1) DEFAULT '0' COMMENT '是否上架（1:上架  2:下架)',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否上架',
  `is_traded` tinyint(1) DEFAULT '0' COMMENT '是否已经交易',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6653 DEFAULT CHARSET=utf8 COMMENT='车源表';



CREATE TABLE `inventory_vehicle_mortgage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicle_id` bigint(20) unsigned NOT NULL COMMENT '车源Id',
  `product_id` int(10) unsigned NOT NULL COMMENT '产品Id',
  `periods` int(2) unsigned NOT NULL COMMENT '期数',
  `prepaid_amount` int(10) unsigned NOT NULL COMMENT '首付',
  `installment_payment` int(10) unsigned NOT NULL COMMENT '月供',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='车源按揭表';



CREATE TABLE `inventory_vehicle_queue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicle_id` bigint(20) unsigned NOT NULL COMMENT '车源Id',
  `task_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '0下架,1上架',
  `task_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态0未处理,1处理完成',
  `task_result` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态0未处理,1成功,2失败',
  `task_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6653 DEFAULT CHARSET=utf8 COMMENT='车源es队列';



CREATE TABLE `inventory_vehicle_trade` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicle_id` bigint(20) unsigned NOT NULL COMMENT '车源Id',
  `buyer_name` varchar(32) NOT NULL COMMENT '买家姓名',
  `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
  `is_mortgage` tinyint(1) DEFAULT '1' COMMENT '是否按揭',
  `trade_time` date NOT NULL COMMENT '成交时间',
  `trade_amount` int(10) unsigned NOT NULL COMMENT '成交金额.元',
  `trade_prepaid_amount` int(10) unsigned NOT NULL COMMENT '首付',
  `trade_installment` int(10) unsigned NOT NULL COMMENT '成交月供.元',
  `trade_periods` int(2) unsigned NOT NULL COMMENT '分期期数',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车源成交记录';



CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_name` varchar(16) DEFAULT NULL COMMENT '产品名称',
  `periods` int(2) unsigned NOT NULL COMMENT '期数',
  `percent` int(2) unsigned NOT NULL COMMENT '首付比列',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `is_open` int(1) DEFAULT '0' COMMENT '启用/禁用',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否被删除',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6656 DEFAULT CHARSET=utf8 COMMENT='产品表';



CREATE TABLE `sms_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mobile` varchar(16) NOT NULL COMMENT '手机号',
  `content` varchar(255) NOT NULL COMMENT '短信内容',
  `template_id` varchar(16) DEFAULT NULL COMMENT '渠道模版id',
  `status` tinyint(255) unsigned DEFAULT NULL COMMENT '状态0:待发送1:已发送2:发送失败',
  `source_type` tinyint(255) DEFAULT NULL COMMENT '发送类型',
  `source_ip` varchar(20) DEFAULT NULL COMMENT '发送IP',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_send` datetime DEFAULT NULL COMMENT '发送时间',
  `ret_code` varchar(32) DEFAULT NULL COMMENT '返回状态',
  `ret_message` varchar(1024) DEFAULT NULL COMMENT '返回信息',
  `channel` varchar(64) DEFAULT NULL COMMENT '发送来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9972 DEFAULT CHARSET=utf8;




CREATE TABLE `stc_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` int(4) DEFAULT NULL COMMENT '1:车辆(是/否)上架,2:车辆来源 3:期数 4:车辆用途',
  `name` varchar(255) DEFAULT NULL COMMENT '1:车辆(是/否)上架,2:车辆来源 3:期数 4:车辆用途',
  `status` int(4) DEFAULT '1' COMMENT '1 有效',
  `typename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='静态资源变量表';








