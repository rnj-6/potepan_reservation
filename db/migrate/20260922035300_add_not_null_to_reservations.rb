class AddNotNullToReservations < ActiveRecord::Migration[7.2]
  def change
    change_column_null :reservations, :checkin_at, false
    change_column_null :reservations, :checkout_at, false
    change_column_null :reservations, :guest_count, false
  end
end
