class WarrantyCardsController < ApplicationController
  before_action :set_warranty_card, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /warranty_cards or /warranty_cards.json
  def index
    @warranty_cards = WarrantyCard.all
  end

  # GET /warranty_cards/1 or /warranty_cards/1.json
  def show
  end

  # GET /warranty_cards/new
  def new
    @warranty_card = WarrantyCard.new
  end

  # GET /warranty_cards/1/edit
  def edit
  end

  # POST /warranty_cards or /warranty_cards.json
  def create
    @warranty_card = WarrantyCard.new(warranty_card_params)

    respond_to do |format|
      if @warranty_card.save
        format.html { redirect_to warranty_card_url(@warranty_card), notice: "Warranty card was successfully created." }
        format.json { render :show, status: :created, location: @warranty_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warranty_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warranty_cards/1 or /warranty_cards/1.json
  def update
    respond_to do |format|
      if @warranty_card.update(warranty_card_params)
        format.html { redirect_to warranty_card_url(@warranty_card), notice: "Warranty card was successfully updated." }
        format.json { render :show, status: :ok, location: @warranty_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warranty_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warranty_cards/1 or /warranty_cards/1.json
  def destroy
    @warranty_card.destroy

    respond_to do |format|
      format.html { redirect_to warranty_cards_url, notice: "Warranty card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warranty_card
      @warranty_card = WarrantyCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warranty_card_params
      params.fetch(:warranty_card, {})
    end
end
