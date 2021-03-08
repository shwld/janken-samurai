## 開発環境

## 必要なツール
Docker for Mac / Windows

## セットアップ

```
$ docker-compose build
$ docker-compose run --rm app bin/setup
$ cp docker-compose.override.yml.example  docker-compose.override.yml
$ docker-compose run --rm app yarn
```

## 起動

```
$ docker-compose up -d
```

http://localhost:3008

### 稼働中のコンテナのシェルに接続

```
$ docker-compose exec app sh
```

## 参考URL

- [Gentelella](https://colorlib.com/polygon/gentelella/) (管理画面で使っているBootstrapテーマ)
