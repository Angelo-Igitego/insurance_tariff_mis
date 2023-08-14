require "application_system_test_case"

class InsuranceProvidersTest < ApplicationSystemTestCase
  setup do
    @insurance_provider = insurance_providers(:one)
  end

  test "visiting the index" do
    visit insurance_providers_url
    assert_selector "h1", text: "Insurance providers"
  end

  test "should create insurance provider" do
    visit insurance_providers_url
    click_on "New insurance provider"

    fill_in "Address", with: @insurance_provider.address
    fill_in "Cit", with: @insurance_provider.city
    fill_in "Country", with: @insurance_provider.country
    fill_in "Email", with: @insurance_provider.email
    fill_in "Name", with: @insurance_provider.name
    fill_in "Province or state", with: @insurance_provider.province_or_state
    click_on "Create Insurance provider"

    assert_text "Insurance provider was successfully created"
    click_on "Back"
  end

  test "should update Insurance provider" do
    visit insurance_provider_url(@insurance_provider)
    click_on "Edit this insurance provider", match: :first

    fill_in "Address", with: @insurance_provider.address
    fill_in "City", with: @insurance_provider.city
    fill_in "Country", with: @insurance_provider.country
    fill_in "Email", with: @insurance_provider.email
    fill_in "Name", with: @insurance_provider.name
    fill_in "Province or state", with: @insurance_provider.province_or_state
    click_on "Update Insurance provider"

    assert_text "Insurance provider was successfully updated"
    click_on "Back"
  end

  test "should destroy Insurance provider" do
    visit insurance_provider_url(@insurance_provider)
    click_on "Destroy this insurance provider", match: :first

    assert_text "Insurance provider was successfully destroyed"
  end
end
