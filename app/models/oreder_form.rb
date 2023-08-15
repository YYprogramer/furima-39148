class クラス名
  include ActiveModel::Model
  attr_accessor  :user_id, :item_id

  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end