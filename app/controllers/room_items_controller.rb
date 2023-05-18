class RoomItemsController < ApplicationController
  before_action :set_room_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def new
    @rooms = Room.all.map{|r| [r.name, r.id]}
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room_item
    @room_item = RoomItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:room_item).permit(:room_id)
  end

end
