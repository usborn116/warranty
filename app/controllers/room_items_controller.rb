class RoomItemsController < ApplicationController
  before_action :set_room_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def new
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
    params.require(:item).permit(:user_id, :name, :brand, :year, :serial,
      room_items_attributes: [rooms_attributes: [:name]],
      warranty_card_attributes: [:id, :code, :contact, :expiration, :lifetime, :notes])
  end

end
