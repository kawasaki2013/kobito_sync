kobito()
{
	KOBITO_PREVIOUS_DIR=$(pwd);
	KOBITO_DIR=$(cd $HOME/Library/Kobito && pwd);
	KOBITO_DATE=$(date);
	# echo "$KOBITO_DIR"
	cd "$KOBITO_DIR"
	if [ $# -lt 1 ];then
		kobito help
		return
	fi
	case $1 in
		"help" )
			echo "kobitoコマンド：使い方"
			echo "             kobito push home"
			echo "             kobito push office"
			echo "             kobito pull"
			echo "             kobito pull force"
			echo "             kobito help"
			cd "$KOBITO_PREVIOUS_DIR";
		;;
		"push" )
			echo "push latest data..."
			if [[ ! "$2" ]]; then
				echo "kobito pushに引数無い"
			elif [[ "$2" = "office" ]]; then
				export KOBITO_MESSAGE=$KOBITO_DATE'@会社';
				echo "$KOBITO_MESSAGE"
			elif [[ "$2" = "home" ]]; then
				export KOBITO_MESSAGE=$KOBITO_DATE'@自宅';
				echo "$KOBITO_MESSAGE"
			else
				echo "kobito pushの引数間違い"
				return
			fi
			git add .
			git commit -a -m "$KOBITO_MESSAGE";
			git push origin master
			cd "$KOBITO_PREVIOUS_DIR";
			return
		;;
		"pull")
			if [[ ! "$2" ]]; then
				echo "リモートの最新Kobito.db取得"
				git pull
				cd "$KOBITO_PREVIOUS_DIR";
				return
			elif [[ "$2" = "force" ]]; then
				echo "手元の修正は破棄してリモートの最新Kobito.db取得"
				git fetch --all
				git reset --hard origin/master
				cd "$KOBITO_PREVIOUS_DIR";
				return
			else
				echo "エラー：使えるのは'kobito pull'もしくは'kobito pull force'のみ"
				cd "$KOBITO_PREVIOUS_DIR";
				return
			fi
		;;
		*)
			echo "エラー：コマンドの構文が違う"
			kobito help
		;;

	esac
	cd "$KOBITO_PREVIOUS_DIR";
}