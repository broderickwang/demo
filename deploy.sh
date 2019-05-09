#!/usr/bin/env bash

#需要配置如下参数
#项目路径，在Excute Shell中配置项目路径， pwd 就可以获取到该项目路径
#export PROJ_PATH=这个jenkins任务在部署机器上的路径

#输入你的环境上tomcat的全路径
#export TOMCAT_APP_PATH=tomcat在部署机器上的路径

killTomcat()
{
    pid=`ps -ef|grep tomcat|grep java|awk '{print $2}'`
    echo "tomcat Id list :$pid"
    if[ "$pid" = "" ]
    then
        echo "no tomcat pid alive"

    else
        kill -9 $pid
    fi
}
cd $PROJ_PATH/demo
mvn clean install

#停tomcat
killTomcat

#删除原有的工程
rm -rf $TOMCAT_APP_PATH/webapps/ROOT
rm -f $TOMCAT_APP_PATH/webapps/ROOT.war
rm -f $TOMCAT_APP_PATH/webapps/demo.war

#复制新工程
cp $PROJ_PATH/demo/target/demo.war $TOMCAT_APP_PATH/wabapps/

cd $TOMCAT_APP_PATH/webapps/
#重命名文件
mv demo.war ROOT.war

#启动tomcat
cd $TOMCAT_APP_PATH/
sh bin/startup.sh
