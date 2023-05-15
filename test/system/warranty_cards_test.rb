require "application_system_test_case"

class WarrantyCardsTest < ApplicationSystemTestCase
  setup do
    @warranty_card = warranty_cards(:one)
  end

  test "visiting the index" do
    visit warranty_cards_url
    assert_selector "h1", text: "Warranty cards"
  end

  test "should create warranty card" do
    visit warranty_cards_url
    click_on "New warranty card"

    click_on "Create Warranty card"

    assert_text "Warranty card was successfully created"
    click_on "Back"
  end

  test "should update Warranty card" do
    visit warranty_card_url(@warranty_card)
    click_on "Edit this warranty card", match: :first

    click_on "Update Warranty card"

    assert_text "Warranty card was successfully updated"
    click_on "Back"
  end

  test "should destroy Warranty card" do
    visit warranty_card_url(@warranty_card)
    click_on "Destroy this warranty card", match: :first

    assert_text "Warranty card was successfully destroyed"
  end
end
