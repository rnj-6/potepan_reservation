class Reservation < ApplicationRecord
  belongs_to :user  # 予約した人
  belongs_to :room  # 予約された施設
end
