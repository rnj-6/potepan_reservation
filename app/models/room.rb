class Room < ApplicationRecord
  belongs_to :user          # 登録者
  has_many :reservations , dependent: :destroy   # 施設1つあたりの予約
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
