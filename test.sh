#!/bin/bash

cd

if [ ! -d "SillyTavern" ]; then
   read -p "未检测到SillyTavern文件夹,是否进行下载(Y/N)" download
   if [ "$download" == "Y" ] || [ "$download" == "y" ]; then
      git clone https://github.com/SillyTavern/SillyTavern.git
      exit
   elif [ "$download" == "N" ] || [ "$download" == "n" ]; then
      echo "已取消下载"
      exit
   else
      echo "输入错误"
      exit
   fi
fi

if [ -d "SillyTavern_old" ]; then
  NEW_FOLDER_NAME="SillyTavern_$(date +%Y%m%d)"
  mv SillyTavern_old $NEW_FOLDER_NAME
fi

git clone https://github.com/SillyTavern/SillyTavern.git SillyTavern1
cp -r SillyTavern/public/characters/. SillyTavern1/public/characters/
cp -r SillyTavern/public/chats/. SillyTavern1/public/chats/
cp -r SillyTavern/public/worlds/. SillyTavern1/public/worlds/
cp -r SillyTavern/public/groups/. SillyTavern1/public/groups/
cp -r SillyTavern/public/group\ chats/. SillyTavern1/public/group\ chats/
cp -r SillyTavern/public/OpenAI\ Settings/. SillyTavern1/public/OpenAI\ Settings/
cp -r SillyTavern/public/User\ Avatars/. SillyTavern1/public/User\ Avatars/
cp -r SillyTavern/public/backgrounds/. SillyTavern1/public/backgrounds/
mv SillyTavern SillyTavern_old
mv SillyTavern1 SillyTavern

read -p "是否删除旧版本,请输入Y/N:" para

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
                                read -p "保留旧版本"
                                exit 11
                                ;;
                esac
                ;;
        [nN])
                echo "保留旧版本"
                ;;
        *)
                echo "错误的输入"
                read -p "保留旧版本"
                exit 12
esac

exit
