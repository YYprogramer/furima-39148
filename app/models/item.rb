class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_cost
  belongs_to :send_origin
  belongs_to :send_time
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :category_id, :condition_id, :send_cost_id, :send_origin_id, :send_time_id, numericality: { other_than: 1 , message: "can't be blank"}
end
