require "test_helper"

class WarrantyCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warranty_card = warranty_cards(:one)
  end

  test "should get index" do
    get warranty_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_warranty_card_url
    assert_response :success
  end

  test "should create warranty_card" do
    assert_difference("WarrantyCard.count") do
      post warranty_cards_url, params: { warranty_card: {  } }
    end

    assert_redirected_to warranty_card_url(WarrantyCard.last)
  end

  test "should show warranty_card" do
    get warranty_card_url(@warranty_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_warranty_card_url(@warranty_card)
    assert_response :success
  end

  test "should update warranty_card" do
    patch warranty_card_url(@warranty_card), params: { warranty_card: {  } }
    assert_redirected_to warranty_card_url(@warranty_card)
  end

  test "should destroy warranty_card" do
    assert_difference("WarrantyCard.count", -1) do
      delete warranty_card_url(@warranty_card)
    end

    assert_redirected_to warranty_cards_url
  end
end
