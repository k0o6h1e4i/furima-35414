# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string |null: false,unique: true  |
| encrypted_password| string | null: false |
|nickname  | string | null: false |
|first_name| string | null: false |
|last_name | string | null: false |
|first_kana| string | null: false |
|last_kana | string | null: false |
| birthday |  date  | null: false |


### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column    | Type       | Options     |
| ------    | ---------- | ----------- |
| title     | string     | null: false |
| text      | text       | null: false |
| price     | integer    | null: false |
| state_id  | integer    | null: false |
|category_id| integer    | null: false |
| postage_id| integer    | null: false |
|prefecture_id | integer | null: false |
| shipping_day_id   | integer    | null: false |
| user      | references | null:false, foreign_key: true |

- belongs_to :user
- has_one :buyer

 ## buyers テーブル

| Column    | Type       | Options     |
| ------    | ---------- | ----------- |
| user      | references | null:false, foreign_key: true |
| item      | references | null:false, foreign_key: true |

- belongs_to :item
- has_one :address
- belongs_to :user

 ## addresses テーブル

| Column       | Type       | Options     |
| ---------    | ---------- | ----------- |
|postal_code   | string     | null: false |
|prefecture_id | integer    | null: false |
| city         | string     | null: false |
|street_address| string     | null: false |
|building_name | string     |             |
|telephone     | string     | null: false |
| buyer        | references | null:false, foreign_key: true|

- belongs_to :buyer