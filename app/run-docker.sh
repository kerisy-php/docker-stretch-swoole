
WEBSITE_PATH=$(cd "$(dirname "$0")"; pwd)
docker run -v $WEBSITE_PATH:/data/www/website/htdocs/ -p 8888:8888 -it stretch-swoole

