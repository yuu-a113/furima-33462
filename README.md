## usersテーブル


| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| bday               | date       | null: false                    |


### Association
- has_many :items
- has_many :comments
- has_many :purchases


## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| info              | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| shpping_charge_id | integer    | null: false                    |
| prefucture_id     | integer    | null: false                    |
| shpping_day_id    | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :comments
- has_one :purchase



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
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street_adress | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

