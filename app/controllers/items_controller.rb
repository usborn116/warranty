class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /items or /items.json
  def index
    @items = Item.includes(:rooms, :warranty_cards)
    @items = Item.filter(params.slice(:name, :room, :expired, :active))
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.warranty_cards.build
  end

  # GET /items/1/edit
  def edit
    @item.room_items.build if @item.rooms.empty?
  end

  # POST /items or /items.json
  def create
    @item = current_user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        #format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        #format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:user_id, :name, :brand, :year, :serial, :photo,
        room_items_attributes: [:id, :room_id, :_destroy, room_attributes: [:name, :user_id]],
        warranty_cards_attributes: [:id, :code, :contact, :expiration, :lifetime, :notes])
    end
end
