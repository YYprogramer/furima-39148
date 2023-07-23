#テーブル設計

## users テーブル
+-----------------------+--------+---------------------------+
|      users            | type   | options                   |
+-----------------------+--------+---------------------------+
| nickname              | string | null: false               |
| email                 | string | null: false               |
| password              | string | null: false ,unique: true |
| password_confirmation | string | null: false               | <!-- パスワード確認用 >
| name_kanji            | string | null: false               | 
| name_kana             | string | null: false               |
| birthday              | date   | null: false               |
+-----------------------+--------+---------------------------+
## association
- has_many :sellers
- has_many :buyers
- has_many :comments
- has_many :favorites

## items テーブル
+------------------+-----------+--------------------+
|      items       | type       | options           |
+------------------+-----------+--------------------+
| image            | image      | null: false       | 
| name             | string     | null: false       |
| description      | text       | null: false       | <!-- 商品説明       >
| condition        | string     | null: false       | <!-- 商品状態       >
| send_cost        | string     | null: false       | <!-- 送料料の負担   >
| send_origin      | string     | null: false       | <!-- 発送元の地域   >
| send_time        | string     | null: false       | <!-- 発送までの日数 >
| price            | integer    | null: false       |
| selling_fee      | integer    | null: false       | <!-- 販売手数料     >
| profit           | float      | null: false       | <!-- 販売利益       >
| sellers_id       | references | foreign_key: true |
| categories_id    | references | foreign_key: true |
| sold_out_flag    | boolean    | default: false    |
+------------------+-----------+--------------------+
## association
- belongs_to :sellers
- belongs_to :buyers
- has_many :favorites
- has_many :comments
- has_many :item_categories
- has_many :categories, through: :item_categories
- belongs_to :purchases
- has_one_attached :image

## sellers テーブル
+------------------+------------+-------------------+
|    sellers       | type      | options           |
+------------------+------------+-------------------+
| users_id         | references | foreign_key: true |
+------------------+------------+-------------------+
## association
- belongs_to :users
- has_many :items
- belongs_to :purchases

## buyers テーブル
+------------------+------------+-------------------+
|    buyers        | type       | options           |
+------------------+------------+-------------------+
| users_id         | references | foreign_key: true |
+------------------+------------+-------------------+
## association
- belongs_to :users
- has_many :items
- belongs_to :purchases

## categories テーブル
+------------------+------------+-------------------+
|    categories    | type       | options           |
+------------------+------------+-------------------+
| name             | string     | null: false       |
| items_id         | references | foreign_key: true |
+------------------+------------+-------------------+
## association
- has_many :item_categories
- has_many :items , through: :item_categories

## purchases テーブル
+--------------------+------------+-------------------+
|  purchases         | type       | options           | <!-- 購入       >
+--------------------+------------+-------------------+
| items_id           | references | foreign_key: true |
| sellers_id         | references | foreign_key: true |
| buyers_id          | references | foreign_key: true |
| credit_cards_id    | references | foreign_key: true |
| addresses_id       | references | foreign_key: true |
+--------------------+------------+-------------------+
## association
- belongs_to :items
- belongs_to :sellers
- belongs_to :buyers
- has_one :credit_cards
- has_one :addresses

## credit_cards テーブル
+--------------------+---------+-------------+
| credit_cards       | type    | options     |
+--------------------+---------+-------------+
| card_number        | integer | null: false |
| expiry_date        | integer | null: false | <!-- 有効期限 >
| security_code      | integer | null: false |
+--------------------+---------+-------------+
## association
- bellongs_to : purchases

## addresses テーブル
+------------------+---------+-------------+
| addresses        | type    | options     |
+------------------+---------+-------------+
| postal_code      | integer | null: false |
| state            | string  | null: false |
| city             | string  | null: false |
| street_address   | string  | null: false | <!-- 地番 >
| building         | string  |             |
| phone_number     | integer | null: false |
+------------------+---------+-------------+
## association
- bellongs_to : purchases

## comments テーブル
+------------------+------------+-------------------+
| comments         | type       | options           |
+------------------+------------+-------------------+
| text             | text       | null: false       |
| users_id         | references | foreign_key: true |
| items_id         | references | foreign_key: true |
+------------------+------------+-------------------+
## association
- belohgs_to :users
- belohgs_to :items

## favorites テーブル
+------------------+------------+-------------------+
| favorites        | type       | options           |
+------------------+------------+-------------------+
| users_id         | references | foreign_key: true |
| items_id         | references | foreign_key: true |
+------------------+------------+-------------------+
## association
- belohgs_to :users
- belohgs_to :items

## item_categories テーブル
+------------------+------------+-------------------+
| item_categories  | type       |options            |
+------------------+------------+-------------------+
| items_id         | references | foreign_key: true |
| categories_id    | references | foreign_key: true |
+------------------+------------+-------------------+
## association
- belongs_to :items
- belongs_to :categories