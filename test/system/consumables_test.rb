require "application_system_test_case"

class ConsumablesTest < ApplicationSystemTestCase
  setup do
    @consumable = consumables(:one)
  end

  test "visiting the index" do
    visit consumables_url
    assert_selector "h1", text: "Consumables"
  end

  test "should create consumable" do
    visit consumables_url
    click_on "New consumable"

    fill_in "Form", with: @consumable.form
    fill_in "Unit of measurement", with: @consumable.unit_of_measurement
    click_on "Create Consumable"

    assert_text "Consumable was successfully created"
    click_on "Back"
  end

  test "should update Consumable" do
    visit consumable_url(@consumable)
    click_on "Edit this consumable", match: :first

    fill_in "Form", with: @consumable.form
    fill_in "Unit of measurement", with: @consumable.unit_of_measurement
    click_on "Update Consumable"

    assert_text "Consumable was successfully updated"
    click_on "Back"
  end

  test "should destroy Consumable" do
    visit consumable_url(@consumable)
    click_on "Destroy this consumable", match: :first

    assert_text "Consumable was successfully destroyed"
  end
end
