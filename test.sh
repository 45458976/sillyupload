#!/bin/bash
cd /data/data/com.termux/files/home/
git clone https://github.com/SillyTavern/SillyTavern.git SillyTavern1
cp -r /data/data/com.termux/files/home/SillyTavern/public/characters/. /data/data/com.termux/files/home/SillyTavern1/public/characters/
cp -r /data/data/com.termux/files/home/SillyTavern/public/chats/. /data/data/com.termux/files/home/SillyTavern1/public/chats/
cp -r /data/data/com.termux/files/home/SillyTavern/public/worlds/. /data/data/com.termux/files/home/SillyTavern1/public/worlds/
cp -r /data/data/com.termux/files/home/SillyTavern/public/groups/. /data/data/com.termux/files/home/SillyTavern1/public/groups/
cp -r /data/data/com.termux/files/home/SillyTavern/public/group\ chats/. /data/data/com.termux/files/home/SillyTavern1/public/group\ chats/
cp -r /data/data/com.termux/files/home/SillyTavern/public/OpenAI\ Settings/. /data/data/com.termux/files/home/SillyTavern1/public/OpenAI\ Settings/
cp -r /data/data/com.termux/files/home/SillyTavern/public/User\ Avatars/. /data/data/com.termux/files/home/SillyTavern1/public/User\ Avatars/
cp -r /data/data/com.termux/files/home/SillyTavern/public/backgrounds/. /data/data/com.termux/files/home/SillyTavern1/public/backgrounds/
mv /data/data/com.termux/files/home/SillyTavern /data/data/com.termux/files/home/SillyTavern_old
mv /data/data/com.termux/files/home/SillyTavern1 /data/data/com.termux/files/home/SillyTavern
read -p "是否删除旧版本，请输入Y/N:" para

case $para in 
	[yY])
        read -p "若要删除请再次确认" queren

        case $queren in
            [yY])
                rm -rfv SillyTavern_old
                ;;
            [nN])
                echo "保留旧版本"
                ;;
            *)
		        echo "错误的输入"
		        read -p "保留旧版本" exit
		        exit 1
                ;;
	[nN])
		echo "保留旧版本"
		;;
	*)
		echo "错误的输入"
		read -p "保留旧版本" exit
		exit 1
esac # end case
exit