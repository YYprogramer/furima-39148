class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_cost
  belongs_to :send_origin
  belongs_to :send_time
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :image, :name, :description, presence: true
  validates :category_id, :condition_id, :send_cost_id, :send_origin_id, :send_time_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  def sold_out?
    order.present?
  end
end
