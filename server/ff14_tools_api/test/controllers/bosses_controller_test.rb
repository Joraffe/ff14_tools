require "test_helper"

class BossesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boss = bosses(:one)
  end

  test "should get index" do
    get bosses_url, as: :json
    assert_response :success
  end

  test "should create boss" do
    assert_difference("Boss.count") do
      post bosses_url, params: { boss: { name: @boss.name, raid_id: @boss.raid_id } }, as: :json
    end

    assert_response :created
  end

  test "should show boss" do
    get boss_url(@boss), as: :json
    assert_response :success
  end

  test "should update boss" do
    patch boss_url(@boss), params: { boss: { name: @boss.name, raid_id: @boss.raid_id } }, as: :json
    assert_response :success
  end

  test "should destroy boss" do
    assert_difference("Boss.count", -1) do
      delete boss_url(@boss), as: :json
    end

    assert_response :no_content
  end
end
