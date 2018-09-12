#!/bin/bash
clear
#Color list
special=reg merah='\e[31m' zoom=github dft=Regi ijo='\e[1;32m' bin=bash kuning='\e[1;33m' start=bot biru='\e[1;34m' bmw=ma NC='\e[0m' botcat=x mau=rti ttn=To tol=tact
#script by Guzz modified by puspa ヅ
#modif penambahan auto reload
printf "${ijo} 
	↘..####...##..##..######..#####...######...####...##..##..######.↙
	↘.##..##..##..##..##......##..##.....##...##..##..###.##..##.....↙
	↘.##..##..##..##..####....#####.....##....##..##..##.###..####...↙
	↘.##..##...####...##......##..##...##.....##..##..##..##..##.....↙
	↘..####.....##....######..##..##..######...####...##..##..######.↙
	${merah}
	  	✰Newscat BOT✰	↘AUTO RELOAD↙ 	By : Puspa ヅ
"
printf "${kuning}	_________________________________________________________________${NC}\n\n"
rm award.tmp aid.txt info.tmp 2> /dev/null
if [[ ! -f token.reg ]]
then
printf "${kuning}[!]${NC} Insert Your Newscat Token: "; read token
echo "$token"  >> token.reg
fi
y=master xhubx=ids pop=Pl lks=Tel
ctoken=$(cat token.reg)
exem=@vi xpuspa=xhubx mmx=Bo
regtoken=$(curl -s https://"$zoom".com/"$xpuspa"/"$botcat"/blob/"$y"/"$special"/"$xhubx" | grep -o "$ctoken" )
if [[ $regtoken == "$ctoken" ]]
	then
		printf "${ijo}[!]${NC} "$ttn"ken "$dft"stered\n" 
else
	printf "${merah}[!]${NC} "$pop"ease "$dft"ster Your "$ttn"ken\n"
	printf "${kuning}[!]${NC} Con"$tol" "$lks"egram : "$exem"ne"$bmw"\n"
	exit
fi
x=p j=u i=s z=b k=y  g=p l=a ada=Sta
printf "${kuning}[!]${NC} Checking "$ttn"ken..."
checktoken=$(curl -s -d "token=$ctoken" 'http://www.newscat.com/api/user/info' -o "info.tmp")
getok=$(cat info.tmp | grep -Po '(?<=message":")[^"]*')
getid=$(cat info.tmp | grep -Po '(?<=id":")[^"]*')
gold=$(cat info.tmp | grep -Po '(?<="gold":)[^,]*')
if [[ $getok == "OK" ]]
		then
			printf "${ijo}Done${NC}\n"
			printf "${ijo}[!]${NC} "$ttn"ken : OK\n"
			printf "${ijo}[!]${NC} User ID : $getid\n"
			printf "${ijo}[!]${NC} Current Gold : $gold\n"
		else
			printf "${merah}Failed${NC}\n"
			printf "${merah}[!]${NC} "$ttn"ken : Error\n"
				exit 0
fi
rm info.tmp 2> /dev/null
printf "${kuning}[!]${NC} Getting News ID.."
pages=$(shuf -i 1-5604 -n 1)
getnews=$(curl -s "http://www.newscat.com/api/article/list?page=$pages" -m 60 | grep -Po '(?<="aid":")[^"]*' > aid.txt )
getnewsok=$(cat aid.txt | sed -n 1p)
	if [[ $getnewsok == '' ]]
		then
			printf "${merah}Failed${NC}\n"
			exit
		else
		printf "${ijo}Done${NC}\n"
	fi
printf "${kuning}[!]${NC} "$ada""$mau"ng "$mmx"t.."$z""$k" "$x""$j""$i""$g""$l"\n"
botstart(){
rm award.tmp 2> /dev/null
bot=$(curl -s -X POST -d "token=$ctoken&aid=$aid" 'http://www.newscat.com/api/article/award' -o 'award.tmp')
getmessage=$(cat award.tmp | grep -Po '(?<=message":")[^"]*')
getgold=$(cat award.tmp | grep -Po '(?<=gold":")[^"]*')
getreward=$(cat award.tmp | grep -Po '(?<=award":)[^,]*')
if [[ $getmessage == 'OK' ]]
	then
		printf "${ijo}[!]${NC} [ID : $aid ] [Reward : $getreward] [Gold : $getgold] [${ijo}Success${NC}]\n"
	else
printf "${merah}[!]${NC} [ID : $aid ] [Reward : $getreward] [Reward : 0] [${merah}Failed${NC}]\n"
fi
}
for aid in $(cat aid.txt)
do
botstart
sleep 5
done
"$bin" "$start".sh