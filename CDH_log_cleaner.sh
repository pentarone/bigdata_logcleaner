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
fi
if [ -d /var/log/cloudera-scm-firehose ]; then
	find /var/log/cloudera-scm-firehose -type f -name "*.out.*[0-9]" -exec rm -f {} \;
fi
if [ -d /var/log/cloudera-scm-headlamp ]; then
	find /var/log/cloudera-scm-headlamp -name "*.out.*[0-9]" -exec rm -f {} \;
	find /var/log/cloudera-scm-headlamp -name "*.log.*[0-9]" -exec rm -f {} \;
fi

/var/log/cloudera-scm-server/*.out.*[0-9]
/var/log/cloudera-scm-server/*.log.*[0-9]
/var/log/hadoop-hdfs/*.log.*[0-9]
/var/log/hadoop-hdfs/*.out.*[0-9]
/var/log/hadoop-yarn/*.out.*[0-9]
/var/log/hbase/*.out.*[0-9]
/var/log/hcatalog/*.out.*[0-9]
/var/log/hive/*.out.*[0-9]
/var/log/impalad/impalad.bad-*[0-9]
/var/log/oozie/oozie-instrumentation.log.*[0-9]
/var/log/oozie/catalina.*.log
/var/log/oozie/host-manager.*.log
/var/log/oozie/localhost.*.log
/var/log/oozie/manager.*.log
/var/log/oozie/oozie-audit.log.*[0-9]
/var/log/oozie/*OOZIE_SERVER*.out*[0-9]
/var/log/sqoop2/*.out.*[0-9]
/var/log/sqoop2/catalina.*.log
/var/log/sqoop2/host-manager.*.log
/var/log/sqoop2/localhost.*.log
/var/log/sqoop2/manager.*.log
/var/log/statestore/statestored.bad-*[0-9]
/var/log/zookeeper/*.log.*[0-9] 



find /var/lib/cloudera-host-monitor/ts/stream/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-host-monitor/ts/ts_stream_rollup_PT21600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-host-monitor/ts/ts_stream_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-host-monitor/ts/ts_stream_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-host-monitor/ts/ts_type_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-host-monitor/ts/ts_type_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-host-monitor/ts/type/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-service-monitor/ts/stream/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-service-monitor/ts/ts_stream_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-service-monitor/ts/ts_stream_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-service-monitor/ts/ts_type_rollup_PT3600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-service-monitor/ts/ts_type_rollup_PT600S/partitions/ -type d -ctime +2 | xargs rm -rf
find /var/lib/cloudera-service-monitor/ts/type/partitions/ -type d -ctime +2 | xargs rm –rf

