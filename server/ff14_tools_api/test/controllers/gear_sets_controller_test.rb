require "test_helper"

class GearSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gear_set = gear_sets(:one)
  end

  test "should get index" do
    get gear_sets_url, as: :json
    assert_response :success
  end

  test "should create gear_set" do
    assert_difference("GearSet.count") do
      post gear_sets_url, params: { gear_set: { character_id: @gear_set.character_id, role_id: @gear_set.role_id } }, as: :json
    end

    assert_response :created
  end

  test "should show gear_set" do
    get gear_set_url(@gear_set), as: :json
    assert_response :success
  end

  test "should update gear_set" do
    patch gear_set_url(@gear_set), params: { gear_set: { character_id: @gear_set.character_id, role_id: @gear_set.role_id } }, as: :json
    assert_response :success
  end

  test "should destroy gear_set" do
    assert_difference("GearSet.count", -1) do
      delete gear_set_url(@gear_set), as: :json
    end

    assert_response :no_content
  end
end
