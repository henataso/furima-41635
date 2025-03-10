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

ユーザー管理機能
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

main

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                   |
| ------           | ---------- | ------------------------- |
| itemname         | string     | null: false               |
| itemtext         | text       | null: false               |
| category_id      | integer    | null: false               |
| condition_id     | integer    | null: false               |
| shipping_cost_id | integer    | null: false               |
| region_of_origin_id| integer    | null: false               |
| delivery_time_id  | integer    | null: false               |
| price            | integer    | null: false               |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Options                 |
| -------            | ---------- | ----------------------- |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Options                 |
| -------            | ---------- | ----------------------- |
| zip                | string     | null: false             |
| region_of_origin_id| string     | null: false             |
| city_town          | string     | null: false             |
| street             | string     | null: false             |
| building_name      | string     |                         |
| phone              | string     | null: false             |
| order       | references | null: false, foreign_key: true |

### Association

- belongs_to :order