require "test_helper"

class GearSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gear_slot = gear_slots(:one)
  end

  test "should get index" do
    get gear_slots_url, as: :json
    assert_response :success
  end

  test "should create gear_slot" do
    assert_difference("GearSlot.count") do
      post gear_slots_url, params: { gear_slot: { gear_set_id: @gear_slot.gear_set_id, slot: @gear_slot.slot } }, as: :json
    end

    assert_response :created
  end

  test "should show gear_slot" do
    get gear_slot_url(@gear_slot), as: :json
    assert_response :success
  end

  test "should update gear_slot" do
    patch gear_slot_url(@gear_slot), params: { gear_slot: { gear_set_id: @gear_slot.gear_set_id, slot: @gear_slot.slot } }, as: :json
    assert_response :success
  end

  test "should destroy gear_slot" do
    assert_difference("GearSlot.count", -1) do
      delete gear_slot_url(@gear_slot), as: :json
    end

    assert_response :no_content
  end
end
