class ReservationsController < ApplicationController
  before_action :set_room, only: [:confirm, :create]

  def confirm
    @reservation = @room.reservations.new(reservation_params)
    @reservation.user = current_user

    if @reservation.valid?
      render :confirm
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  def create
    @reservation = @room.reservations.new(reservation_params)
    @reservation.user = current_user
    
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_path
    else
      render :confirm, status: :unprocessable_entity
    end
  end

  def index
    @reservations = current_user.reservations
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

