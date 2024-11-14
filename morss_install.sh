echo -n "Enter PORT number (default = 80):"
read PORT
PORT=${PORT:-80}
echo  "$PORT"


sudo docker run -d \
  	--name morss \
	-p $PORT:80 \
  	pictuga/morss 
