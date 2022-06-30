require "test_helper"

class RaidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raid = raids(:one)
  end

  test "should get index" do
    get raids_url, as: :json
    assert_response :success
  end

  test "should create raid" do
    assert_difference("Raid.count") do
      post raids_url, params: { raid: { name: @raid.name } }, as: :json
    end

    assert_response :created
  end

  test "should show raid" do
    get raid_url(@raid), as: :json
    assert_response :success
  end

  test "should update raid" do
    patch raid_url(@raid), params: { raid: { name: @raid.name } }, as: :json
    assert_response :success
  end

  test "should destroy raid" do
    assert_difference("Raid.count", -1) do
      delete raid_url(@raid), as: :json
    end

    assert_response :no_content
  end
end
