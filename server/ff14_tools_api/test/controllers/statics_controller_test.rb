require "test_helper"

class StaticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @static = statics(:one)
  end

  test "should get index" do
    get statics_url, as: :json
    assert_response :success
  end

  test "should create static" do
    assert_difference("Static.count") do
      post statics_url, params: { static: { name: @static.name, user_id: @static.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show static" do
    get static_url(@static), as: :json
    assert_response :success
  end

  test "should update static" do
    patch static_url(@static), params: { static: { name: @static.name, user_id: @static.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy static" do
    assert_difference("Static.count", -1) do
      delete static_url(@static), as: :json
    end

    assert_response :no_content
  end
end
