require "application_system_test_case"

class MedicalActsTest < ApplicationSystemTestCase
  setup do
    @medical_act = medical_acts(:one)
  end

  test "visiting the index" do
    visit medical_acts_url
    assert_selector "h1", text: "Medical acts"
  end

  test "should create medical act" do
    visit medical_acts_url
    click_on "New medical act"

    fill_in "Description", with: @medical_act.description
    fill_in "Name", with: @medical_act.name
    click_on "Create Medical act"

    assert_text "Medical act was successfully created"
    click_on "Back"
  end

  test "should update Medical act" do
    visit medical_act_url(@medical_act)
    click_on "Edit this medical act", match: :first

    fill_in "Description", with: @medical_act.description
    fill_in "Name", with: @medical_act.name
    click_on "Update Medical act"

    assert_text "Medical act was successfully updated"
    click_on "Back"
  end

  test "should destroy Medical act" do
    visit medical_act_url(@medical_act)
    click_on "Destroy this medical act", match: :first

    assert_text "Medical act was successfully destroyed"
  end
end
