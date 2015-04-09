# gourmet-map

内輪で使うグルメマップアプリです。

## 開発の準備
Rails のいつものやつをする。

```
$ bundle install
$ bundle exec rake db:migrate
```

.env.sample を .env にコピーする。

```
cp .env.sample .env
```

.env を適当に書き換える。
AWS や MANDRILL は heroku で動かすときのためなので、ローカルで使う分にはほっといていい。

## 実行

```
$ bundle exec rails server
```
