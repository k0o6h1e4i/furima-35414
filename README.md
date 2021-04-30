# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| item     | string | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column    | Type       | Options     |
| ------    | ---------- | ----------- |
| title     | string     | null: false |
| text      | text       | null: false |
|user       | references | null:false, foreign_key: true |

- belongs_to :user
- has_many :comments


## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user

 ## buyers テーブル

| Column    | Type       | Options     |
| ------    | ---------- | ----------- |
| name      | string     | null: false |
| item      | references | null:false, foreign_key: true |

- belongs_to :item

## address テーブル

| Column    | Type       | Options     |
| ------    | ---------- | ----------- |
| text      | text       | null: false |
| buyer     | references | null:false, foreign_key: true |

- belongs_to :buyer