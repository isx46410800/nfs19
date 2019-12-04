llistaUsers="pere marta anna pau pere jordi"
for user in $llistaUsers
do
	echo -e "$user\n$user" | smbpasswd -a $user
	line=$(getent passwd $user)
	uid=$(echo $line | cut -d: -f3)
	gid=$(echo $line | cut -d: -f4)
	homedir=$(echo $line | cut -d: -f6)
	echo "$user $uid $gid $homedir"
	if [ ! -d $homedir ]; then
		mkdir -p $homedir && echo "directori home creat"
		cp -ra /etc/skel/. $homedir && echo "skel copiado"
		chown -R $uid.$gid $homedir && echo "chown ok"
	fi
done

for user in user{01..05}
do
	echo -e "jupiter\njupiter" | smbpasswd -a $user && echo "usuari $user creat"
	line=$(getent passwd $user)
	uid=$(echo $line | cut -d: -f3)
	gid=$(echo $line | cut -d: -f4)
	homedir=$(echo $line | cut -d: -f6)
	echo "$user $uid $gid $homedir"
	if [ ! -d $homedir ]; then
		mkdir -p $homedir
		cp -ra /etc/skel/. $homedir
		chown -R $uid.$gid $homedir
	fi
done

for user in user{06..10}
do
	echo -e "jupiter\njupiter" | smbpasswd -a $user && echo "usuari $user creat"
	line=$(getent passwd $user)
	uid=$(echo $line | cut -d: -f3)
	gid=$(echo $line | cut -d: -f4)
	homedir=$(echo $line | cut -d: -f6)
	echo "$user $uid $gid $homedir"
	if [ ! -d $homedir ]; then
		mkdir -p $homedir
		cp -ra /etc/skel/. $homedir
		chown -R $uid.$gid $homedir
	fi 
done

#mkdir -p /tmp/home/2asix/$user && echo "directori home creat"
#cp -a /etc/skel/\. /tmp/home/2asix/$user && echo "skel copiado"
#chown -R $user $user /tmp/home/2asix/$user && echo "chown ok"
#echo -e "jupiter\njupiter" | smbpasswd -a $user && echo "usuari $user creat"
