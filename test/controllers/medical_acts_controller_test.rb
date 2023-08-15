require "test_helper"

class MedicalActsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_act = medical_acts(:one)
  end

  test "should get index" do
    get medical_acts_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_act_url
    assert_response :success
  end

  test "should create medical_act" do
    assert_difference("MedicalAct.count") do
      post medical_acts_url, params: { medical_act: { description: @medical_act.description, name: @medical_act.name } }
    end

    assert_redirected_to medical_act_url(MedicalAct.last)
  end

  test "should show medical_act" do
    get medical_act_url(@medical_act)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_act_url(@medical_act)
    assert_response :success
  end

  test "should update medical_act" do
    patch medical_act_url(@medical_act), params: { medical_act: { description: @medical_act.description, name: @medical_act.name } }
    assert_redirected_to medical_act_url(@medical_act)
  end

  test "should destroy medical_act" do
    assert_difference("MedicalAct.count", -1) do
      delete medical_act_url(@medical_act)
    end

    assert_redirected_to medical_acts_url
  end
end
