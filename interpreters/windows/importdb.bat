@ECHO OFF

SET DB=""
SET FILE=%1

IF /I NOT "%~2"=="" (
	SET DB=%1
	SET FILE=%2
)

docker-compose exec -T database mysql -uroot -proot %DB% < %FILE%
