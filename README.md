## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many: items
has_many: purchases


## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_description  | text       | null: false                    |
| item_category_id  | integer    | null: false                    |
| item_status_id    | integer    | null: false                    |
| shipping_cost_id  | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| days_to_ship_id   | integer    | null: false                    |
| item_price        | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
has_one: purchase
belongs_to: user


## purchasesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association
belongs_to: item
belongs_to: user
has_one: ship_to_address


## ship_to_addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
belongs_to: purchase