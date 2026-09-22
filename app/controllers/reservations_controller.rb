class ReservationsController < ApplicationController
  before_action :set_room

  def confirm
    Rails.logger.debug "===== CONFIRM CALLED ====="
    Rails.logger.debug params.inspect
    @reservation = @room.reservations.new(reservation_params)
  end

  def create
    @reservation = @room.reservations.new(reservation_params)
    @reservation.user = current_user
    @reservation.save
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(
      :checkin_at,
      :checkout_at,
      :guest_count,
    )
  end
end

