# ベースイメージを指定
FROM node:14

# 作業ディレクトリを設定
WORKDIR /app

# パッケージファイルをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# アプリケーションコードをコピー
COPY . .

# ポートを公開
EXPOSE 8080

# アプリケーションを起動
CMD ["node", "app.js"]
