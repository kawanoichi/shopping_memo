help:
	@echo Dockerイメージのビルド
	@echo "$$ make build-docker-image"
	
	@echo Dockerコンテナの作成
	@echo "$$ make create-container"
	
	@echo イメージのビルドとコンテナの実行
	@echo "$$ make all-setup-docker"
	
	@echo Docker Terminal 起動
	@echo "$$ make terminal-docker"
	
	@echo Docker起動
	@echo "$$ make docker-start"

	@echo Docker終了
	@echo "$$ make docker-stop"


build-docker-image:
	sudo docker build -t shopping_memo .

create-container:
	docker run --name shopping_memo -p 8080:8080 \
	-v ~/shopping_memo/views:/app/views \
	-v ~/shopping_memo/public:/app/public \
	-v ~/shopping_memo/app.js:/app/app.js \
	-d shopping_memo

all-setup-docker: build-docker exec-docker

terminal-docker:
	docker exec -i -t shopping_memo bash

start-docker:
	docker start shopping_memo

stop-docker:
	docker stop shopping_memo
