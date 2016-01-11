#!/bin/bash
#//Use me to reclaim disk space on CDH clusters.  

if [ -d /var/log/catalogd ]; then
	find /var/log/catalogd -type f -mtime +14 -name "catalogd.bad*" -exec rm -f {} \;
fi
if [ -d /var/log/cloudera-scm-agent ]; then
	find /var/log/cloudera-scm-agent -type f -name "*.log.*[0-9]" -exec rm -f {} \;
	find /var/log/cloudera-scm-agent -type f -name "*.out.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/cloudera-scm-alertpublisher ]; then
	find /var/log/cloudera-scm-alertpublisher/ -type f -name "*.log.*[0-9]" -exec rm -f {} \;
	find /var/log/cloudera-scm-alertpublisher/ -type f -name "*.out.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/cloudera-scm-eventserver ]; then
	find /var/log/cloudera-scm-eventserver -type f -name "*.out.*[0-9]" -exec rm -f {} \;
	find /var/log/cloudera-scm-eventserver -type f -name "*.log.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/cloudera-scm-firehose ]; then
	find /var/log/cloudera-scm-firehose -type f -name "*.out.*[0-9]" -exec rm -f {} \;
	find /var/log/cloudera-scm-firehose -type f -name "*.log.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/cloudera-scm-headlamp ]; then
	find /var/log/cloudera-scm-headlamp -type f -name "*.out.*[0-9]" -exec rm -f {} \;
	find /var/log/cloudera-scm-headlamp -type f -name "*.log.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/cloudera-scm-server ]; then
	find /var/log/cloudera-scm-server -type f -name "*.out.*[0-9]" -exec rm -f {} \;
	find /var/log/cloudera-scm-server -type f -name "*.log.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/hadoop-hdfs ]; then
	/var/log/hadoop-hdfs -type f -name "*.out.*[0-9]" -exec rm -f {} \;
	/var/log/hadoop-hdfs -type f -name "*.log.*[0-9]" -exec rm -f {} \;
fi
if [ - /var/log/hadoop-yarn ]; then
	find /var/log/hadoop-yarn -type f -name "*.log.*[0-9]" -exec rm -f {} \;
	find /var/log/hadoop-yarn -type f -name "*.out.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/hbase ]; then
	find /var/log/hbase -type f -name "*.log.*[0-9]" -exec rm -f {} \;
	find /var/log/hbase -type f -name "*.out.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/hcatalog ]; then
	find /var/log/hcatalog -type f -name "*.log.*[0-9]" -exec rm -f {} \;
	find /var/log/hcatalog -type f -name "*.out.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/hive ]; then
	find /var/log/hive -type f -name "*.log.*[0-9]" -exec rm -f {} \;
	find /var/log/hive -type f -name "*.out.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/impalad ]; then
	find /var/log/impalad -type f -name "impalad.bad-*log.*" -exec rm -f {} \;
fi
if [ -d /var/log/oozie ]; then
	find /var/log/oozie -type f -name "oozie-instrumentation.log.*[0-9]" -exec rm -f {} \;
	find /var/log/oozie -type f -name "catalina.*.log" -exec rm -f {} \;
	find /var/log/oozie -type f -name "host-manager.*.log" -exec rm -f {} \;
	find /var/log/oozie -type f -name "localhost.*.log" -exec rm -f {} \;
	find /var/log/oozie -type f -name "manager.*.log" -exec rm -f {} \;
	find /var/log/oozie -type f -name "oozie-audit.log.*[0-9]" -exec rm -f {} \;
	find /var/log/oozie -type f -name "*OOZIE_SERVER*.out*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/sqoop2 ]; then
	find /var/log/sqoop2 -type f -name "*.out.*[0-9]" -exec rm -f {} \;
	find /var/log/sqoop2 -type f -name "catalina.*.log" -exec rm -f {} \;
	find /var/log/sqoop2 -type f -name "host-manager.*.log" -exec rm -f {} \;
	find /var/log/sqoop2 -type f -name "localhost.*.log" -exec rm -f {} \;
	find /var/log/sqoop2 -type f -name "manager.*.log" -exec rm -f {} \;
fi
if [ -d /var/log/statestore ]; then
	find /var/log/statestore -type f -name "statestored.bad-*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/zookeeper ]; then
	find /var/log/zookeeper -type f -name "*.log.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/lib/cloudera-host-monitor ]; then
	find /var/lib/cloudera-host-monitor/ts/stream/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-host-monitor/ts/ts_stream_rollup_PT21600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-host-monitor/ts/ts_stream_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-host-monitor/ts/ts_stream_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-host-monitor/ts/ts_type_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-host-monitor/ts/ts_type_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-host-monitor/ts/type/partitions/ -type d -ctime +2 | xargs rm -rf
fi
if [ -d /var/lib/cloudera-service-monitor ]; then
	find /var/lib/cloudera-service-monitor/ts/stream/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-service-monitor/ts/ts_stream_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-service-monitor/ts/ts_stream_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-service-monitor/ts/ts_type_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-service-monitor/ts/ts_type_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
	find /var/lib/cloudera-service-monitor/ts/type/partitions/ -type d -ctime +2 | xargs rm –rf
fi
