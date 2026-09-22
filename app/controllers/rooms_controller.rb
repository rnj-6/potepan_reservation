class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:notice] = "施設を作成しました"
      redirect_to @room
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def update
    @room = current_user.rooms.find(params[:id])

    if @room.update(room_params)
      flash[:notice] = "施設を編集しました"
      redirect_to @room
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])

    if @room.destroy
      flash[:notice] = "施設を削除しました"
      redirect_to rooms_path
    end
  end

  private
  def room_params
    params.require(:room).permit(
      :name,
      :image,
      :description,
      :address,
      :price
    )
  end
end
