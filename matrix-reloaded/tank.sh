#! /usr/bin/env bash

#
# RED="\e[32m"
# ENDCOLOR="\e[0m"
#
# while true;
# do
# 	for i in {1..100};
# 	do
# 		rand=$(( $RANDOM % 50 + 1 ))
# 		if [ $rand -lt 25 ]; then
# 			echo -e "${RED} 1 ${ENDCOLOR}\c"
# 		else
# 			echo -e "${RED} 0 ${ENDCOLOR}\c"
# 		fi
# 	done
# 	sleep 0.01
# done
#

GREEN="\e[32m"
WHITE="\e[97m"
ENDCOLOR="\e[0m"

# matrix reloaded
all_recipes=(
"国家資格推進委員会の「活動報告」を追加しました。"
"年度研修・講習会 レポート/アンケート提出"
"音楽療法士（補）試験 合格発表"
"日本音楽療法学会会員向けの賠償責任保険についてのお知らせ"
"国家資格推進委員会企画シンポジウム開催のお知らせ"
"６月１９日総会が開催され、新体制が発足しました。"
"年度面接試験における実技について"
)
IFS=""
while true; do
	#select N number of recipes
	recipes=()
	for r in {0..20}; do
		len=${#all_recipes[@]}
		rand=$(( $RANDOM % $len ))
		recipes+=(${all_recipes[$rand]})
	done

	i=0
	while true; do
		start=$i
		end=$(($i+1))
		found=0

		for r in ${recipes[@]}; do
			car="${r:$start:1}"

			if [[ "$car" != "" ]]; then
				found=1
			else
				car=" "
			fi
			rand=$(( $RANDOM % 3 ))
			if [[ $rand -eq 1 ]]; then
				car=" "
			fi

			echo -e "${GREEN}$car\t${ENDCOLOR}\c";
			sleep 0.0001;
		done

		if [ $found -eq 0 ]; then
			echo ""
			break
		fi

		echo ""
		i=$(($i+1))
	done
done
