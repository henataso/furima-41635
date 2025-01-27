# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |

### Association

- has_many :tweets
- belongs :buy

## tweets テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| image     | references | null: false                    |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs :user
- belongs :buy

## buys テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| postcode    | string     | null: false                    |
| address     | string     | null: false                    |
| tweet_id    | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs :user
- belongs :tweet