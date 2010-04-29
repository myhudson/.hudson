#!/bin/bash
ALL_CONFIGS="Start Page Links,Quick Links,LDAP Login,Inventory Control,Resource Groups,Group Configuration,Datasource Creation,User Administration,Content,Configuration History,Search,Favorites,Connection Properties Editing and History,Events,Operations,Group Roles,DynaGroups,Alert Templates,Metric Templates,Metric Schedules,Postfix,Cron,Hosts File,Aliases File,Sudoers,Samba,General Properties,Agent Commands,Manual Addition of Inventory,Sort Tables By Columns,JBossAS5 Plugin,JMS,Server Side Plugin Container,Alert Sender SNMP Plugin,Alert Sender Microblog Plugin,Alert Sender Email Plugin"
IFS=,

for CONFIG in $ALL_CONFIGS; do
	NO_WHITESPACE=`echo $CONFIG | sed 's/ //g'`
	DESTDIR=jobs/$NO_WHITESPACE
	if [ ! -d $DESTDIR ]
	then
    		mkdir -p $DESTDIR
	fi

	DEST=jobs/$NO_WHITESPACE/config.xml
	cp jobs/Alerts/config.xml $DEST
	sed -i "s/Alerts/${CONFIG}/g" $DEST
done

