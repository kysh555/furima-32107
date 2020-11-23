## usersテーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| nickname         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birthday         | date   | null: false               |

### Association
has_many: items
has_many: purchase


## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            |            |                                |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| item_category    |            |                                |
| item_status      | string     | null: false                    |
| shipping_cost    | string     | null: false                    |
| ship_from_area   | string     | null: false                    |
| days_to_ship     | string     | null: false                    |
| item_price       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
has_one: purchase
belongs_to: user


## purchaseテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchased_date | date       | null: false                    |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association
belongs_to: items
belongs_to: users
has_one: ship_to_address


## ship_to_addressテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | integer    | null: false                    |
| prefecture   |            |                                |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
belongs_to: purchase