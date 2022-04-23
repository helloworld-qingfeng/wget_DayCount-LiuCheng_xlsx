#!/bin/bash
#/bin/bash /root/InFo/bin/LiuCheng_Xlsx_Get.sh  &> /dev/null

export path=`dirname $0`

export sheet_names="`cat /java_pro_scripts/update_shenbao_sheet.txt`"
echo ${sheet_names}

export log_name="update_shenbao_xls.log"
export xls_dir="/root/InFo/tmp/tmp_LiuCheng_Xlsx"
export xls_arry=(`cd $xls_dir && ls | egrep "流程统计表.xls"`)
export value1=`echo -n "${xls_dir}/${xls_arry}" | xxd -ps | tr -d '\n' | sed -r 's/(..)/%\1/g'`
export value2=`echo -n "${sheet_names}" | xxd -ps | tr -d '\n' | sed -r 's/(..)/%\1/g'`
export JieGuo_msg=`curl -G --data-urlencode "execl_dir=${value1}" --data-urlencode "sheet_name=${value2}"  "39.98.114.178:8080/AuToUpdateLiuChengXlsServlet"`
echo > ${path}/${log_name}
echo $JieGuo_msg > ${path}/${log_name}

