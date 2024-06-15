help:
	@echo Dockerイメージのビルド
	@echo "$$ make docker-setup"
	
	@echo Dockerコンテナの実行
	@echo "$$ make exec-docker"
	
	@echo イメージのビルドとコンテナの実行
	@echo "$$ make all-setup-docker"
	
	@echo Docker Terminal 起動
	@echo "$$ make terminal-docker"
	
# @echo Docker起動
# @echo "$$ make docker-start"

# @echo Docker終了
# @echo "$$ make docker-stop"

# @echo Uploadした画像の削除
# @echo "$$ make rm"


build-docker:
	sudo docker build -t shopping_memo .

exec-docker:
	docker run --name shopping_memo -p 8080:8080 -d shopping_memo
# docker run -d --name shopping_memo -p 8080:80 -v ~/shopping_memo:/app shopping_memo
	
all-setup-docker: build-docker exec-docker

rm-package:
	docker system prune -a

re-all-setup-docker: stop-docker rm-package all-setup-docker

terminal-docker:
	docker exec -i -t shopping_memo bash

start-docker:
	docker start shopping_memo

stop-docker:
	docker stop shopping_memo
