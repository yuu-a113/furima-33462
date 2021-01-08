## usersテーブル


| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| nickname         | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |


### Association
- has_many :items
- has_many :comments
- has_many :purchases


## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| info           | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| shpping_charge | string     | null: false                    |
| shpping_area   | string     | null: false                    |
| shpping_day    | string     | null: false                    |
| price          | string     | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :comments
- belongs_to :purchase



## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item

## purchasesテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_num      | string     | null: false                    |
| valid_date    | string     | null: false                    |
| security_code | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipment


## shipmentsテーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_adress | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

