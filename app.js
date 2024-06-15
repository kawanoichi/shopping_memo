const express = require("express");
const app = express();
const port = 8080;

// EJS を使用するための設定
app.set("view engine", "ejs");

// public フォルダを静的ファイルとして使用する設定
app.use(express.static("public"));

app.get("/", (req, res) => {
    res.render("index"); // .ejs の拡張子は自動で付与される
});

app.listen(port)