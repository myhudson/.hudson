#!/bin/bash
ALL_CONFIGS="Start Page Links,Quick Links,LDAP Login,Resource Groups,Group Configuration,Datasource Creation,User Administration,Content,Configuration History,Search,Favorites,Connection Properties Editing and History,Events,Operations,Group Roles,DynaGroups,Alert Templates,Metric Templates,Metric Schedules,Postfix,Cron,Hosts File,Aliases File,Sudoers,General Properties,Sort Tables By Columns"
IFS=,

for CONFIG in $ALL_CONFIGS; do
	NO_WHITESPACE=`echo $CONFIG | sed 's/ //g'`
	DEST=jobs/$NO_WHITESPACE/config.xml
	cp jobs/Alerts/config.xml $DEST
	sed -i "s/Alerts/${CONFIG}/g" jobs/$NO_WHITESPACE/config.xml
done

