help:
	@echo Dockerイメージのビルド
	@echo "$$ make docker-setup"
	
	@echo Dockerコンテナの実行
	@echo "$$ make exec-docker"
	
	@echo イメージのビルドとコンテナの実行
	@echo "$$ make all-docker"
	
	@echo Docker Terminal 起動
	@echo "$$ make terminal-docker"
	
# @echo Docker起動
# @echo "$$ make docker-start"

# @echo Docker終了
# @echo "$$ make docker-stop"

# @echo Uploadした画像の削除
# @echo "$$ make rm"


build-docker:
	sudo docker build -t shoppint_memo .

exec-docker:
	docker run --name shoppint_memo -p 8080:80 -d shoppint_memo
# docker --name shoppint_memo run -p 3000:3000 shoppint_memo


all-docker: build-docker exec-docker

# docker-setup:
# 	sudo chmod -R 777 create_object
# 	sudo chown -R www-data:www-data create_object 
# 	sudo docker build -t create_object .
# 	docker run -d --name create_object -p 8000:80 -v ~/create_object/create_object:/var/www/html create_object
	
# 新しいファイルを作成した場合に使用する
# permission:	
# 	sudo chmod -R 777 create_object
# 	sudo chown -R www-data:www-data create_object 

terminal-docker:
	docker exec -i -t shoppint_memo bash

# docker-start:
# 	docker start create_object

# docker-stop:
# 	docker stop create_object
