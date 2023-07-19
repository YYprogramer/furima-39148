#テーブル設計

## user テーブル
+------------------+
|      ユーザー    |type       |options                       |
+------------------+
| ニックネーム     |
| メールアドレス   |
| パスワード       |
| 名前（漢字）     |
| 名前（カナ）     |
| 生年月日         |
+------------------+
## association
- has_many :sellers
- has_many :buyers
- has_many :comments
- has_many :favorites

## items テーブル
+------------------+
|      商品        |type       |options                       |
+------------------+
| 商品画像         |
| 商品名           |
| 商品説明         |
| 商品状態         |
| 発送料の負担     |
| 発送元地域       |
| 発送までの日数   |
| 販売価格         |
| 販売手数料       |
| 販売利益         |
| 出品者ID         |
| カテゴリーID     |
| 売り切れフラグ   |
+------------------+
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
+------------------+
|    出品者        |type       |options                       |
+------------------+
| ユーザーID       |
+------------------+
## association
- belongs_to :users
- has_many :items
- belongs_to :purchases

## buyers テーブル
+------------------+
|    購入者        |type       |options                       |
+------------------+
| ユーザーID       |
+------------------+
## association
- belongs_to :users
- has_many :items
- belongs_to :purchases

## categories テーブル
+------------------+
|    カテゴリー    |type       |options                       |
+------------------+
| カテゴリー名     |
| 商品ID           |
+------------------+
## association
- has_many :item_categories
- has_many :items , through: :item_categories

## purchases テーブル
+------------------+
|  購入            |type       |options                       |
+------------------+
| 購入者ID         |
| 商品ID           |
| クレジットカードID|
| 発送先住所ID     |
+------------------+
## association
- belongs_to :items
- belongs_to :sellers
- belongs_to :buyers
- has_one :credit_cards
- has_one :addresses

## credit_cards テーブル
+------------------+
| クレジットカード |type       |options                       |
+------------------+
| カード番号       |
| 有効期限         |
| セキュリティコード|
+------------------+
## association
- bellongs_to : purchases

## addresses テーブル
+------------------+
| 発送先住所       |type       |options                       |
+------------------+
| 郵便番号         |
| 都道府県         |
| 市区町村         |
| 番地             |
| 建物名           |
| 電話番号         |
+------------------+
## association
- bellongs_to : purchases

## comments テーブル
+------------------+
| コメント         |type       |options                       |
+------------------+
| テキスト         |
| ユーザーID       |
| 商品ID           |
+------------------+
## association
- belohgs_to :users
- belohgs_to :items

## favorites テーブル
+------------------+
| お気に入り       |type       |options                       |
+------------------+
| ユーザーID       |
| 商品ID           |
+------------------+
## association
- belohgs_to :users
- belohgs_to :items

## item_categories テーブル
+------------------+
| 商品カテゴリー   |type       |options                       |
+------------------+
| 商品ID           |
| カテゴリーID     |
+------------------+
## association
- belongs_to :items
- belongs_to :categories