#/bin/bash
export PATH="/root/jdk-9.0.4/bin:/usr/local/inotify/bin/:/opt/libreoffice7.1/program:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
export path=`dirname $0`

export update_very_day_jieguo=`cat ${path}/update_day.log | grep "update_OK" | wc -l`

export QunLiao_AI_Url="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=1132d745-e90b-4f76-9ed8-5ddb8ee9c216"  #外部传参;是指定群机器人的URL;
#export QunLiao_AI_Url="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=254df674-c2b9-4286-96d1-6108a6c9a4f5"  #外部传参;是指定群机器人的URL;

if [ "${update_very_day_jieguo}" -eq 1 ]
then
  export msg_body_info='<font color=\"info\">今日未完成专利后台数据更新成功 @张琪!</font>'
else
  export msg_body_info='`更新失败 @张琪!,请联系技术支持`'
fi

export msg_body='{"msgtype":"'markdown'","'markdown'":{"content":"'$msg_body_info'"},"safe":0}'
/usr/bin/curl -s  -X POST -d "$msg_body"  "$QunLiao_AI_Url"
echo > ${path}/update_day.log
