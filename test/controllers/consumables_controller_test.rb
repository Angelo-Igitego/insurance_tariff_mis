require "test_helper"

class ConsumablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumable = consumables(:one)
  end

  test "should get index" do
    get consumables_url
    assert_response :success
  end

  test "should get new" do
    get new_consumable_url
    assert_response :success
  end

  test "should create consumable" do
    assert_difference("Consumable.count") do
      post consumables_url, params: { consumable: { form: @consumable.form, unit_of_measurement: @consumable.unit_of_measurement } }
    end

    assert_redirected_to consumable_url(Consumable.last)
  end

  test "should show consumable" do
    get consumable_url(@consumable)
    assert_response :success
  end

  test "should get edit" do
    get edit_consumable_url(@consumable)
    assert_response :success
  end

  test "should update consumable" do
    patch consumable_url(@consumable), params: { consumable: { form: @consumable.form, unit_of_measurement: @consumable.unit_of_measurement } }
    assert_redirected_to consumable_url(@consumable)
  end

  test "should destroy consumable" do
    assert_difference("Consumable.count", -1) do
      delete consumable_url(@consumable)
    end

    assert_redirected_to consumables_url
  end
end
