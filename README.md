# テーブル設計


## users テーブル

| Column                       | Type    | Options                   |
| ---------------------------- | ------- | ------------------------- |
| nickname                     | string  | null: false               |
| email                        | string  | null: false, unique: true |
| encrypted_password           | string  | null: false               |
| first_name                   | string  | null: false               |
| last_name                    | string  | null: false               |
| department                   | string  | null: false               |
| position                     | string  | null: false               |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :my_lists
- has_many :group_lists
- has_many :messages


## my_lists テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| title                        | string     | null: false                    |
| start_time                   | datetime   | null: false                    |
| text                         | string     |                                |
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
- has_many :group_lists


## room_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| room_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## group_lists テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| title                        | string     | null: false                    |
| start_time                   | datetime   | null: false                    |
| text                         | string     |                                |
| user_id                      | references | null: false, foreign_key: true |
| room_id                      | references | null: false, foreign_key: true |

### Association

- has_many :messages
- belongs_to :user
- belongs_to :room


## messages テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     |                                |
| user_id  | references | null: false, foreign_key: true |
| room_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group_list
