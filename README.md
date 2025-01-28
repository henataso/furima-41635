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

| Column                  | Type   | Options     |
| ------------------      | ------ | ----------- |
| nickname                | string | null: false |
| mail                    | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| first_name              | string | null: false |
| last_name               | string | null: false |
| first_name_kana         | string | null: false |
| last_name_kana          | string | null: false |
| birthday                | string | null: false |

### Association

- has_many :goods
- belongs :buy

## goods テーブル

| Column           | Type       | Options                   |
| ------           | ---------- | ------------------------- |
| image            | references | null: false               |
| goodname         | string     | null: false               |
| goodtext         | text       | null: false               |
| category         | string     | null: false               |
| condition        | string     | null: false               |
| shipping costs    | string     | null: false               |
| region of origin | string     | null: false               |
| delivery time    | string     | null: false               |
| price            | integer    | null: false               |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs :user
- belongs :buy

## buys テーブル

| Column             | Type       | Options                 |
| -------            | ---------- | ----------------------- |
| card information   | integer    | null: false             |
| expirationdate     | string     | null: false             |
| securitycode       | integer    | null: false             |
| zip                | string     | null: false             |
| prefectureRequired | string     | null: false             |
| citytown           | string     | null: false             |
| street             | string     | null: false             |
| name               | string     | null: false             |
| phone              | integer    | null: false             |
| tweet_id    | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs :user
- belongs :good