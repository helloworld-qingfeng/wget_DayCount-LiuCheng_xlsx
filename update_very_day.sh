#!/bin/bash
export update_mouth_msg=`date +%m | sed 's#^0##g'`
export update_yead_msg=`date +%Y`
export sheet_name=${update_yead_msg}-${update_mouth_msg}
export path=`dirname $0`
/bin/bash  /root/InFo/bin/GuDong_Xlsx_Get.sh &> /dev/null
export xls_dir="/root/InFo/tmp/tmp_GuDong_Xlsx/"
export xls_arry=(`cd $xls_dir && ls | egrep "*.xls" | egrep -v "审查意见表.xlsx"`)
export value1=`echo -n "${xls_dir}${xls_arry[0]}、${xls_dir}${xls_arry[1]}、${xls_dir}${xls_arry[2]}" | xxd -ps | tr -d '\n' | sed -r 's/(..)/%\1/g'`
export value2=`echo -n "$sheet_name" | xxd -ps | tr -d '\n' | sed -r 's/(..)/%\1/g'`
export JieGuo_msg=`curl -G --data-urlencode "execl_dir=${value1}" --data-urlencode "sheet_name=${value2}"  "39.98.114.178:8080/AuToUndelivered_manuscriptServlet"`
echo > ${path}/update_day.log
echo $JieGuo_msg > ${path}/update_day.log
