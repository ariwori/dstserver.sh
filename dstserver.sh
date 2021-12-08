#!/bin/bash

#Author: Ariwori  i@wqlin.com https://wqlin.com

# 屎山代码，重复冗杂，永无重构之日

#
#　　　　　　　 ┏┓　 ┏┓+ +
#　　　　　　　┏┛┻━━━┛┻┓ + +
#　　　　　　　┃　　　　　　　┃ 　
#　　　　　　　┃　　　━　　　┃ ++ + + +
#　　　　　　 ████━████ ┃+
#　　　　　　　┃　　　　　　　┃ +
#　　　　　　　┃　　　┻　　　┃
#　　　　　　　┃　　　　　　　┃ + +
#　　　　　　　┗━┓　　　┏━┛
#　　　　　　　　　┃　　　┃　　　　　　　　　　　
#　　　　　　　　　┃　　　┃ + + + +
#　　　　　　　　　┃　　　┃　　　　Code is far away from bug with the animal protecting　　　　　　　
#　　　　　　　　　┃　　　┃ + 　　　　神兽保佑,代码无bug　　
#　　　　　　　　　┃　　　┃
#　　　　　　　　　┃　　　┃　　+　　　　　　　　　
#　　　　　　　　　┃　 　　┗━━━┓ + +
#　　　　　　　　　┃ 　　　　　　　┣┓
#　　　　　　　　　┃ 　　　　　　　┏┛
#　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
#　　　　　　　　　　┃┫┫　┃┫┫
#　　　　　　　　　　┗┻┛　┗┻┛+ + + +
#

			# if STRINGS.UI.CUSTOMIZATIONSCREEN[string.upper(name)] then
			# 	TextName = STRINGS.UI.CUSTOMIZATIONSCREEN[string.upper(name)]
			# end
			# local ns = name .. " " .. item.value .. " " .._ .. "_" .. group_name .. " " .. TextName
			# local desc = group_data.desc
			# if item.desc then
			# 	desc = item.desc
			# 	if type(desc) == 'function' then
			# 		desc = desc()
			# 	end
			# end
			# for dk, dv in pairs(desc) do
			# 	ns = ns .. " " .. dv.data .. " " .. dv.text
			# end
			# if item.world then
			# 	for wk, wv in pairs(item.world) do
			# 		if wv == 'cave' then
			# 			print(ns)
			# 		end
			# 	end
			# else
			# 	print(ns)
			# end

DST_HOME="${HOME}/DST"
dst_conf_dirname="DoNotStarveTogether"
dst_conf_basedir="${DST_HOME}/Klei"
dst_base_dir="${dst_conf_basedir}/${dst_conf_dirname}"
dst_server_dir="${DST_HOME}/DSTServer"
dst_server_bin_dir="${dst_server_dir}/bin"
dst_server_bin64_dir="${dst_server_dir}/bin64"
dst_bin_cmd="./dontstarve_dedicated_server_nullrenderer"
dst_bin_cmd64="./dontstarve_dedicated_server_nullrenderer_x64"
data_dir="${DST_HOME}/dstscript"
dst_token_file="${data_dir}/clustertoken.txt"
server_conf_file="${data_dir}/server.conf"
dst_cluster_file="${data_dir}/clusterdata.txt"
log_arr_str="${data_dir}/logarr.txt"
ays_log_file="${data_dir}/ays_log_file.txt"
log_save_dir="${dst_conf_basedir}/LogBackup"
mod_cfg_dir="${data_dir}/modconfigure"
cluster_backup_dir="${dst_conf_basedir}/ClusterBackup"
feed_back_link="https://blog.wqlin.com/archives/157.html"
script_url='https://tools.wqlin.com/dst/dstserver.sh'
my_api_link="https://tools.wqlin.com/dst/dst.php"
ugc_directory="${dst_server_dir}/ugc_mods"
parent_mod_dir="${ugc_directory}/content/322330"
# 屏幕输出
Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Yellow_font_prefix="\033[33m"
Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Yellow_font_prefix}[提示]${Font_color_suffix}"
info() {
  echo -e "${Info}" "$1"
}
tip() {
  echo -e "${Tip}" "$1"
}
error() {
  echo -e "${Error}" "$1"
}
# Main menu
Menu() {
  while (true); do
    Get_game_beta_str
    echo -e "\e[33m============欢迎使用饥荒联机版独立服务器脚本[Linux-Steam]============\e[0m"
    echo -e "\e[33m作者：Ariwori(i@wqlin.com) 更新地址==>${feed_back_link}\e[0m"
    echo -e "\e[33m本脚本一切权利归作者所有。未经许可禁止使用本脚本进行任何的商业活动！\e[0m"
    echo -e "\e[31m游戏服务端安装目录：${dst_server_dir} [$gamebeta_str(Version: $(cat "${dst_server_dir}/version.txt"))]\e[0m"
    echo -e "\e[92m[ 1]启动服务器           [ 2]关闭服务器           [ 3]重启服务器\e[0m"
    echo -e "\e[92m[ 4]修改房间设置         [ 5]MOD管理及配置        [ 6]特殊名单管理\e[0m"
    echo -e "\e[92m[ 7]游戏服务端控制台     [ 8]附加功能设置         [ 9]重置脚本数据\e[0m"
    echo -e "\e[92m[10]存档管理             [11]更新游戏服务端       [12]更新MOD\e[0m"
    echo -e "\e[92m[13]当前玩家记录         [14]查看附加进程         [15]测试版本切换\e[0m"
    echo -e "\e[92m[16]更新脚本             [17]删除Steam缓存(游戏更新失败修复使用)\e[0m"
    echo -e "\e[92m[18]强制关停所有进程     [19]游戏依赖检查并修复(卡正在开启测一下)\e[0m"
    echo -e "\e[92m[20]单独重启崩溃的世界(适用于单服务器超多层)      [21]清理备份文件\e[0m"
    getsetting "gamebit"
    echo -e "\e[92m[22]切换服务端程序(32位/64位)   当前服务端为 ${result} 位\e[0m"
    Simple_server_status
    echo -e "\e[33m====================================================================\e[0m"
    echo -e "\e[92m[退出或中断操作请直接按Ctrl+C]请输入命令代号：\e[0m\c"
    read -r cmd
    case "${cmd}" in
    1)
      Start_server
      ;;
    2)
      Close_server
      Exit_auto_update
      ;;
    3)
      Reboot_server
      ;;
    4)
      Change_cluster
      ;;
    5)
      MOD_manager
      ;;
    6)
      List_manager
      ;;
    7)
      Server_console
      ;;
    8)
      Extend_function_setting
      ;;
    9)
      Reset_data
      ;;
    10)
      Cluster_manager
      ;;
    11)
      Update_DST
      ;;
    12)
      Update_MOD
      ;;
    13)
      Show_players
      ;;
    14)
      Get_in_EFS
      ;;
    15)
      Changeversion
      ;;
    16)
      Update_script
      ;;
    17)
      Remove_steam_cache
      ;;
    18)
      echo -e "\e[92m请注意强制关停可能会导致不可预见的问题，是否继续：1.是 2.否   :\e[0m\c"
      read -r fclose
      if [ $fclose -eq 1 ]; then
        tmux ls | cut -d ':' -f1 | while read line; do
          tmux kill-session -t $line
        done
        Pid_kill "dstserver"
        tip "已强制所有进程！"
      fi
      ;;
    19)
      ldd $dst_server_dir/bin/dontstarve_dedicated_server_nullrenderer >$data_dir/ldd.log
      bugstr=""
      while read line; do
        if [ $(echo $line | grep -c "=> not found") -gt 0 ]; then
          bugstr=$bugstr$line
        fi
      done <$data_dir/ldd.log
      if [[ "$bugstr" != "" ]]; then
        tip "游戏依赖缺失! $bugstr"
        tip "尝试修复游戏依赖环境 ..."
        Install_Dependency
        Fix_steamcmd
        tip "游戏依赖修复完毕! 如仍无效请把以下内容复制到作者博客，有偿解决！"
        echo $bugstr
      else
        info "游戏依赖无缺失！请检查其他原因"
      fi
      ;;
    20)
      Reboot_crash_shard
    ;;
    21)
      rm -rf $log_save_dir/*
      rm -rf $cluster_backup_dir/*
      info "所有备份已清理！"
      ;;
    22)
      getsetting "gamebit"
      if [[ $result == "32" ]]
      then
        tochange="64"
      else
        tochange="32"
      fi
      echo -e "\e[92m是否切换服务端程序为 ${tochange} 位：1、是   2、否\e[0m\c"
      read tc
      if [[ $tc -eq 1 ]]
      then
        exchangesetting "gamebit" "${tochange}"
        dst_server_bin_dir=$dst_server_bin64_dir
        dst_bin_cmd=$dst_bin_cmd64
        Fix_steamcmd
        info "已切换，重启服务端后生效！"
      else
        info "取消切换！"
      fi
      ;;
    *)
      error "输入有误！！！"
      ;;
    esac
  done
}
Reboot_crash_shard() {
    Get_current_cluster
    if [[ $cluster != "无" ]]
    then
        if [ -d "$dst_base_dir/${cluster}" ]
        then
            shardarray=$(ls -l "$dst_base_dir/${cluster}" | grep ^d | awk '{print $9}')
            need_reboot_arr=()
            index=0
            for shard in ${shardarray}; do
                if tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
                    info "世界【${shard}】运行正常！"
                else
                    tip "世界【${shard}】异常退出，已加入重启队列！"
                    need_reboot_arr[$index]=$shard
                    index=$(($index + 1))
                fi
            done
            info "正在重启异常退出的世界 ..."
            cd "${dst_server_bin_dir}"
            for shard in ${need_reboot_arr[*]}; do
                unset TMUX
                tmux new-session -s DST_${shard} -d "${dst_bin_cmd} -ugc_directory ${ugc_directory} -persistent_storage_root ${dst_conf_basedir} -conf_dir ${dst_conf_dirname} -cluster ${cluster} -shard ${shard}"
            done
            cd
            rm "${ays_log_file}" >/dev/null 2>&1
            rm $data_dir/log_arr_str*.txt
              touch "${ays_log_file}"
              shardnum=0
              for shard in ${need_reboot_arr[*]}; do
                unset TMUX
                cd ${HOME}
                tmux new-session -s DST_"${shard}"_log -d "./dstserver.sh ay $shard"
                shardnum=$(($shardnum + 1))
              done
              ANALYSIS_SHARD=0
              any_log_index=1
              unset any_old_line
              while (true); do
                if [ "$ANALYSIS_SHARD" -lt $shardnum ]; then
                  anyline=$(sed -n ${any_log_index}p ${ays_log_file})
                  if [[ "$anyline" != "" && "$anyline" != "$any_old_line" ]]; then
                    any_log_index=$(($any_log_index + 1))
                    any_old_line=$anyline
                    if [ $(echo "$anyline" | grep -c ANALYSISLOGDONE) -gt 0 ]; then
                      ANALYSIS_SHARD=$(($ANALYSIS_SHARD + 1))
                    else
                      info "$anyline"
                    fi
                  fi
                else
                  break
                fi
              done
        else
            tip "存档损坏！"
        fi
    else
        tip "未启用存档！"
    fi
}
Remove_steam_cache() {
  rm -rf ${HOME}/Steam >/dev/null 2>&1
  info "安装缓存清理完毕！"
}
Diff_file() {
  cmp -s $1 $2
  if [ $? -eq 1 ]; then
    return 0
  else
    return 1
  fi
}
Update_script() {
  info "正在检查脚本是否有更新 ..."
  wget -T 10 ${script_url} -O /tmp/dstserver.sh -o /tmp/dstupdate.log
  if grep "‘/tmp/dstserver.sh’ saved" /tmp/dstupdate.log >/dev/null 2>&1; then
    if Diff_file /tmp/dstserver.sh ${HOME}/dstserver.sh; then
      if ./dstserver.sh "test" >>/dev/null; then
        mv /tmp/dstserver.sh ${HOME}/dstserver.sh
        chmod +x ${HOME}/dstserver.sh
        tip "脚本已更新并退出，重新运行以使更新生效，如更新后异常请查看脚本更新页面说明！"
        exit
      else
        tip "下载出错，不更新。"
      fi
    else
      info "脚本没有更新可用！"
    fi
  else
    error "无法连接更新服务，请重试，多次不行到博客检查更新地址是否已变更！"
  fi
}
Get_game_beta() {
  [ -f "${server_conf_file}" ] && gamebeta=$(grep "^gamebeta" "${server_conf_file}" | cut -d "=" -f2)
}
Get_game_beta_str() {
  public_str="正式版"
  returnofthembeta_str="旧神归来"
  Get_game_beta
  if [[ $gamebeta == "" ]]; then
    gamebeta="public"
  fi
  gamebeta_str=$(eval echo '$'"$gamebeta"_str)
  if [[ $gamebeta_str == "" ]]; then
    gamebeta_str="测试版"
  fi
}
Changeversion() {
  Get_game_beta_str
  info "当前版本[$gamebeta_str($gamebeta)]，切换为版本：1.正式版 2.旧神归来 3.自定义 0.退出"
  read beta
  case $beta in
  1)
    new_gamebeta="public"
    ;;
  2)
    new_gamebeta="returnofthembeta"
    ;;
  3)
    info "请输入测试版本代码：\c"
    read custom_beta
    new_gamebeta=$custom_beta
    ;;
  4)
    tip "已退出版本切换！"
    ;;
  esac
  if [[ $new_gamebeta != "" ]]; then
    exchangesetting gamebeta $new_gamebeta
    new_gamebeta_str=$(eval echo '$'"$new_gamebeta"_str)
    if [[ $new_gamebeta_str == "" ]]; then
      $new_gamebeta_str="测试版"
    fi
    info "已切换游戏版本为[$new_gamebeta_str($new_gamebeta)]，请更新游戏以生效！"
  fi
}
Get_in_EFS() {
  if tmux has-session -t Auto_update >/dev/null 2>&1; then
    tmux attach -t Auto_update
  else
    tip "附加功能进程未开启或已异常退出！"
  fi
}
Change_cluster() {
  Get_current_cluster
  if [ -d "$dst_base_dir/${cluster}" ]; then
    Set_cluster
  else
    error "当前存档【${cluster}】已被删除或已损坏！"
  fi
}
Server_console() {
  Get_single_shard
  if tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
    info "即将跳转${shard}世界后台。。。退出请按Ctrl + B松开再按D，否则服务器将停止运行！！！"
    sleep 3
    tmux attach-session -t DST_"${shard}"
  else
    tip "${shard}世界未开启或已异常退出！！！"
  fi
}
Get_shard_array() {
  Get_current_cluster
  [[ $cluster != "无" ]] && [ -d "$dst_base_dir/${cluster}" ] && shardarray=$(ls -l "$dst_base_dir/${cluster}" | grep ^d | awk '{print $9}')
}
Get_single_shard() {
  Get_current_cluster
  Get_shard_array
  for shard in ${shardarray}; do
    shardm=$shard
    if [ -f "${dst_base_dir}/${cluster}/${shardm}/server.ini" ]; then
      if [ $(grep 'is_master = true' -c "${dst_base_dir}/${cluster}/${shardm}/server.ini") -gt 0 ]; then
        shardm=$shard
        break
      fi
    else
      error "存档【${cluster}】世界【${shardm}】配置文件server.ini缺失，存档损坏！"
      exit
    fi
  done
  [ -z "$shardm" ] && shard=$shardm
}
Get_current_cluster() {
  [ -f "${server_conf_file}" ] && cluster=$(grep "^cluster" "${server_conf_file}" | cut -d "=" -f2)
  [ -z $cluster ] && cluster="无"
}
Get_server_status() {
  [ -f "${server_conf_file}" ] && serveropen=$(grep "serveropen" "${server_conf_file}" | cut -d "=" -f2)
}
MOD_manager() {
  Get_current_cluster
  if [ -d "${dst_base_dir}/${cluster}" ]; then
    if [ $(ls -l "${dst_base_dir}/${cluster}" | grep -c ^d) -gt 0 ]; then
      Default_mod
      while (true); do
        echo -e "\e[92m【存档：${cluster}】 你要\n1.添加mod       2.删除mod      3.修改MOD配置 \n4.重置MOD配置   5.安装MOD合集  6.返回主菜单\n：\e[0m\c"
        read mc
        case "${mc}" in
        1)
          Listallmod
          Addmod
          ;;
        2)
          flag=true
          Listusedmod
          if [[ $flag == "true" ]]
          then
            Delmod
          fi
          ;;
        3)
          Mod_Cfg
          ;;
        4)
          clear_mod_cfg
          ;;
        5)
          Install_mod_collection
          ;;
        6)
          tip "MOD的更改必须重启服务器后才会生效！！！"
          break
          ;;
        *)
          error "输入有误！！！"
          ;;
        esac
      done
      Removelastcomma
    else
      error "当前存档【${cluster}】已被删除或已损坏！"
    fi
  else
    error "当前存档【${cluster}】已被删除或已损坏！"
  fi
}
Install_mod_collection() {
  [ -f "$data_dir/modcollectionlist.txt" ] && rm -rf "$data_dir/modcollectionlist.txt"
  touch "$data_dir/modcollectionlist.txt"
  echo -e "\e[92m[输入结束请输入数字 0]请输入你的MOD合集ID:\e[0m\c"
  while (true); do
    read clid
    if [ $clid -eq 0 ]; then
      info "合集添加完毕！即将安装 ..."
      break
    else
      echo "ServerModCollectionSetup(\"$clid\")" >>"$data_dir/modcollectionlist.txt"
      info "该MOD合集($clid)已添加到待安装列表。"
    fi
  done
  if [ -s "$data_dir/modcollectionlist.txt" ]; then
    info "正在安装新添加的MOD(合集)，请稍候 。。。"
    if [ ! -d "${dst_base_dir}/downloadmod/Master" ]; then
      mkdir -p "${dst_base_dir}/downloadmod/Master"
    fi
    if tmux has-session -t DST_MODUPDATE >/dev/null 2>&1; then
      tmux kill-session -t DST_MODUPDATE
    fi
    cp "$data_dir/modcollectionlist.txt" "${dst_server_dir}/mods/dedicated_server_mods_setup.lua"
    cd "${dst_server_bin_dir}" || exit 1
    tmux new-session -s DST_MODUPDATE -d "${dst_bin_cmd} -ugc_directory ${ugc_directory} -persistent_storage_root ${dst_conf_basedir} -cluster downloadmod -shard Master"
    sleep 3
    while (true); do
      if tmux has-session -t DST_MODUPDATE >/dev/null 2>&1; then
        if [ $(grep "Your Server Will Not Start" -c "${dst_base_dir}/downloadmod/Master/server_log.txt") -gt 0 ]; then
          info "安装进程已执行完毕，请到添加MOD中查看是否安装成功！"
          tmux kill-session -t DST_MODUPDATE
          break
        fi
      fi
    done
  else
    tip "没有新的MOD合集需要安装！"
  fi
}
clear_mod_cfg() {
  [ -d "$mod_cfg_dir" ] && rm -rf $mod_cfg_dir
  info "所有MOD配置均已重置！"
}
Mod_Cfg() {
  while (true); do
    #clear
    Get_current_cluster
    echo -e "\e[92m【存档：${cluster}】已启用的MOD配置修改===============\e[0m"
    flag=true
    Listusedmod
    if [[ $flag == "true" ]]
    then
      info "请从以上列表选择你要配置的MOD${Red_font_prefix}[编号]${Font_color_suffix},完毕请输数字 0 ！"
      read modid
      if [[ "${modid}" == "0" ]]; then
        info "MOD配置完毕！"
        break
      else
        Truemodid
        Show_mod_cfg
        Write_mod_cfg
      fi
    else
      break
    fi
  done
}
# 传入moddir
Show_mod_cfg() {
  if [ -f "${mod_cfg_dir}/${moddir}.cfg" ]; then
    Get_installed_mod_version
    n_ver=$result
    Get_data_from_file "${mod_cfg_dir}/${moddir}.cfg" mod-version
    c_ver=$result
    if [[ "$n_ver" != "$c_ver" ]]; then
      update_mod_cfg
    fi
  else
    update_mod_cfg
  fi
  Get_data_from_file "${mod_cfg_dir}/${moddir}.cfg" "mod-configureable"
  c_able=$result
  c_line=$(grep "^" -n "${mod_cfg_dir}/${moddir}.cfg" | tail -n 1 | cut -d : -f1)
  if [[ "$c_able" == "true" && "$c_line" -gt 3 ]]; then
    Get_data_from_file "${mod_cfg_dir}/${moddir}.cfg" "mod-version"
    c_ver=$result
    Get_data_from_file "${mod_cfg_dir}/${moddir}.cfg" "mod-name"
    c_name=$(echo $result | sed 's/#/ /g')
    while (true); do
      #clear
      echo -e "\e[92m【修改MOD：$c_name配置】[$c_ver]\e[0m"
      index=1
      cat "${mod_cfg_dir}/${moddir}.cfg" | grep -v "mod-configureable" | grep -v "mod-version" | grep -v "mod-name" | while read line; do
        ss=(${line})
        if [ "${ss[2]}" == "table" ]; then
          value=${ss[1]}
        else
          for ((i = 5; i < ${#ss[*]}; i = $i + 3)); do
            if [ "${ss[$i]}" == "${ss[1]}" ]; then
              value=${ss[$i + 1]}
            fi
          done
        fi
        if [[ "$value" == "不明项勿修改" ]]; then
          value=${ss[1]}
        fi
        value=$(echo "$value" | sed 's/#/ /g')
        label=$(echo "${ss[3]}" | sed 's/#/ /g')
        hover=$(echo "${ss[4]}" | sed 's/#/ /g')
        if [[ "$label" == "" || "$label" == "nolabel" ]]; then
          label=$(echo "${ss[0]}" | sed 's/#/ /g')
          hover="${Red_font_prefix}该项作用不明，请勿轻易修改否则可能出错。详情请查看modinfo.lua文件。${Font_color_suffix}"
        fi
        if [ "${index}" -lt 10 ]; then
          echo -e "\e[33m[ ${index}] $label：${Red_font_prefix}${value}${Font_color_suffix}\n     简介==>$hover\e[0m"
        else
          echo -e "\e[33m[${index}] $label：${Red_font_prefix}${value}${Font_color_suffix}\n     简介==>$hover\e[0m"
        fi
        index=$(($index + 1))
      done
      echo -e "\e[92m===============================================\e[0m"
      unset cmd
      while (true); do
        if [[ "${cmd}" == "" ]]; then
          echo -e "\e[92m请选择你要更改的选项(修改完毕输入数字 0 确认修改并退出)：\e[0m\c"
          read cmd
        else
          break
        fi
      done
      case "${cmd}" in
      0)
        info "更改已保存！"
        break
        ;;
      *)
        cmd=$(($cmd + 3))
        changelist=($(sed -n "${cmd}p" "${mod_cfg_dir}/${moddir}.cfg"))
        label=$(echo "${changelist[3]}" | sed 's/#/ /g')
        if [[ "$label" == "" || "$label" == "nolabel" ]]; then
          label=$(echo "${changelist[0]}" | sed 's/#/ /g')
        fi
        if [ "${changelist[2]}" = "table" ]; then
          tip "${Red_font_prefix}此项为表数据，请直接修改modinfo.lua文件${Font_color_suffix}"
        else
          echo -e "\e[92m请选择$label： \e[0m"
          index=1
          for ((i = 5; i < ${#changelist[*]}; i = $i + 3)); do
            description=$(echo "${changelist[$(($i + 1))]}" | sed 's/#/ /g')
            hover=$(echo "${changelist[$(($i + 2))]}" | sed 's/#/ /g')
            printf "%-30s" "${index}.$description"
            echo -e "\e[92m简介==>$hover\e[0m"
            index=$((${index} + 1))
          done
          echo -e "\e[92m: \e[0m\c"
          read changelistindex
          listnum=$((${changelistindex} - 1))*3
          changelist[1]=${changelist[$(($listnum + 5))]}
        fi
        changestr="${changelist[@]}"
        sed -i "${cmd}c ${changestr}" "${mod_cfg_dir}/${moddir}.cfg"
        ;;
      esac
    done
  fi
}
Write_mod_cfg() {
  Delmodfromshard >/dev/null 2>&1
  rm "${data_dir}/modconfwrite.lua" >/dev/null 2>&1
  touch "${data_dir}/modconfwrite.lua"
  workshopmoddir=${moddir}
  if [ $(echo $moddir | grep -c "workshop") -eq 0 ]; then
    workshopmoddir="workshop-"${moddir}
  fi
  if [ -f "${mod_cfg_dir}/${moddir}.cfg" ]; then
    c_line=$(grep "^" -n "${mod_cfg_dir}/${moddir}.cfg" | tail -n 1 | cut -d : -f1)
    if [[ $c_line -le 3 ]]; then
      echo "  [\"$workshopmoddir\"]={ [\"enabled\"]=true }," >>"${data_dir}/modconfwrite.lua"
    else
      echo "  [\"$workshopmoddir\"]={" >>"${data_dir}/modconfwrite.lua"
      echo "    configuration_options={" >>"${data_dir}/modconfwrite.lua"
      # cindex=4
      cat "${mod_cfg_dir}/${moddir}.cfg" | grep -v "mod-configureable" | grep -v "mod-version" | grep -v "mod-name" | while read lc; do
        lcstr=($lc)
        cfgname=$(echo "${lcstr[0]}" | sed 's/#/ /g')
        if [[ "${lcstr[2]}" != "table" ]]; then
          if [[ "${lcstr[2]}" == "number" ]]; then
            echo -e "      [\"$cfgname\"]=${lcstr[1]}," >>"${data_dir}/modconfwrite.lua"
          elif [[ "${lcstr[2]}" == "string" ]]; then
            echo -e "      [\"$cfgname\"]=\"${lcstr[1]}\"," >>"${data_dir}/modconfwrite.lua"
          elif [[ "${lcstr[2]}" == "boolean" ]]; then
            echo -e "      [\"$cfgname\"]=${lcstr[1]}," >>"${data_dir}/modconfwrite.lua"
          fi
        fi
      done
      echo "    }," >>"${data_dir}/modconfwrite.lua"
      echo "    [\"enabled\"]=true" >>"${data_dir}/modconfwrite.lua"
      echo "  }," >>"${data_dir}/modconfwrite.lua"
    fi
  else
    echo "  [\"$workshopmoddir\"]={ [\"enabled\"]=true }," >>"${data_dir}/modconfwrite.lua"
  fi
  Addmodtoshard >/dev/null 2>&1
}
Get_data_from_file() {
  if [ -f "$1" ]; then
    result=$(grep "^$2" "$1" | head -n 1 | cut -d " " -f3)
  fi
}
Get_installed_mod_version() {
  if [ -f "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" ]; then
    echo "fuc=\"getver\"" >"${data_dir}/modinfo.lua"
    cat "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
    cd "${data_dir}"
    result=$(lua modconf.lua)
    cd ${DST_HOME}
  elif [ -f  "$parent_mod_dir/${moddir}/modinfo.lua" ]
  then
    echo "fuc=\"getver\"" >"${data_dir}/modinfo.lua"
    cat "$parent_mod_dir/${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
    cd "${data_dir}"
    result=$(lua modconf.lua)
    cd ${DST_HOME}
  else
    result="uninstalled"
  fi
}
update_mod_cfg() {
  if [[ -f "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" ]]; then
    cat > "${data_dir}/modinfo.lua" <<-EOF
fuc = "createmodcfg"
modid = "${moddir}"
EOF
    cat "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" >> "${data_dir}/modinfo.lua"
    if [[ -f "${dst_server_dir}/mods/workshop-${moddir}/modinfo_chs.lua" ]]; then
      cat "${dst_server_dir}/mods/workshop-${moddir}/modinfo_chs.lua" >> "${data_dir}/modinfo.lua"
    fi
    cd "${data_dir}"
    lua modconf.lua >/dev/null 2>&1
    if ! lua modconf.lua >/dev/null 2>&1; then
        cat > "${data_dir}/modinfo.lua" <<-EOF
fuc = "createmodcfg"
modid = "${moddir}"
EOF
    cat "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" >> "${data_dir}/modinfo.lua"

    lua modconf.lua >/dev/null 2>&1
    fi
    cd "${DST_HOME}"
  elif [[ -f "$parent_mod_dir/${moddir}/modinfo.lua" ]]; then
    cat >"${data_dir}/modinfo.lua" <<-EOF
fuc = "createmodcfg"
modid = "${moddir}"
EOF
    cat "$parent_mod_dir/${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
    if [[ -f "$parent_mod_dir/${moddir}/modinfo_chs.lua" ]]; then
      cat "$parent_mod_dir/${moddir}/modinfo_chs.lua" >>"${data_dir}/modinfo.lua"
    fi
    cd "${data_dir}"
    lua modconf.lua >/dev/null 2>&1
    if [ $? -gt 1 ]; then
        cat > "${data_dir}/modinfo.lua" <<-EOF
fuc = "createmodcfg"
modid = "${moddir}"
EOF
    cat "$parent_mod_dir/${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
    lua modconf.lua >/dev/null 2>&1
    fi
    cd "${DST_HOME}"
  else
    tip "请先安装并启用MOD！"
    break
  fi
}
MOD_conf() {
  if [[ "${fuc}" == "createmodcfg" ]]; then
    if [[ -f "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" ]]; then
      cat "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
    elif [[ -f "$parent_mod_dir/${moddir}/modinfo.lua" ]]; then
      cat "$parent_mod_dir/${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
    else
      echo "ServerModSetup(\"${moddir}\")" >"${dst_server_dir}/mods/dedicated_server_mods_setup.lua"
      # 当输入多个MODID时，在第一次下载时全部添加下载
      for exmodid in ${inputarray[@]}; do
        if [ $exmodid -gt 100000 ]; then
          echo "ServerModSetup(\"$exmodid\")" >>"${dst_server_dir}/mods/dedicated_server_mods_setup.lua"
        fi
      done
      Download_MOD
    fi
    if [[ -f "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" ]]; then
      if [ ! -f "${mod_cfg_dir}/${moddir}.cfg" ]; then
        update_mod_cfg
      fi
    elif [[ -f "$parent_mod_dir/${moddir}/modinfo.lua" ]]; then
      if [ ! -f "${mod_cfg_dir}/${moddir}.cfg" ]; then
        update_mod_cfg
      fi
    else
      error "MOD安装失败，无法继续请上传MOD或重试！"
      exit 0
    fi
  else
    cat >"${data_dir}/modinfo.lua" <<-EOF
fuc = "${fuc}"
modid = "${moddir}"
used = "${used}"
EOF
    if [[ -f "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" ]]; then
      cat "${dst_server_dir}/mods/workshop-${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
    else
      moddir=$(echo "${moddir}" | tr -cd '[0-9]')
      if [[ -f "$parent_mod_dir/${moddir}/modinfo.lua" ]]; then
        cat "$parent_mod_dir/${moddir}/modinfo.lua" >>"${data_dir}/modinfo.lua"
      else
        echo "name = \"MOD文件已损坏\"" >>"${data_dir}/modinfo.lua"
      fi
    fi
    cd ${data_dir}
    lua modconf.lua >/dev/null 2>&1
    cd ${DST_HOME}
  fi
}
# collectionAllMOD(){
#   cur_parent_dir=""
#   copy=0
#   for moddir in $(ls -F ${dst_server_dir}/ugc_mods/**/**/content/322330); do
#     if [ $(echo $moddir | grep -c "ugc_mods") -gt 0 ]
#     then
#       if [ $(echo $moddir | grep -c "downloadmod") == 0 ]
#       then
#         cur_parent_dir=$(echo $moddir | cut -d ':' -f1)
#         copy=1
#       else
#         copy=0
#       fi
#     else
#       if [ $copy == 1 ]
#       then
#         moddir=$(echo $moddir | cut -d '/' -f1)
#         if [ ! -d $parent_mod_dir/$moddir ]
#         then
#           mkdir $parent_mod_dir/$moddir
#         fi
#         if [ -f $cur_parent_dir/$moddir/modinfo.lua ]
#         then
#           cp -rf $cur_parent_dir/$moddir/modinfo.lua $parent_mod_dir/$moddir/modinfo.lua
#         fi
#       fi
#     fi
#   done
# }
Listallmod() {
  # collectionAllMOD
  if [ ! -f "${data_dir}/mods_setup.lua" ]; then
    touch "${data_dir}/mods_setup.lua"
  fi
  rm -f "${data_dir}/modconflist.lua"
  touch "${data_dir}/modconflist.lua"
  Get_single_shard
  for moddir in $(ls -F "${dst_server_dir}/mods" | grep "/$" | cut -d '/' -f1); do
    if [ $(grep "${moddir}" -c "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua") -gt 0 ]; then
      used="true"
    else
      used="false"
    fi
    if [[ $(echo ${moddir} | grep -c '^workshop') -gt 0 ]]
    then
      moddir=$(echo ${moddir} | cut -d '-' -f2)
    fi
    if [[ "${moddir}" != "" ]]; then
      fuc="list"
      MOD_conf
    fi
  done
    for moddir in $(ls -F $parent_mod_dir | grep "/$" | cut -d '/' -f1); do
        if [ -f $parent_mod_dir/$moddir/modinfo.lua ]; then
          if [ $(grep "${moddir}" -c "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua") -gt 0 ]; then
            used="true"
          else
            used="false"
          fi
          if [[ "${moddir}" != "" ]]; then
            fuc="list"
            MOD_conf
          fi
        fi

    done
  if [ ! -s "${data_dir}/modconflist.lua" ]; then
    tip "没有安装任何MOD"
  else
    grep -n "^" "${data_dir}/modconflist.lua"
  fi
}
Listusedmod() {
  # collectionAllMOD
  rm -f "${data_dir}/modconflist.lua"
  touch "${data_dir}/modconflist.lua"
  Get_single_shard
  for moddir in $(grep "^  \[" "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" | cut -d '"' -f2); do
    used="false"
    # if [ ! -d ${dst_server_dir}/mods/workshop-${moddir} ]
    # then
    #   moddir=$(echo ${moddir} | tr -cd '[0-9]')
    # fi
    if [[ $(echo ${moddir} | grep -c '^workshop') -gt 0 ]]
    then
      moddir=$(echo ${moddir} | cut -d '-' -f2)
    fi
    if [[ "${moddir}" != "" ]]; then
      fuc="list"
      used="true"
      MOD_conf
    fi
  done
  if [ ! -s "${data_dir}/modconflist.lua" ]; then
    tip "没有启用任何MOD，请先启用MOD！！！"
    flag=false
  else
    grep -n "^" "${data_dir}/modconflist.lua"
  fi
}
Addmod() {
  info "请从以上列表选择你要启用的MOD${Red_font_prefix}[编号]${Font_color_suffix}，不存在的直接输入MODID"
  tip "大小超过10M的MOD如果无法在服务器添加下载，请手动上传到服务器再启用！！！"
  info "添加完毕要退出请输入数字 0 ！[可输入多个，如 \"1 2 4-6 7927397293\"]"
  while (true); do
    read modid
    if [[ "${modid}" == "0" ]]; then
      info "添加完毕 ！"
      break
    fi
    if [[ "${modid}" == "" ]]; then
      error "输入不可为空值！！！"
    else
      Getinputlist "$modid"
      for modid in ${inputarray[@]}; do
        Addmodfunc
      done
    fi
  done
  #clear
  info "默认参数配置已写入配置文件，可手动修改，也可通过脚本修改："
  info "${dst_base_dir}/${cluster}/***/modoverrides.lua"
}
Addmodtoshard() {
  Get_shard_array
  for shard in ${shardarray}; do
    if [ -f "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" ]; then
      if [ $(grep "${moddir}" -c "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua") -gt 0 ]; then
        info "${shard}世界该Mod(${moddir})已添加"
      else
        sed -i '1d' "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua"
        cat "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" >"${data_dir}/modconftemp.txt"
        echo "return {" >"${dst_base_dir}/${cluster}/${shard}/modoverrides.lua"
        cat "${data_dir}/modconfwrite.lua" >>"${dst_base_dir}/${cluster}/${shard}/modoverrides.lua"
        cat "${data_dir}/modconftemp.txt" >>"${dst_base_dir}/${cluster}/${shard}/modoverrides.lua"
        info "${shard}世界Mod(${moddir})添加完成"
      fi
    else
      tip "${shard} MOD配置文件未由脚本初始化，无法操作！如你已自行配置请忽略本提示！"
    fi
  done
}
Truemodid() {
  if [ ${modid} -lt 10000 ]; then
    moddir=$(sed -n ${modid}p "${data_dir}/modconflist.lua" | cut -d ':' -f3)
    # if [[ ! -d ${dst_server_dir}/mods/workshop-${modid} ]]; then
    #   moddir=$(echo ${modid} | tr -cd '[0-9]')
    # fi
    if [[ $(echo ${moddir} | grep -c '^workshop') -gt 0 ]]
    then
      moddir=$(echo ${moddir} | cut -d '-' -f2)
    fi
  else
    moddir=${modid}
  fi
  # echo $moddir
}
Addmodfunc() {
  Truemodid
  fuc="createmodcfg"
  MOD_conf
  Write_mod_cfg
  Addmodtoshard
  Removelastcomma
}
Delmodfromshard() {
  Get_shard_array
  for shard in ${shardarray}; do
    if [ -f "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" ]; then
      if [ $(grep "${moddir}" -c "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua") -gt 0 ]; then
        grep -n "^  \[" "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" >"${data_dir}/modidlist.txt"
        lastmodlinenum=$(cat "${data_dir}/modidlist.txt" | tail -n 1 | cut -d ":" -f1)
        up=$(grep "${moddir}" "${data_dir}/modidlist.txt" | cut -d ":" -f1)
        if [ "${lastmodlinenum}" -eq "${up}" ]; then
          down=$(grep "^" -n "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" | tail -n 1 | cut -d ":" -f1)
        else
          down=$(grep -A 1 "${moddir}" "${data_dir}/modidlist.txt" | tail -1 | cut -d ":" -f1)
        fi
        upnum=${up}
        downnum=$((${down} - 1))
        sed -i "${upnum},${downnum}d" "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua"
        info "${shard}世界该Mod(${moddir})已停用！"
      else
        info "${shard}世界该Mod(${moddir})未启用！"
      fi
    else
      tip "${shard} MOD配置文件未由脚本初始化，无法操作！如你已自行配置请忽略本提示！"
    fi
  done
}
# 保证最后一个MOD配置结尾不含逗号
Removelastcomma() {
  for shard in ${shardarray}; do
    if [ -f "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" ]; then
      checklinenum=$(grep "^" -n "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" | tail -n 2 | head -n 1 | cut -d ":" -f1)
      sed -i "${checklinenum}s/,//g" "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua"
    fi
  done
}
Delmod() {
  info "请从以上列表选择你要停用的MOD${Red_font_prefix}[编号]${Font_color_suffix}[可多选，如输入\"1 2 4-6\"],完毕请输数字 0 ！"
  while (true); do
    read modid
    if [[ "${modid}" == "0" ]]; then
      info "MOD删除完毕！"
      break
    else
      Getinputlist "$modid"
      for modid in ${inputarray[@]}; do
        Truemodid
        Delmodfromshard
      done
    fi
  done
}
List_manager() {
  tip "添加的名单设置在重启后生效，且在每一个存档都会生效！"
  while (true); do
    echo -e "\e[92m你要设置：1.管理员  2.黑名单  3.白名单 4.返回主菜单? \e[0m\c"
    read list
    case "${list}" in
    1)
      listfile="alist.txt"
      listname="管理员"
      ;;
    2)
      listfile="blist.txt"
      listname="黑名单"
      ;;
    3)
      listfile="wlist.txt"
      listname="白名单"
      ;;
    4)
      break
      ;;
    *)
      error "输入有误，请输入数字[1-3]"
      ;;
    esac
    while (true); do
      echo -e "\e[92m你要：1.添加${listname} 2.移除${listname} 3.返回上一级菜单? \e[0m\c"
      read addordel
      case "${addordel}" in
      1)
        Addlist
        ;;
      2)
        Dellist
        ;;
      3)
        break
        ;;
      *)
        error "输入有误！"
        ;;
      esac
    done
  done
}
Addlist() {
  echo -e "\e[92m请输入你要添加的KLEIID（KU_XXXXXXX）：(添加完毕请输入数字 0 )\e[0m"
  while (true); do
    read kleiid
    if [[ "${kleiid}" == "0" ]]; then
      info "添加完毕！"
      break
    else
      if [ $(grep "${kleiid}" -c "${data_dir}/${listfile}") -gt 0 ]; then
        info "名单${kleiid}已经存在！"
      else
        echo "${kleiid}" >>"${data_dir}/${listfile}"
        info "名单${kleiid}已添加！"
      fi
    fi
  done
}
Dellist() {
  while (true); do
    echo "=========================================================================="
    grep -n "^" "${data_dir}/${listfile}"
    echo -e "\e[92m请输入你要移除的KLEIID${Red_font_prefix}[编号]${Font_color_suffix}，删除完毕请输入数字 0 \e[0m"
    read kleiid
    if [[ "${kleiid}" == "0" ]]; then
      info "移除完毕！"
      break
    else
      sed -i "${kleid}d" "${data_dir}/${listfile}"
      info "名单已移除！"
    fi
  done
}
Restore_cluster() {
  if [ $(ls $cluster_backup_dir | grep -c ^) -gt 0 ]; then
    echo -e "\e[92m 请选择日期：\c"
    dindex=1
    for ddate in $(ls $cluster_backup_dir); do
      echo -e "$dindex.$ddate   \c"
      dindex=$(($dindex + 1))
    done
    echo -e "\e[0m\c"
    read dddate
    ddddate=$(ls $cluster_backup_dir | head -n $dddate | tail -n 1)
    if [ $(ls $cluster_backup_dir/$ddddate | grep -c ^) -gt 0 ]; then
      ls -rc $cluster_backup_dir/$ddddate | grep -n ^
      echo -e "\e[92m 请选择要恢复的存档：\e[0m\c"
      read clustersnum
      clustersname=$(ls -rc $cluster_backup_dir/$ddddate | head -n $clustersnum | tail -n 1)
      mycluster=$(echo $clustersname | cut -d "_" -f3)
      Get_current_cluster
      Get_server_status
      if [[ "$mycluster" == "$cluster" && "$serveropen" == "true" ]]; then
        error "存档【$mycluster】正在运行，请关闭后再恢复！！"
      else
        tar -xzPf $cluster_backup_dir/$ddddate/$clustersname
        info "存档【$mycluster】已恢复！"
      fi
    else
      error "日期【$ddddate】没有任何备份！"
    fi
  else
    error "当前没有任何备份！"
  fi
}
Cluster_manager() {
  while (true); do
    echo -e "\e[92m你要：1.删除存档  2.恢复存档   3.返回主菜单? \e[0m\c"
    read clusterst
    case $clusterst in
    1)
      Del_cluster
      ;;
    2)
      Restore_cluster
      ;;
    3)
      break
      ;;
    *)
      error "输入有误！！！"
      ;;
    esac
  done
}
Del_cluster() {
  cluster_str="删除"
  inputtips='[可多选，如输入"1 2 4-6"]'
  Choose_exit_cluster
  Getinputlist "$listnum"
  for listnum in ${inputarray[@]}; do
    unset mycluster
    if [ $listnum -ne 0 ]; then
      mycluster=$(cat "/tmp/dirlist.txt" | head -n "${listnum}" | tail -n 1)
    fi
    if [ ! -z $mycluster ]; then
      Get_current_cluster
      Get_server_status
      if [[ "$mycluster" == "$cluster" && "$serveropen" == "true" ]]; then
        error "存档【$mycluster】正在运行，请关闭后再删除！！"
      else
        rm -rf "${dst_base_dir}/${mycluster}" && info "存档【${mycluster}】已删除！"
      fi
    fi
  done
}
Auto_update() {
  Get_single_shard
  if tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
    tmux kill-session -t Auto_update >/dev/null 2>&1
    sleep 1
    cd ${HOME}
    tmux new-session -s Auto_update -d "./dstserver.sh au"
    info "附加功能已开启！"
  else
    tip "${shard}世界未开启或已异常退出！无法启用附加功能！"
  fi
}
Show_players() {
  Get_single_shard
  if tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
    if tmux has-session -t Show_players >/dev/null 2>&1; then
      info "即将跳转。。。退出请按Ctrl + B松开再按D！"
      tmux attach-session -t Show_players
      sleep 1
    else
      cd ${HOME}
      tmux new-session -s Show_players -d "./dstserver.sh sp"
      tmux split-window -t Show_players
      tmux send-keys -t Show_players:0 "./dstserver.sh sa" C-m
      info "进程已开启。。。请再次执行命令进入!"
    fi
  else
    tip "${shard}世界未开启或已异常退出！无法启用玩家日志后台！"
  fi
}
Update_DST() {
  info "这将关闭正在运行的服务器，是否继续？ 1.是 2.否："
  read cp
  if [ $cp -eq 1 ]; then
    Get_server_status
    cur_serveropen=${serveropen}
    Reboot_announce
    Close_server
    Install_Game
  else
    tip "操作已中断！"
  fi
}
###################################################################
Reboot_server() {
  info "服务器重启中。。。请稍候。。。"
  Reboot_announce
  Close_server
  Run_server
}
exchangesetting() {
  if [ ! -f "${server_conf_file}" ]; then
    touch "${server_conf_file}"
  fi
  if [ $(grep "^$1=" -c "${server_conf_file}") -gt 0 ]; then
    linen=$(grep "^$1=" -n "${server_conf_file}" | cut -d ":" -f1)
    sed -i ${linen}d "${server_conf_file}"
    echo "$1=$2" >>"${server_conf_file}"
  else
    echo "$1=$2" >>"${server_conf_file}"
  fi
}
getsetting() {
  if [ ! -f "${server_conf_file}" ]; then
    touch "${server_conf_file}"
  fi
  unset result
  if [ $(grep $1 -c "${server_conf_file}") -gt 0 ]; then
    result=$(grep ^$1 "${server_conf_file}" | head -n 1 | cut -d "=" -f2)
  fi
}
Run_server() {
  Get_current_cluster
  if [ -d "$dst_base_dir/${cluster}" ]; then
    Get_shard_array
    exchangesetting serveropen true
    Default_mod
    Set_list
    Start_shard
    info "服务器开启中。。。请稍候。。。"
    sleep 5
    Start_check
    Auto_update
  else
    error "存档【${cluster}】已被删除或损坏！服务器无法开启！"
  fi
}
Reboot_announce() {
  Get_shard_array
  for shard in ${shardarray}; do
    if tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
      tmux send-keys -t DST_"${shard}" "c_announce(\"${shard}世界服务器因改动或更新需要重启，预计耗时三分钟，给你带来的不便还请谅解！\")" C-m
    fi
    sleep 3
  done
}
Start_server() {
  info "本操作将会关闭已开启的服务器 ..."
  Close_server
  Exit_auto_update
  echo -e "\e[92m是否新建存档: [y|n] (默认: y): \e[0m\c"
  read yn
  [[ -z "${yn}" ]] && yn="y"
  new_cluster="false"
  if [[ "${yn}" == [Yy] ]]; then
    echo -e "\e[92m请输入新建存档名称：（不要包含中文、符号和空格）\e[0m"
    read cluster
    if [ -d "${dst_base_dir}/${cluster}" ]; then
      tip "${cluster}存档已存在！是否删除已有存档：1.是  2.否？ "
      read ifdel
      if [[ "$ifdel" -eq 1 ]]; then
        rm -rf "${dst_base_dir}/${cluster}"
      else
        rm -rf "${dst_base_dir}/${cluster}/cluster.ini"
      fi
    fi
    mkdir -p "${dst_base_dir}/${cluster}"
    Set_cluster
    Set_token
    new_cluster="true"
  else
    cluster_str="开启"
    Choose_exit_cluster
    unset cluster
    if [ $listnum -ne 0 ]; then
      cluster=$(cat "/tmp/dirlist.txt" | head -n "${listnum}" | tail -n 1)
    fi
    [ -z $cluster ] && error "遇到错误中断！" && exit 0
  fi
  exchangesetting "cluster" "${cluster}"
  if [[ "${new_cluster}" == "true" ]]; then
    Addshard
  fi
  Import_cluster
  echo -e "\e[92m是否直接启动服务器：1.是  2.返回添加MOD\n\e[0m\c"
  read isaddmod
  case "${isaddmod}" in
  1)
    Run_server
    ;;
  *)
    #clear
    MOD_manager
    ;;
  esac
}
Addshard() {
  while (true); do
    echo -e "\e[92m请选择要添加的世界：1.地面世界  2.洞穴世界  3.添加完成选我\n          快捷设置：4.熔炉MOD[Forged forge]房选我  5.熔炉MOD[ReForged]房选我\n                    6.挂机MOD房选我  7.暴食MOD房选我\n\e[0m\c"
    read shardop
    case "${shardop}" in
    1)
      Addforest
      ;;
    2)
      Addcaves
      ;;
    3)
      break
      ;;
    4)
      Forgeworld
      break
      ;;
    5)
      Reforgedworld
      break
      ;;
    6)
      AOGworld
      break
      ;;
    7)
      Gorgeworld
      break
      ;;
    *)
      error "输入有误，请输入[1-5]！！！"
      ;;
    esac
  done
}
Shardconfig() {
  tip "只能有一个主世界！！！熔炉MOD房、挂机MOD房和暴食MOD房只能选主世界！！！"
  info "已创建${shardtype}[$sharddir]，这是一个：1. 主世界   2. 附从世界？ "
  read ismaster
  if [ "${ismaster}" -eq 1 ]; then
    shardmaster="true"
    shardid=1
  else
    shardmaster="false"
    # 非主世界采用随机数，防止冲突
    shardid=$RANDOM
  fi
  encode="true"
  tip "如需要玩家存档对应文件夹为玩家KleiID,以下请选否"
  info "编码玩家存档路径：1. 是   2. 否？ "
  read isencode
  if [ "${isencode}" -eq 2 ]; then
    encode="false"
  fi
  cat >"${dst_base_dir}/${cluster}/$sharddir/server.ini" <<-EOF
[NETWORK]
server_port = $((10997 + $idnum))


[SHARD]
is_master = $shardmaster
name = ${shardname}${idnum}
id = $shardid


[ACCOUNT]
encode_user_path = $encode


[STEAM]
master_server_port = $((27016 + $idnum))
authentication_port = $((8766 + $idnum))
EOF
}
Getidnum() {
  idnum=$(($(ls -l "${dst_base_dir}/${cluster}" | grep ^d | awk '{print $9}' | grep -c ^) + 1))
}
Createsharddir() {
  sharddir="${shardname}${idnum}"
  mkdir -p "${dst_base_dir}/${cluster}/$sharddir"
}
Addcaves() {
  shardtype="洞穴世界"
  shardname="Caves"
  Getidnum
  Createsharddir
  Shardconfig
  Set_world
}
Addforest() {
  shardtype="地面世界"
  shardname="Forest"
  Getidnum
  Createsharddir
  Shardconfig
  Set_world
}
Gorgeworld() {
  shardtype="暴食MOD房"
  shardname="Gorge"
  Wmodid="1918927570"
  Wconfigfile="quagmire.lua"
  Getidnum
  Createsharddir
  Shardconfig
  Set_world
}
Forgeworld() {
  shardtype="熔炉MOD房[Forged Forge]"
  shardname="Forge"
  Wmodid="1531169447"
  Wconfigfile="lavaarena.lua"
  Getidnum
  Createsharddir
  Shardconfig
  Set_world
}
Reforgedworld() {
  shardtype="熔炉MOD房[ReForged]"
  shardname="ReForge"
  Wmodid="1938752683"
  Wconfigfile="lavaarena1.lua"
  Getidnum
  Createsharddir
  Shardconfig
  Set_world
}
AOGworld() {
  shardtype="挂机MOD房"
  shardname="AOG"
  Wmodid="1210706609"
  Wconfigfile="aog.lua"
  Getidnum
  Createsharddir
  Shardconfig
  Set_world
}
# 导入存档
Import_cluster() {
  Default_mod
  if [ ! -f "${dst_base_dir}/${cluster}/cluster_token.txt" ]; then
    Set_token
  fi
}
Choose_exit_cluster() {
  echo -e "\e[92m已有存档[退出输入数字 0]：\e[0m"
  ls -l "${dst_base_dir}" | awk '/^d/ {print $NF}' | grep -v downloadmod >"/tmp/dirlist.txt"
  index=1
  for dirlist in $(cat "/tmp/dirlist.txt"); do
    if [ $(ls -l "${dst_base_dir}/${dirlist}" | grep -c ^d) -gt 0 ]; then
      if [ -f "${dst_base_dir}/${dirlist}/cluster.ini" ]; then
        cluster_name_str=$(cat "${dst_base_dir}/${dirlist}/cluster.ini" | grep '^cluster_name =' | cut -d " " -f3)
      fi
      if [[ "$cluster_name_str" == "" ]]; then
        cluster_name_str="不完整或已损坏的存档"
      fi
    else
      cluster_name_str="不完整或已损坏的存档"
    fi
    echo "${index}. ${dirlist}：${cluster_name_str}"
    let index++
  done
  echo -e "\e[92m请输入你要${cluster_str}的存档${Red_font_prefix}[编号]${Font_color_suffix}${inputtips}：\e[0m\c"
  read listnum
}
Close_server() {
  tip "正在关闭已开启的服务器（有的话） ..."
  unset nodone
  Get_shard_array
  for shard in ${shardarray}; do
    if tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
      tmux send-keys -t DST_"${shard}" "c_save()" C-m
      exchangesetting serveropen false
      nodone="true"
    else
      info "${shard}世界服务器未开启！"
    fi
  done
  sleep 8
  if [[ "$nodone" == "true" ]]; then
    for shard in ${shardarray}; do
      tmux kill-session -t DST_"${shard}" >/dev/null 2>&1
      info "${shard}世界服务器已关闭！"
      sleep 3
    done
  fi
  Exit_show_players
}
Exit_auto_update() {
  if tmux has-session -t Auto_update >/dev/null 2>&1; then
    tmux kill-session -t Auto_update >/dev/null 2>&1
  fi
  ps -ef | grep 'dstserver.sh au' | grep -v grep | awk '{print $2}' | xargs kill >/dev/null 2>&1
  info "附加功能进程已停止运行 ..."
}
Exit_show_players() {
  if tmux has-session -t Show_players >/dev/null 2>&1; then
    tmux kill-session -t Show_players >/dev/null 2>&1
  fi
  ps -ef | grep 'dstserver.sh sp' | grep -v grep | awk '{print $2}' | xargs kill >/dev/null 2>&1
  info "玩家记录后台进程已停止运行 ..."
}
Set_cluster() {
  while (true); do
    #clear
    tip "存档设置修改后需要重启服务器方能生效！！！"
    echo -e "\e[92m=============【存档槽：${cluster}】===============\e[0m"
    index=1
    cat "${dst_cluster_file}" | while read line; do
      ss=(${line})
      if [ "${ss[4]}" != "readonly" ]; then
        if [ "${ss[4]}" == "choose" ]; then
          for ((i = 5; i < ${#ss[*]}; i++)); do
            if [ "${ss[$i]}" == "${ss[1]}" ]; then
              value=${ss[$i + 1]}
            fi
          done
        else
          # 处理替代空格的#号
          value=$(echo "${ss[1]}" | sed 's/#/ /g')
        fi
        if [ ${index} -lt 10 ]; then
          echo -e "\e[33m[ ${index}] ${ss[2]}：${value}\e[0m"
        else
          echo -e "\e[33m[${index}] ${ss[2]}：${value}\e[0m"
        fi
      fi
      index=$((${index} + 1))
    done
    echo -e "\e[92m===============================================\e[0m"
    echo -e "\e[31m要开熔炉或暴食MOD房的要先在这里修改游戏模式为对应的游戏模式！！！\e[0m"
    echo -e "\e[92m===============================================\e[0m"
    unset cmd
    while (true); do
      if [[ "${cmd}" == "" ]]; then
        echo -e "\e[92m请选择你要更改的选项(修改完毕输入数字 0 确认修改并退出)：\e[0m\c"
        read cmd
      else
        break
      fi
    done
    case "${cmd}" in
    0)
      info "更改已保存！"
      break
      ;;
    *)
      changelist=($(sed -n ${cmd}p "${dst_cluster_file}"))
      if [ "${changelist[4]}" = "choose" ]; then
        echo -e "\e[92m请选择${changelist[2]}：\e[0m\c"
        index=1
        for ((i = 5; i < ${#changelist[*]}; i = $i + 2)); do
          echo -e "\e[92m${index}.${changelist[$(($i + 1))]}  \e[0m\c"
          index=$((${index} + 1))
        done
        echo -e "\e[92m: \e[0m\c"
        read changelistindex
        listnum=$(($((${changelistindex} - 1)) * 2))
        changelist[1]=${changelist[$(($listnum + 5))]}
      else
        echo -e "\e[92m请输入${changelist[2]}：\e[0m\c"
        read changestr
        # 处理空格
        changestr=$(echo "${changestr}" | sed 's/ /#/g')
        changelist[1]=${changestr}
      fi
      changestr=${changelist[@]}
      sed -i "${cmd}c ${changestr}" ${dst_cluster_file}
      ;;
    esac
  done
  if [ -f "${dst_base_dir}/${cluster}/cluster.ini" ]; then
    rm -rf "${dst_base_dir}/${cluster}/cluster.ini"
  fi
  type=('[STEAM]' '[GAMEPLAY]' '[NETWORK]' '[MISC]' '[SHARD]')
  # for (( i=0; i<${#type[*]}; i++ ))
  for i in "${!type[@]}"; do
    echo "${type[i]}" >>"${dst_base_dir}/${cluster}/cluster.ini"
    cat "${dst_cluster_file}" | grep -v "script_ver" | while read lc; do
      lcstr=($lc)
      if [ "${lcstr[3]}" == "${type[i]}" ]; then
        if [ "${lcstr[1]}" == "无" ]; then
          lcstr[1]=""
        fi
        # 还原空格
        value_str=$(echo "${lcstr[1]}" | sed 's/#/ /g')
        echo "${lcstr[0]} = ${value_str}" >>"${dst_base_dir}/${cluster}/cluster.ini"
      fi
    done
    echo "" >>"${dst_base_dir}/${cluster}/cluster.ini"
  done
  # 暴食MOD不可以暂停
  if [ $(grep "^game_mode" ${dst_base_dir}/${cluster}/cluster.ini | cut -d " " -f3) == "quagmire" ]; then
    str=$(grep "^pause_when_empty" ${dst_base_dir}/${cluster}/cluster.ini)
    newstr="pause_when_empty = fasle"
    sed -i "s/$str/$newstr/g" ${dst_base_dir}/${cluster}/cluster.ini
  fi
}

Set_token() {
  if [ -f "${dst_token_file}" ]; then
    default_token=$(cat "${dst_token_file}")
  else
    default_token="pds-g^KU_6yNrwFkC^9WDPAGhDM9eN6y2v8UUjEL3oDLdvIkt2AuDQB2mgaGE="
  fi
  info "当前预设的服务器令牌：\n ${default_token}"
  echo -e "\e[92m是否更改？ 1.是  2.否 : \e[0m\c"
  read ch
  if [ $ch -eq 1 ]; then
    tip "请输入或粘贴你的令牌到此处："
    read mytoken
    mytoken=$(echo "${mytoken}" | sed 's/ //g')
    echo "${mytoken}" >"${dst_token_file}"
    info "已更改服务器默认令牌！"
  else
    echo "${default_token}" >${dst_token_file}
  fi
  cat "${dst_token_file}" >"${dst_base_dir}/${cluster}/cluster_token.txt"
}
Set_list() {
  if [ ! -f "${data_dir}/alist.txt" ]; then
    touch "${data_dir}/alist.txt"
  fi
  if [ ! -f "${data_dir}/blist.txt" ]; then
    touch "${data_dir}/blist.txt"
  fi
  if [ ! -f "${data_dir}/wlist.txt" ]; then
    touch "${data_dir}/wlist.txt"
  fi
  cat "${data_dir}/alist.txt" >"${dst_base_dir}/${cluster}/adminlist.txt"
  cat "${data_dir}/blist.txt" >"${dst_base_dir}/${cluster}/blocklist.txt"
  cat "${data_dir}/wlist.txt" >"${dst_base_dir}/${cluster}/whitelist.txt"
}
Set_world() {
  if [[ "${shardtype}" == "熔炉MOD房[Forged Forge]" || "${shardtype}" == "挂机MOD房" || "${shardtype}" == "暴食MOD房" || "${shardtype}" == "熔炉MOD房[ReForged]" ]]; then
    cat "${data_dir}/${Wconfigfile}" >"${dst_base_dir}/${cluster}/${sharddir}/leveldataoverride.lua"
    info "${shardtype}世界配置已写入！"
    info "正在检查${shardtype}MOD是否已下载安装 。。。"
    if [ -f "${dst_server_dir}/mods/workshop-${Wmodid}/modinfo.lua" ]; then
      info "${shardtype}MOD已安装 。。。"
    else
      tip "${shardtype}MOD未安装 。。。即将下载 。。。"
      echo "ServerModSetup(\"${Wmodid}\")" >"${dst_server_dir}/mods/dedicated_server_mods_setup.lua"
      Download_MOD
    fi
    if [ -f "${dst_server_dir}/mods/workshop-${Wmodid}/modinfo.lua" ]; then
      Default_mod
      modid=${Wmodid}
      Get_shard_array
      Addmodfunc
      info "${shardtype}MOD已启用 。。。"
    else
      tip "${shardtype}MOD启用失败，请自行检查原因或反馈 。。。"
    fi
  else
    info "是否修改${shardtype}[${sharddir}]配置？：1.是 2.否（默认为上次配置）"
    read wc
    configure_file="${data_dir}/${shardname}leveldata.txt"
    data_file="${dst_base_dir}/${cluster}/${sharddir}/leveldataoverride.lua"
    if [ "${wc}" -ne 2 ]; then
      Set_world_config
    fi
    Write_in ${shardname}
  fi
}
Set_world_config() {
  while (true); do
    #clear
    index=1
    linenum=1
    list=(WORLDSETTINGS_global WORLDSETTINGS_survivors WORLDSETTINGS_misc WORLDSETTINGS_resources WORLDSETTINGS_animals WORLDSETTINGS_monsters WORLDSETTINGS_giants WORLDGEN_global WORLDGEN_misc WORLDGEN_resources WORLDGEN_animals WORLDGEN_monsters)
    liststr=(
      ================================世界选项-全局================================
      ================================世界选项-冒险家==============================
      ================================世界选项-世界================================
      ================================世界选项-资源再生============================
      ================================世界选项-生物================================
      ================================世界选项-敌对生物============================
      ================================世界选项-巨兽================================
      ================================世界生成-全局================================
      ================================世界生成-世界================================
      ================================世界生成-资源================================
      ================================世界生成-生物及刷新店=========================
      ================================世界生成-敌对生物及刷新店=====================
    )
    for ((j = 0; j < ${#list[*]}; j++)); do
      echo -e "\n\e[92m${liststr[$j]}\e[0m"
      cat "${configure_file}" | while read line; do
        ss=(${line})
        if [ "${#ss[@]}" -gt 4 ]; then
          if [ "${index}" -gt 3 ]; then
            printf "\n"
            index=1
          fi
          for ((i = 4; i < ${#ss[*]}; i++)); do
            if [ "${ss[$i]}" == "${ss[1]}" ]; then
              value=${ss[$i + 1]}
            fi
          done
          if [ "${list[$j]}" == "${ss[2]}" ]; then
            if [ ${linenum} -lt 10 ]; then
              printf "%-21s\t" "[ ${linenum}]${ss[3]}: ${value}"
            else
              printf "%-21s\t" "[${linenum}]${ss[3]}: ${value}"
            fi
            index=$((${index} + 1))
          fi
        fi
        linenum=$((${linenum} + 1))
      done
    done
    printf "\n"
    unset cmd
    while (true); do
      if [[ "${cmd}" == "" ]]; then
        echo -e "\e[92m请选择你要更改的选项(修改完毕输入数字 0 确认修改并退出)： \e[0m\c"
        read cmd
      else
        break
      fi
    done
    case "${cmd}" in
    0)
      info "更改已保存！"
      break
      ;;
    *)
      changelist=($(sed -n "${cmd}p" "${configure_file}"))
      echo -e "\e[92m请选择${changelist[3]}： \e[0m\c"
      index=1
      for ((i = 4; i < ${#changelist[*]}; i = $i + 2)); do
        echo -e "\e[92m${index}.${changelist[$(($i + 1))]}   \e[0m\c"
        index=$((${index} + 1))
      done
      echo -e "\e[92m: \e[0m\c"
      read changelistindex
      listnum=$((${changelistindex} - 1))*2
      changelist[1]=${changelist[$(($listnum + 4))]}
      changestr="${changelist[@]}"
      sed -i "${cmd}c ${changestr}" "${configure_file}"
      ;;
    esac
  done
}
Write_in() {
  data_num=$(grep -n "^" "${configure_file}" | tail -n 1 | cut -d : -f1)
  cat "${data_dir}/${1}start.lua" >"${data_file}"
  index=1
  cat "${configure_file}" | while read line; do
    ss=(${line})
    if [ "${index}" -lt "${data_num}" ]; then
      char=","
    else
      char=""
    fi
    index=$((${index} + 1))
    if [[ "${ss[1]}" == "highlyrandom" ]]; then
      str="${ss[0]}=\"highly random\"${char}"
    else
      str="[\"${ss[0]}\"]=\"${ss[1]}\"${char}"
    fi
    echo "    ${str}" >>"${data_file}"
  done
  cat "${data_dir}/${1}end.lua" >>"${data_file}"
}
Default_mod() {
  Get_shard_array
  for shard in ${shardarray}; do
    if [ ! -f "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" ]; then
      echo 'return {
}' >"${dst_base_dir}/${cluster}/${shard}/modoverrides.lua"
    fi
  done
}
Setup_mod() {
  if [ -f "${data_dir}/mods_setup.lua" ]; then
    rm -rf "${data_dir}/mods_setup.lua"
  fi
  touch "${data_dir}/mods_setup.lua"
  Get_single_shard
  dir=$(cat "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" | grep "workshop" | cut -f2 -d '"' | cut -d "-" -f2)
  for moddir in ${dir}; do
    if [ $(grep "${moddir}" -c "${data_dir}/mods_setup.lua") -eq 0 ]; then
      # checkmodupdate ${moddir}
      # if [[ $result == "true" ]]
      # then
      # echo "ServerModSetup(\"${moddir}\")" >> "${data_dir}/mods_setup.lua"
      # fi
      echo "ServerModSetup(\"${moddir}\")" >>"${data_dir}/mods_setup.lua"
    fi
  done
  cp "${data_dir}/mods_setup.lua" "${dst_server_dir}/mods/dedicated_server_mods_setup.lua"
  info "添加启用的MODID到MOD更新配置文件！"
}
Start_shard() {
  Setup_mod
  Backup_cluster
  Save_log
  cd "${dst_server_bin_dir}"
  for shard in ${shardarray}; do
    unset TMUX
    tmux new-session -s DST_${shard} -d "${dst_bin_cmd} -ugc_directory ${ugc_directory} -persistent_storage_root ${dst_conf_basedir} -conf_dir ${dst_conf_dirname} -cluster ${cluster} -shard ${shard}"
  done
}
Save_log() {
  Clean_old_log
  Get_single_shard
  if [ -f "$dst_base_dir/$cluster/$shard/server_chat_log.txt" ]; then
    cur_day=$(date "+%F")
    if [ ! -d "$log_save_dir/$cur_day" ]; then
      mkdir -p "$log_save_dir/$cur_day"
    fi
    cur_time=$(date "+%H%M%S")
    echo "$(date)" >>"$log_save_dir/$cur_day/server_chat_log_backup_${cluster}_${shard}_${cur_time}.txt"
    cp "$dst_base_dir/$cluster/$shard/server_chat_log.txt" "$log_save_dir/$cur_day/server_chat_log_backup_${cluster}_${shard}_${cur_time}.txt"
    echo "$(date)" >>"$log_save_dir/$cur_day/server_log_backup_${cluster}_${shard}_${cur_time}.txt"
    cp "$dst_base_dir/$cluster/$shard/server_log.txt" "$log_save_dir/$cur_day/server_log_backup_${cluster}_${shard}_${cur_time}.txt"
    info "【${shard}】旧的日志已备份到\n       ==>【$log_save_dir/$cur_day】"
    info "【保留一周内的日志备份】。"
  fi
}
Clean_old_log() {
  # 保留一周的日志
  all=$(ls $log_save_dir | grep -c ^)
  if [ $all -gt 6 ]; then
    info "清理旧的备份日志 ..."
    del=$(($all - 7))
    for dir in $(ls $log_save_dir | sort | head -n $del); do
      rm -rf $log_save_dir/$dir
    done
  fi
}
Backup_cluster() {
  Clean_old_cluster
  Get_current_cluster
  Get_single_shard
  if [ -d "$dst_base_dir/$cluster/$shard/save" ]; then
    cur_day=$(date "+%F")
    if [ ! -d "$cluster_backup_dir/$cur_day" ]; then
      mkdir -p "$cluster_backup_dir/$cur_day"
    fi
    cur_time=$(date "+%H%M%S")
    tar -zcPf "$cluster_backup_dir/$cur_day/cluster_backup_${cluster}_${cur_time}.tar.gz" "$dst_base_dir/$cluster"
    info "【${shard}】旧的存档已备份到\n       ==>【$cluster_backup_dir/$cur_day】"
    info "【保留三天内的存档备份】。"
  fi
}
Clean_old_cluster() {
  # 保留三天的存档备份
  if [ ! -d "$cluster_backup_dir" ]; then
    mkdir -p "$cluster_backup_dir"
  fi
  all=$(ls $cluster_backup_dir | grep -c ^)
  if [ $all -gt 2 ]; then
    info "清理旧的存档备份 ..."
    del=$(($all - 2))
    for dir in $(ls $cluster_backup_dir | sort | head -n $del); do
      rm -rf $cluster_backup_dir/$dir
    done
  fi
}
Pid_kill() {
  kill $(ps -ef | grep -v grep | grep $1 | awk '{print $2}')
}
Start_check() {
  Get_shard_array
  rm "${ays_log_file}" >/dev/null 2>&1
  touch "${ays_log_file}"
  shardnum=0
  for shard in $shardarray; do
    unset TMUX
    cd ${HOME}
    tmux new-session -s DST_"${shard}"_log -d "./dstserver.sh ay $shard"
    shardnum=$(($shardnum + 1))
  done
  ANALYSIS_SHARD=0
  any_log_index=1
  unset any_old_line
  while (true); do
    if [ "$ANALYSIS_SHARD" -lt $shardnum ]; then
      anyline=$(sed -n ${any_log_index}p ${ays_log_file})
      if [[ "$anyline" != "" && "$anyline" != "$any_old_line" ]]; then
        any_log_index=$(($any_log_index + 1))
        any_old_line=$anyline
        if [ $(echo "$anyline" | grep -c ANALYSISLOGDONE) -gt 0 ]; then
          ANALYSIS_SHARD=$(($ANALYSIS_SHARD + 1))
        else
          info "$anyline"
        fi
      fi
    else
      break
    fi
  done
}
printf_and_save_log() {
  printf "%-7s：%s\n" "$1" "$2" | tee -a $3
}
Analysis_log() {
  log_file="${dst_base_dir}/${cluster}/$1/server_log.txt"
  cat ${log_arr_str} >"${data_dir}/log_arr_str_$1.txt"
  if [ -f "$log_file" ]; then
    RES="nodone"
    retrytime=0
    while [ $RES == "nodone" ]; do
      while read line; do
        line_0=$(echo $line | cut -d '@' -f1)
        line_1=$(echo $line | cut -d '@' -f2)
        line_2=$(echo $line | cut -d '@' -f3)
        if [ $(grep "$line_1" -c $log_file) -gt 0 ]; then
          if [ $line_0 == "1" ]; then
            printf_and_save_log $1 $line_2 "$ays_log_file"
            RES="done"
            printf_and_save_log $1 "ANALYSISLOGDONE" "$ays_log_file"
            break
          fi
          printf_and_save_log "$1" "$line_2" "$ays_log_file"
          num=$(grep "$line_2" -n "${data_dir}/log_arr_str_$1.txt" | cut -d ":" -f1)
          sed -i "${num}d" "${data_dir}/log_arr_str_$1.txt"
          break
        fi
        if [ $(grep ".*Connection to master failed. Waiting to reconnect.*" -c $log_file) -gt $retrytime ]; then
          retrytime=$(($retrytime + 1))
          if [ $retrytime -le 5 ]; then
            printf_and_save_log $1 "连接失败！第$retrytime次连接重试！" "$ays_log_file"
            sleep 10
          else
            printf_and_save_log $1 "存档错误！无法连接主世界" "$ays_log_file"
            RES="done"
            printf_and_save_log $1 "ANALYSISLOGDONE" "$ays_log_file"
            break
          fi
        fi
      done <"${data_dir}/log_arr_str_$1.txt"
    done
  fi
}
#############################################################################
First_run_check() {
  Open_swap
  Mkdstdir
  if [ ! -f "${dst_server_dir}/version.txt" ]; then
    Initfiles
    info "检测到你是首次运行脚本，需要进行必要的配置，所需时间由服务器带宽决定，大概一个小时 ..."
    Install_Dependency
    Install_Steamcmd
    info "安装游戏服务端 ..."
    Install_Game
    Fix_steamcmd
    if [ ! -f "${dst_server_dir}/version.txt" ]; then
      error "安装失败，请重试！多次重试仍无效请反馈!" && exit 1
    fi
    info "首次运行配置完毕，你可以创建新的世界了。"
  fi
}
Initfiles() {
  cat >$data_dir/aog.lua <<-EOF
return {
  desc="别傻了，还是充钱来的实在！！！",
  hideminimap=false,
  id="Auto_Open_Gift",
  location="forest",
  max_playlist_position=9,
  min_playlist_position=0,
  name="偷渡欧洲宝地--由脚本dstserver.sh创建！",
  numrandom_set_pieces=0,
  ordered_story_setpieces={  },
  override_level_string=false,
  ["overrides"]={
    ["alternatehunt"]="never",
    ["angrybees"]="never",
    ["antliontribute"]="never",
    ["autumn"]="never",
    ["bearger"]="never",
    ["beefalo"]="never",
    ["beefaloheat"]="never",
    ["bees"]="never",
    ["berrybush"]="never",
    ["birds"]="never",
    ["boons"]="never",
    ["branching"]="never",
    ["butterfly"]="never",
    ["buzzard"]="never",
    ["cactus"]="never",
    ["carrot"]="never",
    ["catcoon"]="never",
    ["chess"]="never",
    ["day"]="onlyday",
    ["deciduousmonster"]="never",
    ["deerclops"]="never",
    ["disease_delay"]="none",
    ["dragonfly"]="never",
    ["flint"]="never",
    ["flowers"]="never",
    ["frograin"]="never",
    ["goosemoose"]="never",
    ["grass"]="never",
    ["has_ocean"]=true,
    ["houndmound"]="never",
    ["hounds"]="never",
    ["hunt"]="never",
    ["keep_disconnected_tiles"]=true,
    ["krampus"]="never",
    ["layout_mode"]="LinkNodesByKeys",
    ["liefs"]="never",
    ["lightning"]="never",
    ["lightninggoat"]="never",
    ["loop"]="never",
    ["lureplants"]="never",
    ["marshbush"]="never",
    ["merm"]="never",
    ["meteorshowers"]="never",
    ["meteorspawner"]="never",
    ["moles"]="never",
    ["mushroom"]="never",
    ["no_joining_islands"]=true,
    ["no_wormholes_to_disconnected_tiles"]=true,
    ["penguins"]="never",
    ["perd"]="never",
    ["petrification"]="none",
    ["pigs"]="never",
    ["ponds"]="never",
    ["prefabswaps_start"]="classic",
    ["rabbits"]="never",
    ["reeds"]="never",
    ["regrowth"]="veryslow",
    ["roads"]="never",
    ["rock"]="never",
    ["rock_ice"]="never",
    ["sapling"]="never",
    ["season_start"]="autumn",
    ["specialevent"]="auto",
    ["spiders"]="never",
    ["spring"]="noseason",
    ["start_location"]="default",
    ["summer"]="noseason",
    ["tallbirds"]="never",
    ["task_set"]="Auto_Open_Gift",
    ["tentacles"]="never",
    ["touchstone"]="never",
    ["trees"]="never",
    ["tumbleweed"]="never",
    ["walrus"]="never",
    ["weather"]="never",
    ["wildfires"]="never",
    ["winter"]="noseason",
    ["world_size"]="small",
    ["wormhole_prefab"]="wormhole"
  },
  ["random_set_pieces"]={},
  ["required_prefabs"]={ "multiplayer_portal" },
  ["substitutes"]={},
  ["version"]=4
}
EOF

  cat >$data_dir/Cavesend.lua <<-EOF
  },
  required_prefabs={ "multiplayer_portal" },
  ["settings_desc"]="探查洞穴…… 一起！",
  ["settings_id"]="DST_CAVE",
  ["settings_name"]="洞穴",
  ["substitutes"]={  },
  ["version"]=4,
  ["worldgen_desc"]="探查洞穴…… 一起！",
  ["worldgen_id"]="DST_CAVE",
  ["worldgen_name"]="洞穴"
}
EOF

  cat >$data_dir/Cavesstart.lua <<-EOF
return {
  background_node_range={ 0, 1 },
  desc="由脚本dstserver.sh创建！",
  hideminimap=false,
  id="DST_CAVE",
  location="cave",
  max_playlist_position=999,
  min_playlist_position=0,
  name="洞穴探险--由脚本dstserver.sh创建！",
  numrandom_set_pieces=0,
  override_level_string=false,
  overrides={
EOF

  cat >$data_dir/Cavesleveldata.txt <<-EOF
branching default WORLDGEN_misc 分支 never 从不 least 最少 default 默认 most 最多 random 随机
touchstone default WORLDGEN_misc 试金石 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
world_size default WORLDGEN_misc 世界大小 small 小 medium 中 default 大 huge 巨大
prefabswaps_start default WORLDGEN_misc 开始资源多样化 classic 经典 default 默认 highlyrandom 非常随机
loop default WORLDGEN_misc 环形 never 从不 default 默认 always 总是
boons default WORLDGEN_misc 失败的冒险家 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
cavelight default WORLDGEN_misc 洞穴光照 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
start_location default WORLDGEN_misc 出生点 lavaarena 默认 plus 额外资源 darkness 黑暗 quagmire_startlocation 默认 caves 洞穴 default 默认
task_set default WORLDGEN_misc 生物群落 default 联机版 cave_default 地下 quagmire_taskset 暴食 classic 经典 lavaarena_taskset 熔炉
season_start default WORLDGEN_global 起始季节 default 秋 winter 冬 spring 春 summer 夏 autumn|spring 春或秋 winter|summer 冬季或夏季 autumn|winter|spring|summer 随机
slurper default WORLDGEN_animals 缀食者 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
monkey default WORLDGEN_animals 穴居猴桶 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
rocky default WORLDGEN_animals 石虾 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
bunnymen default WORLDGEN_animals 兔屋 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
slurtles default WORLDGEN_animals 蛞蝓龟窝 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
fissure default WORLDGEN_monsters 梦魇裂隙 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
spiders default WORLDGEN_monsters 蜘蛛巢 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
tentacles default WORLDGEN_monsters 触手 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
chess default WORLDGEN_monsters 发条装置 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
worms default WORLDGEN_monsters 洞穴蠕虫 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
cave_spiders default WORLDGEN_monsters 蛛网岩 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
bats default WORLDGEN_monsters 蝙蝠 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
grass default WORLDGEN_resources 草 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
rock default WORLDGEN_resources 巨石 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
mushroom default WORLDGEN_resources 蘑菇 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
cave_ponds default WORLDGEN_resources 池塘 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
sapling default WORLDGEN_resources 树苗 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
berrybush default WORLDGEN_resources 浆果丛 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
trees default WORLDGEN_resources 树（所有） never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
reeds default WORLDGEN_resources 芦苇 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
flint default WORLDGEN_resources 燧石 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
fern default WORLDGEN_resources 洞穴蕨类 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
flower_cave default WORLDGEN_resources 荧光花 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
mushtree default WORLDGEN_resources 蘑菇树 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
wormlights default WORLDGEN_resources 发光浆果 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
marshbush default WORLDGEN_resources 尖灌木 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
lichen default WORLDGEN_resources 苔藓 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
banana default WORLDGEN_resources 洞穴香蕉 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
spiderqueen default WORLDSETTINGS_giants 蜘蛛女王 never 无 rare 很少 default 默认 often 较多 always 大量
liefs default WORLDSETTINGS_giants 树精守卫 never 无 rare 很少 default 默认 often 较多 always 大量
toadstool default WORLDSETTINGS_giants 毒菌蟾蜍 never 无 rare 很少 default 默认 often 较多 always 大量
fruitfly default WORLDSETTINGS_giants 果蝇王 never 无 rare 很少 default 默认 often 较多 always 大量
krampus default WORLDSETTINGS_global 坎普斯 never 无 rare 很少 default 默认 often 较多 always 大量
autumn default WORLDSETTINGS_global 秋 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
spring default WORLDSETTINGS_global 春 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
specialevent default WORLDSETTINGS_global 活动 none 无 default 自动 crow_carnival 盛夏鸦年华 hallowed_nights 万圣夜 winters_feast 冬季盛宴 year_of_the_gobbler 火鸡之年 year_of_the_varg 座狼之年 year_of_the_pig 猪王之年 year_of_the_carrat 胡萝卜鼠之年 year_of_the_beefalo 皮弗娄牛之年
beefaloheat default WORLDSETTINGS_global 皮弗娄牛交配频率 never 无 rare 很少 default 默认 often 较多 always 大量
winter default WORLDSETTINGS_global 冬 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
day default WORLDSETTINGS_global 昼夜选项 default 默认 longday 长 白天 longdusk 长 黄昏 longnight 长 夜晚 noday 无 白天 nodusk 无 黄昏 nonight 无 夜晚 onlyday 仅 白天 onlydusk 仅 黄昏 onlynight 仅 夜晚
summer default WORLDSETTINGS_global 夏 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
rocky_setting default WORLDSETTINGS_animals 石虾 never 无 rare 很少 default 默认 often 较多 always 大量
monkey_setting default WORLDSETTINGS_animals 穴居猴 never 无 rare 很少 default 默认 often 较多 always 大量
moles_setting default WORLDSETTINGS_animals 鼹鼠 never 无 rare 很少 default 默认 often 较多 always 大量
dustmoths default WORLDSETTINGS_animals 尘蛾 never 无 rare 很少 default 默认 often 较多 always 大量
snurtles default WORLDSETTINGS_animals 蜗牛龟 never 无 rare 很少 default 默认 often 较多 always 大量
slurtles_setting default WORLDSETTINGS_animals 蛞蝓龟 never 无 rare 很少 default 默认 often 较多 always 大量
grassgekkos default WORLDSETTINGS_animals 草壁虎转化 never 无 rare 很少 default 默认 often 较多 always 大量
lightfliers default WORLDSETTINGS_animals 球状光虫 never 无 rare 很少 default 默认 often 较多 always 大量
bunnymen_setting default WORLDSETTINGS_animals 兔人 never 无 rare 很少 default 默认 often 较多 always 大量
pigs_setting default WORLDSETTINGS_animals 猪 never 无 rare 很少 default 默认 often 较多 always 大量
mushgnome default WORLDSETTINGS_animals 蘑菇地精 never 无 rare 很少 default 默认 often 较多 always 大量
spiders_setting default WORLDSETTINGS_monsters 蜘蛛 never 无 rare 很少 default 默认 often 较多 always 大量
bats_setting default WORLDSETTINGS_monsters 蝙蝠 never 无 rare 很少 default 默认 often 较多 always 大量
spider_dropper default WORLDSETTINGS_monsters 穴居悬蛛 never 无 rare 很少 default 默认 often 较多 always 大量
spider_warriors default WORLDSETTINGS_monsters 蜘蛛战士 never 无 default 默认
merms default WORLDSETTINGS_monsters 鱼人 never 无 rare 很少 default 默认 often 较多 always 大量
spider_spitter default WORLDSETTINGS_monsters 喷射蜘蛛 never 无 rare 很少 default 默认 often 较多 always 大量
spider_hider default WORLDSETTINGS_monsters 洞穴蜘蛛 never 无 rare 很少 default 默认 often 较多 always 大量
nightmarecreatures default WORLDSETTINGS_monsters 遗迹梦魇 never 无 rare 很少 default 默认 often 较多 always 大量
molebats default WORLDSETTINGS_monsters 裸鼹鼠蝙蝠 never 无 rare 很少 default 默认 often 较多 always 大量
flower_cave_regrowth default WORLDSETTINGS_resources 荧光花 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
regrowth default WORLDSETTINGS_resources 重生速度 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
mushtree_moon_regrowth default WORLDSETTINGS_resources 月亮蘑菇树 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
mushtree_regrowth default WORLDSETTINGS_resources 蘑菇树 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
lightflier_flower_regrowth default WORLDSETTINGS_resources 球状光虫花 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
spawnprotection default WORLDSETTINGS_survivors 防骚扰出生保护 never 无 default 自动检测 always 总是
seasonalstartingitems default WORLDSETTINGS_survivors 季节起始物品 never 无 default 默认
extrastartingitems default WORLDSETTINGS_survivors 额外起始资源 0 总是 5 第5天后 default 第10天后 15 第15天后 20 第20天后 none 从不
shadowcreatures default WORLDSETTINGS_survivors 理智怪兽 never 无 rare 很少 default 默认 often 较多 always 大量
brightmarecreatures default WORLDSETTINGS_survivors 启蒙怪兽 never 无 rare 很少 default 默认 often 较多 always 大量
dropeverythingondespawn default WORLDSETTINGS_survivors 离开游戏后物品掉落 default 默认 always 所有
atriumgate default WORLDSETTINGS_misc 远古大门 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
earthquakes default WORLDSETTINGS_misc 地震 never 无 rare 很少 default 默认 often 较多 always 大量
weather default WORLDSETTINGS_misc 雨 never 无 rare 很少 default 默认 often 较多 always 大量
wormattacks default WORLDSETTINGS_misc 洞穴蠕虫攻击 never 无 rare 很少 default 默认 often 较多 always 大量
layout_mode RestrictNodesByKey other 其他
start_location caves other 其他
task_set cave_default other 其他
wormhole_prefab tentacle_pillar other 其他
EOF

  cat >$data_dir/clusterdata.txt <<-EOF
cluster_name 由脚本dstserver.sh创建！ 房间名称 [NETWORK] read
cluster_description 由脚本dstserver.sh创建！ 房间简介 [NETWORK] read
cluster_intention social 游戏风格 [NETWORK] choose social 休闲 cooperative 合作 competitive 竞赛 madness 疯狂
game_mode survival 游戏模式 [GAMEPLAY] choose endless 无尽 survival 生存 wilderness 荒野 lavaarena 熔炉 quagmire 暴食
cluster_language zh 游戏语言 [NETWORK] choose zh 简体中文 en 英语
steam_group_id 0 Steam群组ID [STEAM] read
steam_group_admins false 群组官员设为管理员 [STEAM] choose true 开启 false 关闭
steam_group_only false 仅群组成员可进 [STEAM] choose true 开启 false 关闭
pause_when_empty true 无人暂停 [GAMEPLAY] choose true 开启 false 关闭
vote_enabled true 投票 [GAMEPLAY] choose true 开启 false 关闭
pvp false PVP竞技 [GAMEPLAY] choose true 开启 false 关闭
whitelist_slots 0 房间预留位置个数 [NETWORK] read
idle_timeout 0 挂机超时踢出时间 [NETWORK] read
max_snapshots 10 最大存档快照数 [MISC] read
cluster_password 无 房间密码[设无密码请输入无！！！] [NETWORK] read
max_players 6 最大玩家人数 [GAMEPLAY] read
master_ip 127.0.0.1 主世界IP(多服务器必须修改此项) [SHARD] read
lan_only_cluster false 仅局域网 [NETWORK] readonly
offline_cluster false 离线模式 [NETWORK] readonly
autosaver_enabled true 自动保存 [NETWORK] readonly
tick_rate 15 主客机同步频率 [NETWORK] readonly
console_enabled true 控制台 [MISC] readonly
shard_enabled true 多世界 [SHARD] readonly
bind_ip 0.0.0.0 绑定IP [SHARD] readonly
master_port 10888 游戏端口 [SHARD] readonly
cluster_key Ariwori 多世界通信秘钥 [SHARD] readonly
EOF

  cat >$data_dir/Forestend.lua <<-EOF
},
  ["random_set_pieces"]={
    "Sculptures_2",
    "Sculptures_3",
    "Sculptures_4",
    "Sculptures_5",
    "Chessy_1",
    "Chessy_2",
    "Chessy_3",
    "Chessy_4",
    "Chessy_5",
    "Chessy_6",
    "Maxwell1",
    "Maxwell2",
    "Maxwell3",
    "Maxwell4",
    "Maxwell6",
    "Maxwell7",
    "Warzone_1",
    "Warzone_2",
    "Warzone_3"
  },
  ["required_prefabs"]={ "multiplayer_portal" },
  ["required_setpieces"]={ "Sculptures_1", "Maxwell5" },
  ["substitutes"]={},
  ["version"]=4,
  ["settings_desc"]="标准《饥荒》体验。",
  ["settings_id"]="SURVIVAL_TOGETHER",
  ["settings_name"]="标准森林",
  ["worldgen_desc"]="标准《饥荒》体验。",
  ["worldgen_id"]="SURVIVAL_TOGETHER",
  ["worldgen_name"]="标准森林"
}
EOF

  cat >$data_dir/Foreststart.lua <<-EOF
return {
  ["desc"]="由脚本dstserver.sh创建！",
  ["hideminimap"]=false,
  id="SURVIVAL_TOGETHER",
  ["location"]="forest",
  ["max_playlist_position"]=999,
  ["min_playlist_position"]=0,
  ["name"]="游山玩水--由脚本dstserver.sh创建！",
  ["numrandom_set_pieces"]=4,
  ["override_level_string"]=false,
  overrides={
    ["has_ocean"]=true,
    ["no_joining_islands"]=true,
    ["no_wormholes_to_disconnected_tiles"]=true,
    ["keep_disconnected_tiles"]=true,
EOF

  cat >$data_dir/Forestleveldata.txt <<-EOF
branching default WORLDGEN_misc 分支 never 从不 least 最少 default 默认 most 最多 random 随机
touchstone default WORLDGEN_misc 试金石 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
world_size default WORLDGEN_misc 世界大小 small 小 medium 中 default 大 huge 巨大
prefabswaps_start default WORLDGEN_misc 开始资源多样化 classic 经典 default 默认 highlyrandom 非常随机
loop default WORLDGEN_misc 环形 never 从不 default 默认 always 总是
moon_fissure default WORLDGEN_misc 天体裂隙 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
terrariumchest default WORLDGEN_misc 泰拉瑞亚 never 无 default 默认
boons default WORLDGEN_misc 失败的冒险家 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
start_location default WORLDGEN_misc 出生点 lavaarena 默认 plus 额外资源 darkness 黑暗 quagmire_startlocation 默认 caves 洞穴 default 默认
task_set default WORLDGEN_misc 生物群落 default 联机版 cave_default 地下 quagmire_taskset 暴食 classic 经典 lavaarena_taskset 熔炉
season_start default WORLDGEN_global 起始季节 default 秋 winter 冬 spring 春 summer 夏 autumn|spring 春或秋 winter|summer 冬季或夏季 autumn|winter|spring|summer 随机
beefalo default WORLDGEN_animals 皮弗娄牛 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
lightninggoat default WORLDGEN_animals 伏特羊 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
catcoon default WORLDGEN_animals 空心树桩 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
rabbits default WORLDGEN_animals 兔洞 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_fruitdragon default WORLDGEN_animals 沙拉蝾螈 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
ocean_wobsterden default WORLDGEN_animals 龙虾窝 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moles default WORLDGEN_animals 鼹鼠洞 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
ocean_shoal default WORLDGEN_animals 鱼群 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
bees default WORLDGEN_animals 蜜蜂蜂窝 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
pigs default WORLDGEN_animals 猪屋 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
buzzard default WORLDGEN_animals 秃鹫 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_carrot default WORLDGEN_animals 胡萝卜鼠 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
tallbirds default WORLDGEN_monsters 高脚鸟 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
walrus default WORLDGEN_monsters 海象营地 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
spiders default WORLDGEN_monsters 蜘蛛巢 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
ocean_waterplant ocean_default WORLDGEN_monsters 海草 ocean_never 无 ocean_rare 很少 ocean_uncommon 较少 ocean_default 默认 ocean_often 较多 ocean_mostly 很多 ocean_always 大量 ocean_insane 疯狂
angrybees default WORLDGEN_monsters 杀人蜂蜂窝 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
tentacles default WORLDGEN_monsters 触手 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_spiders default WORLDGEN_monsters 破碎蜘蛛洞 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
chess default WORLDGEN_monsters 发条装置 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
houndmound default WORLDGEN_monsters 猎犬丘 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
merm default WORLDGEN_monsters 漏雨的小屋 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
grass default WORLDGEN_resources 草 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
rock default WORLDGEN_resources 巨石 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
ocean_seastack ocean_default WORLDGEN_resources 浮堆 ocean_never 无 ocean_rare 很少 ocean_uncommon 较少 ocean_default 默认 ocean_often 较多 ocean_mostly 很多 ocean_always 大量 ocean_insane 疯狂
ocean_bullkelp default WORLDGEN_resources 公牛海带 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
mushroom default WORLDGEN_resources 蘑菇 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
flowers default WORLDGEN_resources 花，邪恶花 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_berrybush default WORLDGEN_resources 石果灌木丛 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
ponds default WORLDGEN_resources 池塘 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_bullkelp default WORLDGEN_resources 海岸公牛海带 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_starfish default WORLDGEN_resources 海星 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
sapling default WORLDGEN_resources 树苗 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_hotspring default WORLDGEN_resources 温泉 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
rock_ice default WORLDGEN_resources 迷你冰川 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_sapling default WORLDGEN_resources 月亮树苗 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
berrybush default WORLDGEN_resources 浆果丛 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
meteorspawner default WORLDGEN_resources 流星区域 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
trees default WORLDGEN_resources 树（所有） never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
reeds default WORLDGEN_resources 芦苇 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_tree default WORLDGEN_resources 月树 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
flint default WORLDGEN_resources 燧石 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
tumbleweed default WORLDGEN_resources 风滚草 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
carrot default WORLDGEN_resources 胡萝卜 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
cactus default WORLDGEN_resources 仙人掌 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
marshbush default WORLDGEN_resources 尖灌木 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
moon_rock default WORLDGEN_resources 月亮石 never 无 rare 很少 uncommon 较少 default 默认 often 较多 mostly 很多 always 大量 insane 疯狂
eyeofterror default WORLDSETTINGS_giants 恐怖之眼 never 无 rare 很少 default 默认 often 较多 always 大量
crabking default WORLDSETTINGS_giants 帝王蟹 never 无 rare 很少 default 默认 often 较多 always 大量
spiderqueen default WORLDSETTINGS_giants 蜘蛛女王 never 无 rare 很少 default 默认 often 较多 always 大量
bearger default WORLDSETTINGS_giants 熊獾 never 无 rare 很少 default 默认 often 较多 always 大量
liefs default WORLDSETTINGS_giants 树精守卫 never 无 rare 很少 default 默认 often 较多 always 大量
dragonfly default WORLDSETTINGS_giants 龙蝇 never 无 rare 很少 default 默认 often 较多 always 大量
deerclops default WORLDSETTINGS_giants 独眼巨鹿 never 无 rare 很少 default 默认 often 较多 always 大量
klaus default WORLDSETTINGS_giants 克劳斯 never 无 rare 很少 default 默认 often 较多 always 大量
deciduousmonster default WORLDSETTINGS_giants 毒桦栗树 never 无 rare 很少 default 默认 often 较多 always 大量
beequeen default WORLDSETTINGS_giants 蜂王 never 无 rare 很少 default 默认 often 较多 always 大量
malbatross default WORLDSETTINGS_giants 邪天翁 never 无 rare 很少 default 默认 often 较多 always 大量
antliontribute default WORLDSETTINGS_giants 蚁狮贡品 never 无 rare 很少 default 默认 often 较多 always 大量
fruitfly default WORLDSETTINGS_giants 果蝇王 never 无 rare 很少 default 默认 often 较多 always 大量
goosemoose default WORLDSETTINGS_giants 麋鹿鹅 never 无 rare 很少 default 默认 often 较多 always 大量
krampus default WORLDSETTINGS_global 坎普斯 never 无 rare 很少 default 默认 often 较多 always 大量
autumn default WORLDSETTINGS_global 秋 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
spring default WORLDSETTINGS_global 春 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
specialevent default WORLDSETTINGS_global 活动 none 无 default 自动 crow_carnival 盛夏鸦年华 hallowed_nights 万圣夜 winters_feast 冬季盛宴 year_of_the_gobbler 火鸡之年 year_of_the_varg 座狼之年 year_of_the_pig 猪王之年 year_of_the_carrat 胡萝卜鼠之年 year_of_the_beefalo 皮弗娄牛之年
beefaloheat default WORLDSETTINGS_global 皮弗娄牛交配频率 never 无 rare 很少 default 默认 often 较多 always 大量
winter default WORLDSETTINGS_global 冬 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
day default WORLDSETTINGS_global 昼夜选项 default 默认 longday 长 白天 longdusk 长 黄昏 longnight 长 夜晚 noday 无 白天 nodusk 无 黄昏 nonight 无 夜晚 onlyday 仅 白天 onlydusk 仅 黄昏 onlynight 仅 夜晚
summer default WORLDSETTINGS_global 夏 noseason 无 veryshortseason 极短 shortseason 短 default 默认 longseason 长 verylongseason 极长 random 随机
fishschools default WORLDSETTINGS_animals 鱼群 never 无 rare 很少 default 默认 often 较多 always 大量
birds default WORLDSETTINGS_animals 鸟 never 无 rare 很少 default 默认 often 较多 always 大量
rabbits_setting default WORLDSETTINGS_animals 兔子 never 无 rare 很少 default 默认 often 较多 always 大量
perd default WORLDSETTINGS_animals 火鸡 never 无 rare 很少 default 默认 often 较多 always 大量
bees_setting default WORLDSETTINGS_animals 蜜蜂 never 无 rare 很少 default 默认 often 较多 always 大量
penguins default WORLDSETTINGS_animals 企鸥 never 无 rare 很少 default 默认 often 较多 always 大量
moles_setting default WORLDSETTINGS_animals 鼹鼠 never 无 rare 很少 default 默认 often 较多 always 大量
gnarwail default WORLDSETTINGS_animals 一角鲸 never 无 rare 很少 default 默认 often 较多 always 大量
butterfly default WORLDSETTINGS_animals 蝴蝶 never 无 rare 很少 default 默认 often 较多 always 大量
catcoons default WORLDSETTINGS_animals 浣猫 never 无 rare 很少 default 默认 often 较多 always 大量
grassgekkos default WORLDSETTINGS_animals 草壁虎转化 never 无 rare 很少 default 默认 often 较多 always 大量
bunnymen_setting default WORLDSETTINGS_animals 兔人 never 无 rare 很少 default 默认 often 较多 always 大量
pigs_setting default WORLDSETTINGS_animals 猪 never 无 rare 很少 default 默认 often 较多 always 大量
wobsters default WORLDSETTINGS_animals 龙虾 never 无 rare 很少 default 默认 often 较多 always 大量
sharks default WORLDSETTINGS_monsters 鲨鱼 never 无 rare 很少 default 默认 often 较多 always 大量
spiders_setting default WORLDSETTINGS_monsters 蜘蛛 never 无 rare 很少 default 默认 often 较多 always 大量
mutated_hounds default WORLDSETTINGS_monsters 恐怖猎犬 never 无 default 默认
squid default WORLDSETTINGS_monsters 鱿鱼 never 无 rare 很少 default 默认 often 较多 always 大量
penguins_moon default WORLDSETTINGS_monsters 月石企鸥 never 无 default 默认
moon_spider default WORLDSETTINGS_monsters 破碎蜘蛛 never 无 rare 很少 default 默认 often 较多 always 大量
bats_setting default WORLDSETTINGS_monsters 蝙蝠 never 无 rare 很少 default 默认 often 较多 always 大量
lureplants default WORLDSETTINGS_monsters 食人花 never 无 rare 很少 default 默认 often 较多 always 大量
hound_mounds default WORLDSETTINGS_monsters 猎犬 never 无 rare 很少 default 默认 often 较多 always 大量
cookiecutters default WORLDSETTINGS_monsters 饼干切割机 never 无 rare 很少 default 默认 often 较多 always 大量
mosquitos default WORLDSETTINGS_monsters 蚊子 never 无 rare 很少 default 默认 often 较多 always 大量
wasps default WORLDSETTINGS_monsters 杀人蜂 never 无 rare 很少 default 默认 often 较多 always 大量
frogs default WORLDSETTINGS_monsters 青蛙 never 无 rare 很少 default 默认 often 较多 always 大量
spider_warriors default WORLDSETTINGS_monsters 蜘蛛战士 never 无 default 默认
merms default WORLDSETTINGS_monsters 鱼人 never 无 rare 很少 default 默认 often 较多 always 大量
walrus_setting default WORLDSETTINGS_monsters 海象 never 无 rare 很少 default 默认 often 较多 always 大量
regrowth default WORLDSETTINGS_resources 重生速度 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
saltstack_regrowth default WORLDSETTINGS_resources 盐堆 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
carrots_regrowth default WORLDSETTINGS_resources 胡萝卜 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
deciduoustree_regrowth default WORLDSETTINGS_resources 桦栗树 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
flowers_regrowth default WORLDSETTINGS_resources 花 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
moon_tree_regrowth default WORLDSETTINGS_resources 月树 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
evergreen_regrowth default WORLDSETTINGS_resources 常青树 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
twiggytrees_regrowth default WORLDSETTINGS_resources 多枝树 never 无 veryslow 极慢 slow 慢 default 默认 fast 快 veryfast 极快
spawnprotection default WORLDSETTINGS_survivors 防骚扰出生保护 never 无 default 自动检测 always 总是
seasonalstartingitems default WORLDSETTINGS_survivors 季节起始物品 never 无 default 默认
extrastartingitems default WORLDSETTINGS_survivors 额外起始资源 0 总是 5 第5天后 default 第10天后 15 第15天后 20 第20天后 none 从不
shadowcreatures default WORLDSETTINGS_survivors 理智怪兽 never 无 rare 很少 default 默认 often 较多 always 大量
brightmarecreatures default WORLDSETTINGS_survivors 启蒙怪兽 never 无 rare 很少 default 默认 often 较多 always 大量
dropeverythingondespawn default WORLDSETTINGS_survivors 离开游戏后物品掉落 default 默认 always 所有
meteorshowers default WORLDSETTINGS_misc 流星频率 never 无 rare 很少 default 默认 often 较多 always 大量
hunt default WORLDSETTINGS_misc 狩猎 never 无 rare 很少 default 默认 often 较多 always 大量
alternatehunt default WORLDSETTINGS_misc 追猎惊喜 never 无 rare 很少 default 默认 often 较多 always 大量
lightning default WORLDSETTINGS_misc 闪电 never 无 rare 很少 default 默认 often 较多 always 大量
weather default WORLDSETTINGS_misc 雨 never 无 rare 很少 default 默认 often 较多 always 大量
hounds default WORLDSETTINGS_misc 猎犬袭击 never 无 rare 很少 default 默认 often 较多 always 大量
frograin default WORLDSETTINGS_misc 青蛙雨 never 无 rare 很少 default 默认 often 较多 always 大量
wildfires default WORLDSETTINGS_misc 野火 never 无 rare 很少 default 默认 often 较多 always 大量
petrification default WORLDSETTINGS_misc 森林石化 none 无 few 慢 default 默认 many 快 max 极快
layout_mode LinkNodesByKeys other 其他
wormhole_prefab wormhole other 虫洞生物
EOF

  cat >$data_dir/quagmire.lua <<-EOF
return {
  background_node_range={ 0, 0 },
  desc="你能经受暴食的挑战吗？--由脚本dstserver.sh创建！",
  hideminimap=false,
  id="QUAGMIRE",
  location="quagmire",
  max_playlist_position=999,
  min_playlist_position=0,
  name="暴食：你会做饭吗？--由脚本dstserver.sh创建！",
  numrandom_set_pieces=0,
  override_level_string=false,
  overrides={
    boons="never",
    branching="random",
    disease_delay="none",
    keep_disconnected_tiles=false,
    layout_mode="RestrictNodesByKey",
    loop_percent=0,
    no_joining_islands=true,
    no_wormholes_to_disconnected_tiles=true,
    petrification="none",
    poi="never",
    prefabswaps_start="classic",
    protected="never",
    roads="never",
    season_start="default",
    start_location="quagmire_startlocation",
    task_set="quagmire_taskset",
    touchstone="never",
    traps="never",
    wildfires="never",
    world_size="small"
  },
  required_prefabs={ "quagmire_portal" },
  substitutes={  },
  version=4
}
EOF

  cat >$data_dir/lavaarena.lua <<-EOF
return {
    background_node_range={ 0, 1 },
    desc="由脚本dstserver.sh创建！",
    hideminimap=false,
    id="LAVAARENA",
    location="lavaarena",
    max_playlist_position=999,
    min_playlist_position=0,
    name="熔炉斗兽场--由脚本dstserver.sh创建！",
    numrandom_set_pieces=0,
    override_level_string=false,
    overrides={
      has_ocean=false,
      boons="never",
      keep_disconnected_tiles=true,
      layout_mode="RestrictNodesByKey",
      poi="never",
      protected="never",
      roads="never",
      season_start="default",
      start_location="lavaarena",
      task_set="lavaarena_taskset",
      touchstone="never",
      traps="never",
      world_size="small"
    },
    required_prefabs={ "lavaarena_portal" },
    substitutes={  },
    version=4
  }
EOF

  cat >$data_dir/lavaarena1.lua <<-EOF
return {
  ["background_node_range"]={ 0, 1 },
  ["desc"]="你敢进入熔炉证明自己吗？",
  ["hideminimap"]=false,
  id="LAVAARENA",
  ["location"]="lavaarena",
  ["max_playlist_position"]=999,
  ["min_playlist_position"]=0,
  ["name"]="熔炉斗兽场--由脚本dstserver.sh创建！",
  ["numrandom_set_pieces"]=0,
  ["override_level_string"]=false,
  ["overrides"]={
    ["boons"]="never",
    ["keep_disconnected_tiles"]=true,
    ["layout_mode"]="RestrictNodesByKey",
    ["no_joining_islands"]=true,
    ["no_wormholes_to_disconnected_tiles"]=true,
    ["poi"]="never",
    ["protected"]="never",
    ["roads"]="never",
    ["season_start"]="default",
    ["start_location"]="lavaarena",
    ["task_set"]="lavaarena_taskset",
    ["touchstone"]="never",
    ["traps"]="never",
    ["world_size"]="small"
  },
  ["required_prefabs"]={ "lavaarena_portal" },
  ["substitutes"]={  },
  ["version"]=4
}
EOF

  cat >$data_dir/logarr.txt <<-EOF
0@.*Mounting file system databundles/scripts.zip successful.*@加载游戏文件完成。。。
0@.*OnLoadUserIdList: .*DoNotStarveTogether.*@加载房间配置完成。。。
0@.*GameSpecific initialize: Okay.*@开始运行服务端程序。。。
0@.*DownloadMods.*@开始下载或更新MOD并加载MOD配置，MOD多/大这里会卡久，请耐心等。。。
0@.*Online Server Started on port: .*@开始收集服务器配置。。。
0@.*Generating SURVIVAL Mode Level.*@正在创建世界。。。
0@.*About to start a shard with these settings:.*@正在连接世界。。。
1@.*World .* is now connected.*@世界连接成功。。。服务器开启成功！
1@.*Your Server Will Not Start.*@令牌缺失。。。服务器开启失败！
1@.*LUA is now ready!.*@服务器开启成功！
1@.*Sim paused.*@世界运行暂停。。。服务器开启成功！
1@.*Registering master server.*@服务器开启成功！
EOF

  cat >$data_dir/modconf.lua <<-EOF
require "modinfo"

-- Addon function
function trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

function LuaRemove(str,remove)
    local lcSubStrTab = {}
    while true do
    local lcPos = string.find(str,remove)
    if not lcPos then
      lcSubStrTab[#lcSubStrTab+1] =  str
      break
    end
    local lcSubStr  = string.sub(str,1,lcPos-1)
    lcSubStrTab[#lcSubStrTab+1] = lcSubStr
    str = string.sub(str,lcPos+1,#str)
    end
    local lcMergeStr =""
    local lci = 1
    while true do
    if lcSubStrTab[lci] then
      lcMergeStr = lcMergeStr .. lcSubStrTab[lci]
      lci = lci + 1
    else
      break
    end
    end
    return lcMergeStr
end
function Blank2jin(str)
    return (string.gsub(str, " ", "#"))
end
---
function list()
    if used == "true" then
    used = "[已启用]:"
    else
    used = "[未启用]:"
    end
    if modid == nil then
    modid = "unknown"
    end
    if name ~= nil then
    name = trim(name)
    name = LuaRemove(name, "\n")
    else
    name = "Unknown"
    end
    if configuration_options ~= nil and #configuration_options > 0 then
    cfg = "[可配置]:"
    else
    cfg = "[无配置]:"
    end
    local f = assert(io.open("modconflist.lua", 'a'))
    f:write(used, cfg, modid, ":", name, "\n")
    f:close()
end

function getver()
    print(version)
end

function table2json(t)
    local function serialize(tbl)
    local tmp = {}
    for k, v in pairs(tbl) do
      local k_type = type(k)
      local v_type = type(v)
      local key = (k_type == "string" and "\"" .. k .. "\":")
        or (k_type == "number" and "")
      local value = (v_type == "table" and serialize(v))
        or (v_type == "boolean" and tostring(v))
        or (v_type == "string" and "\"" .. v .. "\"")
        or (v_type == "number" and v)
        tmp[#tmp + 1] = key and value and tostring(key) .. tostring(value) or nil
    end
    if table.maxn(tbl) == 0 then
      return "{" .. table.concat(tmp, ",") .. "}"
    else
      return "[" .. table.concat(tmp, ",") .. "]"
    end
    end
    assert(type(t) == "table")
    return serialize(t)
end

function getname()
    if name then
    name = trim(name)
    name = LuaRemove(name, "\n")
    else
    name = "unknown"
    end
    print(name)
end

function createmodcfg()
    fname = "modconfigure/" .. modid .. ".cfg"
    local f = assert(io.open(fname, 'w'))
    f:write("mod-version = " .. version .. "\n")
    if name ~= nil then
    name = trim(name)
    name = Blank2jin(name)
    name = LuaRemove(name, "\n")
    end
    f:write("mod-name = " .. name .. "\n")
    if configuration_options ~= nil and #configuration_options > 0 then
    f:write("mod-configureable = true\n")
    for i, j in pairs(configuration_options) do
      if j.default == nil then
        if j.options ~= nil and #j.options > 0 then
          j.default = j.options[1].data
        end
      end
      if j.default ~= nil then
        local label = "nolabel"
        if j.label ~= nil then
          if string.len(j.label) >= 2 then
            label = Blank2jin(j.label)
            label = LuaRemove(label, "\n")
          end
        end
        local hover = "该项没有简介！"
        if j.hover ~= nil then
          if string.len(j.hover) >= 2 then
            hover = Blank2jin(j.hover)
            hover = LuaRemove(hover, "\n")
          end
        end
        local cfgname = Blank2jin(j.name)
        cfgname = LuaRemove(cfgname, "\n")
        if type(j.default) == "table" then
          f:write(cfgname .. " 表数据请直接修改modinfo.lua文件 table " .. label .. " " .. hover .. "\n")
        else
          f:write(cfgname .. " " .. tostring(j.default) .. " " .. type(j.default) .. " " .. label .. " " .. hover .. " ")
          if j.options ~= nil and #j.options > 0 then
            for k, v in pairs(j.options) do
              if type(v.data) ~= "table" then
                local description = ""
                if v.description ~= nil then
                  if string.len(v.description) >= 2 then
                    description = Blank2jin(v.description)
                    description = LuaRemove(description, "\n")
                  end
                end
                if description == "" then
                  description = tostring(v.data)
                end
                local cfghover = "该项没有说明！"
                if v.hover ~= nil then
                  if string.len(v.hover) >= 2 then
                    cfghover = v.hover
                  end
                end
                cfghover = Blank2jin(cfghover)
                cfghover = LuaRemove(cfghover, "\n")
                f:write(tostring(v.data) .. " " .. description .. " " .. cfghover)
              end
              if k ~= #j.options then
                f:write(" ")
              else
                f:write("\n")
              end
            end
          end
        end
      end
    end
    else
    f:write("mod-configureable = false\n")
    end
    f:close()
end
---------------------------------
if fuc == "list" then
    list()
elseif fuc == "getver" then
    getver()
elseif fuc == "getname" then
    getname()
elseif fuc == "createmodcfg" then
    createmodcfg()
end
EOF
}
Reset_data() {
  Initfiles
  info "已重置脚本数据！"
}
# open swap
Open_swap() {
  if [ $(free -m | grep -i swap | tr -cd '[0-9]') == "000" ]; then
    if [ ! -f "/swapfile" ]; then
      info "创建虚拟内存 ..."
      sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
      sudo mkswap /swapfile
      sudo chmod 0600 /swapfile
      # 开机自启
      sudo chmod 0666 /etc/fstab
      echo "/swapfile swap swap defaults 0 0" >>/etc/fstab
      sudo chmod 0644 /etc/fstab
    fi
  fi
  if [ $(free -m | grep -i swap | tr -cd '[0-9]') == "000" ]; then
    sudo swapon /swapfile
    info "虚拟内存已开启！"
  fi
}
# 创建文件夹
Mkdstdir() {
  mkdir -p "${DST_HOME}/steamcmd"
  mkdir -p "${dst_server_dir}"
  mkdir -p "${dst_conf_basedir}/${dst_conf_dirname}"
  mkdir -p "${data_dir}"
  mkdir -p "${mod_cfg_dir}"
  mkdir -p "${log_save_dir}"
}
# 检查当前系统信息
Check_sys() {
  if [[ -f "/etc/redhat-release" ]]; then
    release="centos"
  elif cat /etc/issue | grep -q -E -i "debian"; then
    release="debian"
  elif cat /etc/issue | grep -q -E -i "ubuntu"; then
    release="ubuntu"
  elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
    release="centos"
  elif cat /proc/version | grep -q -E -i "debian"; then
    release="debian"
  elif cat /proc/version | grep -q -E -i "ubuntu"; then
    release="ubuntu"
  elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
    release="centos"
  fi
  if [[ "${release}" != "ubuntu" && "${release}" != "debian" && "${release}" != "centos" ]]; then
    error "很遗憾！本脚本暂时只支持Debian7+和Ubuntu12+和CentOS7+的系统！" && exit 1
  fi
  bit=$(uname -m)
  mybit=$(getconf LONG_BIT)
  scriptfile=${release}_${mybit}.sh
}
# 安装依赖库和必要软件
Install_Dependency() {
  info "安装DST所需依赖库及软件 ..."
  if [[ "${release}" != "centos" ]]; then
    if [[ "${bit}" = "x86_64" ]]; then
      sudo dpkg --add-architecture i386
      sudo apt update
      sudo apt install -y lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386
    else
      sudo apt update
      sudo apt install -y libstdc++6 libcurl4-gnutls-dev
    fi
    sudo apt install -y tmux wget gcc make openssl libreadline-dev libssl-dev curl lua5.2
  else
    if [[ "${bit}" = "x86_64" ]]; then
      sudo yum install -y tmux glibc.i686 libstdc++ libstdc++.i686 libcurl.i686 wget gcc make openssl openssl-devel curl libtermcap-devel ncurses-devel libevent-devel readline-devel
    else
      sudo yum install -y libstdc++ libcurl
    fi
    sudo yum install -y tmux wget gcc make openssl openssl-devel curl libtermcap-devel ncurses-devel libevent-devel readline-devel lua
  fi
  lua -v
  if [ $? -ne 0 ]; then
    wget https://tools.wqlin.com/dst/lua-5.1.5.tar.gz -O ${DST_HOME}/lua-5.1.5.tar.gz -T 10
    tar -zxvf ${DST_HOME}/lua-5.1.5.tar.gz -C ${DST_HOME}/lua
    cd ${DST_HOME}/lua
    sudo make linux test
    sudo make install
    cd $HOME
  fi
}
check_lua() {
  lua -v
  if [ $? -ne 0 ]; then
    Install_Dependency
  fi
}
# Install steamcmd
Install_Steamcmd() {
  if [ ! -f ${DST_HOME}/steamcmd_linux.tar.gz ]; then
    wget "http://media.steampowered.com/installer/steamcmd_linux.tar.gz" -O "${DST_HOME}/steamcmd_linux.tar.gz"
  fi
  tar -xzvf "${DST_HOME}/steamcmd_linux.tar.gz" -C "${DST_HOME}/steamcmd"
  chmod +x "${DST_HOME}/steamcmd/steamcmd.sh"
}
# Install DST Dedicated Server
Install_Game() {
  Get_game_beta
  if [[ $gamebeta != "" || $gamebeta != "public" ]]; then
    beta_str="-beta $gamebeta "
  fi
  cd "${DST_HOME}/steamcmd" || exit 1
  ./steamcmd.sh +@ShutdownOnFailedCommand 1 +force_install_dir "${dst_server_dir}" +login anonymous +app_update "343050" ${beta_str}validate +quit
  cd ${HOME}
}
# 修复SteamCMD [S_API FAIL] SteamAPI_Init() failed;
Fix_steamcmd() {
  # fix lib for centos
  if [[ "${release}" == "centos" ]]
  then
    getsetting "gamebit"
    if [[ $result == "64" ]]
    then
      if [ ! -f "${DST_HOME}/.steam/sdk64/steamclient.so" ]
      then
        info "修复Steamcmd可能存在的依赖问题 ..."
        mkdir -p "${DST_HOME}/.steam/sdk64"
        cp -v "${DST_HOME}/steamcmd/linux64/steamclient.so" "${DST_HOME}/.steam/sdk64/steamclient.so"
      fi
      if [ ! -f "${dst_server_dir}/bin64/lib64/libcurl-gnutls.so.4" ]; then
        info "libcurl-gnutls.so.4 missing ... create a lib link."
        ln -s "/usr/lib64/libcurl.so.4" "${dst_server_dir}/bin64/lib64/libcurl-gnutls.so.4"
      fi
    else
      if [ ! -f "${DST_HOME}/.steam/sdk32/steamclient.so" ]
      then
        info "修复Steamcmd可能存在的依赖问题 ..."
        mkdir -p "${DST_HOME}/.steam/sdk32"
        cp -v "${DST_HOME}/steamcmd/linux32/steamclient.so" "${DST_HOME}/.steam/sdk32/steamclient.so"
      fi
      if [ ! -f "${dst_server_dir}/bin/lib32/libcurl-gnutls.so.4" ]; then
        info "libcurl-gnutls.so.4 missing ... create a lib link."
        ln -s "/usr/lib/libcurl.so.4" "${dst_server_dir}/bin/lib32/libcurl-gnutls.so.4"
      fi
    fi
  fi
}
Status_keep() {
  Get_current_cluster
  Get_shard_array
  for shard in $shardarray; do
    if ! tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
      server_alive="false"
      break
    else
      server_alive="true"
    fi
  done
  getsetting "serveropen"
  if [[ $result == "true" && "${server_alive}" == "false" ]]; then
    tip "服务器异常退出，即将重启 ..."
    Reboot_server
  fi
}
Simple_server_status() {
  cluster="无"
  unset server_on
  Get_current_cluster
  Get_shard_array
  for shard in ${shardarray}; do
    if tmux has-session -t DST_"${shard}" >/dev/null 2>&1; then
      server_on="${server_on}${shard} "
    fi
  done
  if tmux has-session -t Auto_update >/dev/null 2>&1; then
    auto_on="开启"
  else
    auto_on="关闭"
  fi
  cluster_name="无"
  if [[ "${server_on}" == "" ]]; then
    server_on="无"
  fi
  [ -f "${dst_base_dir}/${cluster}/cluster.ini" ] && cluster_name=$(cat "${dst_base_dir}/${cluster}/cluster.ini" | grep "^cluster_name" | cut -d "=" -f2)
  echo -e "\e[33m存档: ${cluster}\n开启的世界：${server_on}\n名称: ${cluster_name}\e[0m"
  echo -e "\e[33m附加功能进程：${auto_on}\e[0m"
}
Update_MOD() {
  Get_current_cluster
  if [ -f "${dst_base_dir}/${cluster}/${shard}/modoverrides.lua" ]; then
    Setup_mod
    if [[ $(grep '^S' "${data_dir}/mods_setup.lua") != "" ]]; then
      Download_MOD
    else
      info "启用的MOD不需要更新！"
    fi
  else
    tip "当前存档【${cluster}】没有启用MOD或存档已损坏！"
  fi
}
Download_MOD() {
  info "正在安装/更新新添加的MOD(合集)，请稍候 。。。"
  tip "如长时间卡住在这，请关掉开着的服务器再试，或直接本地上传。"
  if [ ! -d "${dst_base_dir}/downloadmod/Master" ]; then
    mkdir -p "${dst_base_dir}/downloadmod/Master"
  fi
  if tmux has-session -t DST_MODUPDATE >/dev/null 2>&1; then
    tmux kill-session -t DST_MODUPDATE
  fi
  cd "${dst_server_bin_dir}" || exit 1
  tmux new-session -s DST_MODUPDATE -d "${dst_bin_cmd} -ugc_directory ${ugc_directory} -persistent_storage_root ${dst_conf_basedir} -conf_dir ${dst_conf_dirname} -cluster downloadmod -shard Master"
  sleep 3
  exchangesetting downloadmod_timeouttime 3
  init_downloadmod_timeout_time=$(date +%s)
  while (true); do
    if checktime "downloadmod_timeout"; then
      tip "因网络问题下载MOD超时，请本地上传或重试！。"
      tmux kill-session -t DST_MODUPDATE
      break
    else
      if tmux has-session -t DST_MODUPDATE >/dev/null 2>&1; then
        if [ $(grep "Your Server Will Not Start" -c "${dst_base_dir}/downloadmod/Master/server_log.txt") -gt 0 ]; then
          info "MOD安装/更新程序执行完毕完毕，如未更新成功，请直接上传或重试！！"
          tmux kill-session -t DST_MODUPDATE
          break
        fi
      fi
    fi
    init_downloadmod_timeout_time=$(date +%s)
  done
}
Extend_function_setting() {
  while (true); do
    #clear
    unset parm
    echo -e "\e[33m=====饥荒联机版独立服务器脚本拓展功能设置[Linux-Steam]=====\e[0m"
    echo -e "\e[92m    0. 保存设置重启拓展功能进程并返回主菜单\e[0m"
    echo -e "\e[92m    1. 周期性检查游戏进程是否意外退出，退出自动重启\e[0m"
    echo -e "\e[92m    2. 周期性备份当前开启的存档\e[0m"
    echo -e "\e[92m    3. 周期性检查游戏是否有更新，有则重启更新！[测试版建议开启]\e[0m"
    echo -e "\e[35m涉及时间的设置单位均为分钟，只能输入整数，尽量不要小于五分钟。\e[0m"
    echo -e "\e[33m=====================================================================\e[0m"
    echo -e "\e[92m请输入命令代号：\e[0m\c"
    read efs
    case $efs in
    0)
      Auto_update
      break
      ;;
    1)
      parm="keepalive"
      ;;
    2)
      parm="backupcluster"
      ;;
    3)
      parm="gameupdate"
      ;;
    *)
      error "输入有误！！！"
      ;;
    esac
    efs_menu
  done
}
efs_menu() {
  while (true); do
    echo -e "\e[92m请选择设置项： 0.返回上一级  1.是否开启   2.时间周期  ：\e[0m\c"
    read sss
    case $sss in
    0)
      break
      ;;
    1)
      echo -e "\e[92m请选择： 1.开启   2.关闭  ：\e[0m\c"
      read isopen
      case $isopen in
      1)
        st="true"
        exchangesetting "$parm" "$st"
        ;;
      *)
        st="false"
        exchangesetting "$parm" "$st"
        ;;
      esac
      ;;
    2)
      echo -e "\e[92m请输入时间间隔[分钟、整数]：\e[0m\c"
      read dtime
      [[ $dtime == "" ]] && dtime=30
      exchangesetting "${parm}time" "$dtime"
      ;;
    *)
      error "输入有误！！！"
      ;;
    esac
  done
}
checktime() {
  cur_time=$(date +%s)
  getsetting "${1}time"
  [[ $result == "" ]] && result=30
  period=$(($result * 60))
  inittime=`eval echo '$'"init_$1_time"`
  speadtime=$(($cur_time - $inittime))
  if [ $speadtime -gt $period ]; then
    # 超时
    return 0
  else
    return 1
  fi
}
checkgameupdate() {
  cur_game_version=$(cat "${dst_server_dir}/version.txt")
  Get_game_beta
  if [[ $gamebeta != "" && $gamebeta != "public" ]]; then
    new_game_version=$(curl -s 'https://forums.kleientertainment.com/game-updates/dst/' | grep 'data-releaseID' | grep -v 'data-currentRelease' | cut -d '/' -f6 | cut -d '-' -f1 | sort -r | head -n 1 | tr -cd '[0-9]')
  else
    new_game_version=$(curl -s 'https://forums.kleientertainment.com/game-updates/dst/' | grep 'data-currentRelease' | cut -d '/' -f6 | cut -d '-' -f1 | sort -r | head -n 1 | tr -cd '[0-9]')
  fi
  if [[ $cur_game_version != "" && $new_game_version != "" && $cur_game_version != $new_game_version ]]; then
    return 0
  else
    return 1
  fi
}
# 传入MODID
checkmodupdate() {
  unset result
  moddir="workshop-"$1
  Get_installed_mod_version
  cur_mod_ver=$result
  modinfo=$(curl -s ${my_api_link}"?type=modnew&id=$1")
  unset new_mod_name
  unset new_mod_ver
  if [ $(echo $modinfo | wc -c) -lt 100 ]; then
    new_mod_name=$(echo $modinfo | cut -d '@' -f1)
    new_mod_ver=$(echo $modinfo | cut -d '@' -f2)
  fi
  if [[ $cur_mod_ver == "uninstalled" || $cur_mod_ver == "" || $cur_mod_ver != $new_mod_ver ]]; then
    if [[ $new_mod_ver != "" ]]; then
      tip "MOD($Green_font_prefix${new_mod_name}$Font_color_suffix)[$Yellow_font_prefix$1$Font_color_suffix]需要更新: 【$Yellow_font_prefix${cur_mod_ver}$Font_color_suffix】----->【$Red_font_prefix${new_mod_ver}$Font_color_suffix】。"
      result="true"
    else
      tip "无法获取MOD($Green_font_prefix${new_mod_name}$Font_color_suffix)[$Yellow_font_prefix$1$Font_color_suffix]最新版本信息，不更新。"
      result="false"
    fi
  else
    tip "MOD($Green_font_prefix${new_mod_name}$Font_color_suffix)[$Yellow_font_prefix$1$Font_color_suffix]已是最新版本: 【$Red_font_prefix${cur_mod_ver}$Font_color_suffix】。"
    result="false"
  fi
}
Getinputlist() {
  inputarray=()
  for i in $1; do
    if echo $i | grep '-' >/dev/null; then
      m=$(echo $i | cut -d '-' -f1)
      n=$(echo $i | cut -d '-' -f2)
      for j in $(seq $m $n); do
        inputarray[${#inputarray[@]} + 1]=$j
      done
    else
      inputarray[${#inputarray[@]} + 1]=$i
    fi
  done
}
Get_IP() {
  ip=$(wget -qO- -t1 -T2 ipinfo.io/ip)
  if [[ -z "${ip}" ]]; then
    ip=$(wget -qO- -t1 -T2 api.ip.sb/ip)
    if [[ -z "${ip}" ]]; then
      ip=$(wget -qO- -t1 -T2 members.3322.org/dyndns/getip)
    fi
  fi
}
Post_ipmd5() {
  Get_IP
  send_str=$(echo -n "${ip}" | openssl md5 | cut -d " " -f2)
  curl -s "${my_api_link}/?type=user&ipmd5=${send_str}" >/dev/null 2>&1
  echo "$(date +%s)" >"${data_dir}/ipmd5.txt"
}
# 仅发送md5值做统计，周期内只发送一次，保证流畅性
Send_md5_ip() {
  if [ ! -f "${data_dir}/ipmd5.txt" ]; then
    Post_ipmd5
  else
    cur_time=$(date +%s)
    old_time=$(cat "${data_dir}/ipmd5.txt")
    cycle=$((${cur_time} - ${old_time}))
    # 周期为七天
    if [ $cycle -gt 604800 ]; then
      Post_ipmd5
    fi
  fi
  checkban=$(curl -s "${my_api_link}/?type=checkban&ipmd5=${send_str}")
  if [[ $checkban == "true" ]]; then
    rm -rf $HOME/dstserver.sh
    exit 1
  fi
}
check_tmux() {
  tmux ls >/dev/null 2>&1
  if [ $? == 127 ]; then
    if [ $release == "centos" ]; then
      str="sudo yum install -y tmux"
      sudo yum install -y tmux
    else
      str="sudo apt install -y tmux"
      sudo apt install -y tmux
    fi
    tmux ls >/dev/null 2>&1
    if [ $? == 127 ]; then
      error "Tmux 安装失败，请尝试手动执行 $str, 若仍安装失败请自查原因解决！" && exit 1
    fi
  fi
}
###
if [[ "$1" == "au" ]]; then
  init_keepalive_time=$(date +%s)
  init_backupcluster_time=$(date +%s)
  init_gameupdate_time=$(date +%s)
  while (true); do
    #clear
    echo -e "\e[33m=====饥荒联机版独立服务器脚本附加功能进程[Linux-Steam]=====\e[0m"
    info "$(date) [退出请按Ctrl + B松开再按D]"
    getsetting "gameupdate"
    if [[ "$result" == "true" ]]; then
      if checktime "gameupdate"; then
        if checkgameupdate; then
          info "游戏更新($cur_game_version ===> $new_game_version)!"
          Reboot_announce
          Close_server
          Install_Game
          Get_current_cluster
          Get_shard_array
          exchangesetting serveropen true
          Start_shard
        else
          info "游戏无更新！"
        fi
        init_gameupdate_time=$(date +%s)
      fi
      info "游戏自动更新已开启！检查周期 $result 分钟"
    else
      tip "游戏自动更新未开启！"
    fi
    getsetting "keepalive"
    if [[ "$result" == "true" ]]; then
      if checktime "keepalive"; then
        Status_keep
        init_keepalive_time=$(date +%s)
      fi
      info "闪退自动重启已开启！检查周期 $result 分钟"
    else
      tip "闪退自动重启未开启！"
    fi
    getsetting "backupcluster"
    if [[ "$result" == "true" ]]; then
      if checktime "backupcluster"; then
        Backup_cluster
        init_backupcluster_time=$(date +%s)
      fi
      info "存档自动备份已开启！检查周期 $result 分钟"
    else
      tip "存档自动备份未开启！"
    fi
    info "每五分钟进行一次大循环。。。"
    sleep 300
  done
fi
if [[ "$1" == "sp" ]]; then
  #clear
  echo -e "\e[33m=====饥荒联机版独立服务器脚本当前玩家记录后台[Linux-Steam]=====\e[0m"
  Get_single_shard
  tail -f "${dst_base_dir}/${cluster}/${shard}/server_chat_log.txt" | cut -d " " -f2-100
fi
if [[ "$1" == "sa" ]]; then
  while (true); do
    #clear
    echo -e "\e[33m=====饥荒联机版独立服务器脚本发送公告后台[Linux-Steam]=====\e[0m"
    Get_single_shard
    echo -e "\e[92m请输入你要发送的公告内容，按下回车键发送：\e[0m"
    read an
    tmux send-keys -t DST_"${shard}" "c_announce(\"$an\")" C-m
    info "公告已发送！"
    sleep 1
  done
fi
if [[ "$1" == "ay" ]]; then
  Get_current_cluster
  Analysis_log $2
  exit
fi

if [[ "$1" == "test" ]]; then
  exit 0
fi

if [[ "$1" == "install" ]]; then
  Check_sys
  First_run_check
  Send_md5_ip
  check_tmux
  exit 0
fi

# Run from here
name=$(basename $0)
if [[ $name != "dstserver.sh" ]]; then
  error "请勿修改脚本名字，以 “./dstserver.sh”运行！"
  exit 1
fi
glibc_version=$(ldd --version | head -n 1 | tr -cd "[0-9]" | awk '{print int($0)}')
if [ $glibc_version -lt 215 ]; then
  error "glibc 库版本小于2.15，Steam无法运行！请自行升级"
  exit 1
fi
if [ ! -d $parent_mod_dir ]
then
    mkdir -p $parent_mod_dir
fi

getsetting "gamebit"
if [[ $result == "64" ]]
then
  dst_server_bin_dir=$dst_server_bin64_dir
  dst_bin_cmd=$dst_bin_cmd64
else
  exchangesetting "gamebit" "32"
fi

Update_script
Check_sys
First_run_check
check_tmux
check_lua
Send_md5_ip
#clear
Menu
