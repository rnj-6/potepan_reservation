class Reservation < ApplicationRecord
  belongs_to :user  # 予約した人
  belongs_to :room  # 予約された施設

  validates :checkin_at, presence: true
  validates :checkout_at, presence: true
  validates :guest_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :dates_are_valid
  validate :checkin_at_is_today_or_later

  def stay_nights
    (checkout_at - checkin_at).to_i
  end

  def total_price
    room.price * stay_nights * guest_count
  end

  private

  def dates_are_valid
    return if checkin_at.blank? || checkout_at.blank?
    if checkout_at < checkin_at
      errors.add(:checkout_at, "はチェックイン日以降の日付を選択してください")
    end
  end

  def checkin_at_is_today_or_later
    return if checkin_at.blank?
    if checkin_at < Date.current
      errors.add(:checkin_at, "は本日以降の日付を選択してください")
    end
  end
end
