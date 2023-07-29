class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with:  /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z0-9]+\z/ },confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[\w+\-.]\z/ }
end
