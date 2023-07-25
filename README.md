#テーブル設計

## users テーブル
+-----------------------+--------+---------------------------+
|      users            | type   | options                   |
+-----------------------+--------+---------------------------+
| nickname              | string | null: false               |
| email                 | string | null: false ,unique: true |
| encrypted_password    | string | null: false               |
| family_name_kanji     | string | null: false               | 
| given_name_kanji      | string | null: false               | 
| family_name_kana      | string | null: false               |
| given_name_kana       | string | null: false               |
| birthday              | date   | null: false               |
+-----------------------+--------+---------------------------+
## association
- has_many :items
- has_many :purchases

## items テーブル
+------------------+-----------+--------------------+
|      items       | type       | options           |
+------------------+-----------+--------------------+
| name             | string     | null: false       |
| description      | text       | null: false       | <!-- 商品説明       >
| condition_id     | integer    | null: false       | <!-- 商品状態       >
| send_cost_id     | integer    | null: false       | <!-- 送料料の負担   >
| send_origin_id   | integer    | null: false       | <!-- 発送元の地域   >
| send_time_id     | integer    | null: false       | <!-- 発送までの日数 >
| category_id      | integer    | null: false       |
| price            | integer    | null: false       |
| selling_fee      | integer    | null: false       | <!-- 販売手数料     >
| profit           | float      | null: false       | <!-- 販売利益       >
| user             | references | foreign_key: true |
+------------------+-----------+--------------------+
## association

- belongs_to :user
- belongs_to :purchases
- has_one_attached :image

## purchases テーブル
+--------------------+------------+-------------------+
|  purchases         | type       | options           | <!-- 購入 >
+--------------------+------------+-------------------+
| items              | references | foreign_key: true |
| users              | references | foreign_key: true |
+--------------------+------------+-------------------+
## association
- belongs_to :items
- has_one :shipping_addresses

## sipping_addresses テーブル
+------------------+------------+-------------------+
|sipping_addresses | type       | options           |
+------------------+------------+-------------------+
| postal_code      | string     | null: false       |
| send_origin_id   | integer    | null: false       | <!-- 発送元の地域 >
| city             | string     | null: false       |
| street_address   | string     | null: false       | <!-- 地番 >
| building         | string     |                   |
| phone_number     | string     | null: false       |
| purchases        | references | foreign_key: true |
+------------------+------------+-------------------+
## association
- bellongs_to : purchases