
WEBSITE_PATH=$(cd "$(dirname "$0")"; pwd)
docker run -v $WEBSITE_PATH:/data/www/website/htdocs/:ro -p 8888:8888 -d stretch-swoole

