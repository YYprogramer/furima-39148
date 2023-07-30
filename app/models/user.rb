class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)/ },confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :family_name_kanji, presence: true, format: { with: /\A[一-龯ぁ-んァ-ン]+\z/ }
  validates :given_name_kanji, presence: true, format: { with: /\A[一-龯ぁ-んァ-ン]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :given_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
end
