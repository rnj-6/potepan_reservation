class SearchesController < ApplicationController
  def search
    @area = params[:area]
    @keyword = params[:keyword]
    @rooms = Room.all
    
    if @area.present?
      @rooms = @rooms.where("address LIKE ?", "%#{@area}%")
    end
  
    if @keyword.present?
      @rooms = @rooms.where("name LIKE :keyword OR description LIKE :keyword", keyword: "%#{@keyword}%")
    end
  end
end
