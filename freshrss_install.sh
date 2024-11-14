echo -n "Enter PORT number (default = 80):"
read PORT
PORT=${PORT:-80}
echo  "$PORT"


sudo docker run -d \
  	--name freshrss \
	-p $PORT:80 \
  	-e TZ=Europe/Warsaw \
  	-e 'CRON_MIN=1,31' \
	-v "$(pwd)/.freshrss/data:/var/www/FreshRSS/data" \
	-v "$(pwd)/.freshrss/extensions:/var/www/FreshRSS/extensions" \
	--restart=unless-stopped \
	--log-opt max-size=10m \
  	freshrss/freshrss 
