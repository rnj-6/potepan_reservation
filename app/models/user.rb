class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :rooms            # 自分が登録した施設
  has_many :reservations     # 自分の予約

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end