--创建表
CREATE TABLE logtbl (
    host STRING,
    identity STRING,
    t_user STRING,
    time STRING,
    request STRING,
    referer STRING,
    agent STRING
    )
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
    WITH SERDEPROPERTIES (
    "input.regex" = "([^ ]*) ([^ ]*) ([^ ]*) \\[(.*)\\] \"(.*)\" (-|[0-9]*) (-|[0-9]*)"
    )
    STORED AS TEXTFILE;
--加载数据
	load data local inpath '/root/data/log' into table logtbl;
--查询操作
	select * from logtbl;
--数据显示如下（不包含[]和"）
192.168.57.4	-	-	29/Feb/2019:18:14:35 +0800	GET /bg-upper.png HTTP/1.1	304	-
192.168.57.4	-	-	29/Feb/2019:18:14:35 +0800	GET /bg-nav.png HTTP/1.1	304	-
192.168.57.4	-	-	29/Feb/2019:18:14:35 +0800	GET /asf-logo.png HTTP/1.1	304	-
192.168.57.4	-	-	29/Feb/2019:18:14:35 +0800	GET /bg-button.png HTTP/1.1	304	-
192.168.57.4	-	-	29/Feb/2019:18:14:35 +0800	GET /bg-middle.png HTTP/1.1	304	-
