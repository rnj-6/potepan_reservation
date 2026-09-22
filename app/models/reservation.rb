class Reservation < ApplicationRecord
  belongs_to :user  # 予約した人
  belongs_to :room  # 予約された施設

  def stay_nights
    (checkout_at - checkin_at).to_i
  end

  def total_price
    room.price * stay_nights * guest_count
  end
end
