# テーブル設計


## users テーブル

| Column                       | Type    | Options                   |
| ---------------------------- | ------- | ------------------------- |
| nickname                     | string  | null: false               |
| email                        | string  | null: false, unique: true |
| encrypted_password           | string  | null: false               |
| first_name                   | string  | null: true                |
| last_name                    | string  | null: true                |
| department                   | string  | null: true                |
| position                     | string  | null: true                |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :mylists
- has_many :grouplists
- has_many :messages


## mylists テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| title                        | string     | null: false                    |
| start_time                   | datetime   | null: false                    |
| text                         | string     | null: true                     |
| user_id                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## rooms テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| password_digest  | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :grouplists


## room_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| room_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## grouplists テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| title                        | string     | null: false                    |
| start_time                   | datetime   | null: false                    |
| text                         | string     | null: true                     |
| user_id                      | references | null: false, foreign_key: true |
| room_id                      | references | null: false, foreign_key: true |

### Association

- has_many :messages
- belongs_to :user
- belongs_to :room


## messages テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     | null: true                     |
| user_id  | references | null: false, foreign_key: true |
| room_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :grouplist
