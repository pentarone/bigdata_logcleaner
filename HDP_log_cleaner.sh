#!/bin/bash
#//Use me to reclaim disk space on HDP clusters.  This will clean log files, clean up zookeeper edits and fsimages, 
#//and clean ambari-agent output data dir.



HADOOP_VERSION=`hadoop version | head -1 | cut -c14-16`

if [ -d /var/log/ambari-agent ]; then
	find /var/log/ambari-agent -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/ambari-agent -type f -name "*.out.*" -exec rm -f {} \;
fi
if [ -d /var/log/ambari-server ]; then
	find /var/log/ambari-server -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/ambari-server -type f -name "*.out.*" -exec rm -f {} \;
fi
if [ -d /var/log/ambari-metrics-collector ]; then
	find /var/log/ambari-metrics-collector -type f -name "*.out.*" -exec rm -f {} \;
	find /var/log/ambari-metrics-collector -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/ambari-metrics-collector -type f -name "gc.log*" -mtime +7 -exec rm -f {} \;
fi
if [ -d /var/log/ambari-metrics-monitor ]; then
	find /var/log/ambari-metrics-monitor -type f -name "*.out.*" -exec rm -f {} \;
fi
if [ -d /var/log/hadoop/hdfs ]; then
	find /var/log/hadoop/hdfs -type f -name "*log.*" -exec rm -f {} \;
	find /var/log/hadoop/hdfs -type f -name "*out.*" -exec rm -f {} \;
	find /var/log/hadoop/hdfs -type f -name "gc.log*" -mtime +7 -exec rm -f {} \;
fi
if [ -d /var/log/hadoop/root ]; then
	find /var/log/hadoop/root -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/hadoop/root -type f -name "*.out.*" -exec rm -f {} \;
	find /var/log/hadoop/root -type f -name "gc.log*" -mtime +7 -exec rm -f {} \;
fi
if [ -d /var/log/hadoop-yarn/yarn ]; then
	find /var/log/hadoop-yarn/yarn -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/hadoop-yarn/yarn -type f -name "*.out.*" -exec rm -f {} \;
fi
if [ -d /var/log/hbase ]; then
	find /var/log/hbase -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/hbase -type f -name "*.out.*" -exec rm -f {} \;
	find /var/log/hbase -type f -name "gc.log*" -mtime +7 -exec rm -f {} \;
fi
if [ -d /var/log/hive ]; then
	find /var/log/hive -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/hive -type f -name "*.out.*" -exec rm -f {} \;
	find /var/log/hive -type f -name "gc.log*" -mtime +7 -exec rm -f {} \;
fi
if [ -d /var/log/oozie ]; then
	find /var/log/oozie -type f -name "*.log.*" -exec rm -f {} \;
	find /var/log/oozie -type f -name "*[0-9].log" -exec rm -f {} \;
fi
if [ -d /var/log/webhcat ]; then
	find /var/log/webhcat -type f -name "*.log.*" -exec rm -f {} \;
fi
#/var/log/zookeeper

#//HDP2.2secure log dirs not in 2.3 cluster
if [ -d /var/log/nagios/archives ]; then
	find /var/log/nagios/archives -type f -name "*.log" -mtime +30 -exec rm -vf {} \;
fi

#//ambari-agent output dir
if [ -d /var/lib/ambari-agent/data ]; then
	find /var/lib/ambari-agent/data -type f -name "command*.json" -mtime +7 -exec rm -f {} \;
	find /var/lib/ambari-agent/data -type f -name "errors*.txt" -mtime +7 -exec rm -f {} \;
	find /var/lib/ambari-agent/data -type f -name "output*.txt" -mtime +7 -exec rm -f {} \;
	find /var/lib/ambari-agent/data -type f -name "structured*.json" -mtime +7 -exec rm -f {} \;
fi

#//NOTE: The directory path (number portion) and zookeeper jar version number will change so need to use regular expressions
if [ $HADOOP_VERSION == "2.3" ]; then
	su - zookeeper
	#//HDP2.3secure
	cd /usr/hdp/2.3.0.0-2557/zookeeper
	java -cp zookeeper-3.4.6.2.3.0.0-2557.jar:lib/slf4j-log4j12-1.6.1.jar:lib/slf4j-api-1.6.1.jar:lib/log4j-1.2.16.jar:conf org.apache.zookeeper.server.PurgeTxnLog /hadoop/zookeeper/ /hadoop/zookeeper/ -n 3
	exit
elif [ $HADOOP_VERSION == "2.2" ]; then
	#//HDP2.2secure
	su - zookeeper
	cd /usr/hdp/2.2.0.0-2041/zookeeper
	java -cp zookeeper-3.4.6.2.2.0.0-2041.jar:lib/slf4j-log4j12-1.6.1.jar:lib/slf4j-api-1.6.1.jar:lib/log4j-1.2.16.jar:conf org.apache.zookeeper.server.PurgeTxnLog /hadoop/zookeeper/ /hadoop/zookeeper/ -n 3
	exit
else