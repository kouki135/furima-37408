# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| product_explanation  | text       | null: false                    |
| product_category     | string     | null: false                    |
| product_condition    | string     | null: false                    |
| delivery_charge_side | string     | null: false                    |
| delivery_days        | string     | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postcode     | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| block        | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- belongs_to :order