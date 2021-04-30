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
| birthday | string | null: false |


### Association

- has_many :items
- has_one :buyer

## items テーブル

| Column    | Type       | Options     |
| ------    | ---------- | ----------- |
| title     | string     | null: false |
| text      | text       | null: false |
| image     |            | null: false |
| price     | integer    | null: false |
| state_id  | integer    | null: false |
|category_id| integer    | null: false |
| postage_id| integer    | null: false |
|prefecture_id | integer | null: false |
| days_id   | integer    | null: false |
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

## address テーブル

| Column       | Type       | Options     |
| ---------    | ---------- | ----------- |
|postal_code   | integer    | null: false |
|prefecture_id | integer    | null: false |
| city         | string     | null: false |
|street_address| text       | null: false |
|building_name | text       |             |
|telephone     | string     | null: false |
| buyer        | references | null:false, foreign_key: true|

- belongs_to :buyer