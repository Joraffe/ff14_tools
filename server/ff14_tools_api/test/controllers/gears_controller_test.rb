require "test_helper"

class GearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gear = gears(:one)
  end

  test "should get index" do
    get gears_url, as: :json
    assert_response :success
  end

  test "should create gear" do
    assert_difference("Gear.count") do
      post gears_url, params: { gear: { gear_slot_id: @gear.gear_slot_id, ilvl: @gear.ilvl, name: @gear.name } }, as: :json
    end

    assert_response :created
  end

  test "should show gear" do
    get gear_url(@gear), as: :json
    assert_response :success
  end

  test "should update gear" do
    patch gear_url(@gear), params: { gear: { gear_slot_id: @gear.gear_slot_id, ilvl: @gear.ilvl, name: @gear.name } }, as: :json
    assert_response :success
  end

  test "should destroy gear" do
    assert_difference("Gear.count", -1) do
      delete gear_url(@gear), as: :json
    end

    assert_response :no_content
  end
end
