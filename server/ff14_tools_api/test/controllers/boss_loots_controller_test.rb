require "test_helper"

class BossLootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boss_loot = boss_loots(:one)
  end

  test "should get index" do
    get boss_loots_url, as: :json
    assert_response :success
  end

  test "should create boss_loot" do
    assert_difference("BossLoot.count") do
      post boss_loots_url, params: { boss_loot: { boss_id: @boss_loot.boss_id, loot_id: @boss_loot.loot_id } }, as: :json
    end

    assert_response :created
  end

  test "should show boss_loot" do
    get boss_loot_url(@boss_loot), as: :json
    assert_response :success
  end

  test "should update boss_loot" do
    patch boss_loot_url(@boss_loot), params: { boss_loot: { boss_id: @boss_loot.boss_id, loot_id: @boss_loot.loot_id } }, as: :json
    assert_response :success
  end

  test "should destroy boss_loot" do
    assert_difference("BossLoot.count", -1) do
      delete boss_loot_url(@boss_loot), as: :json
    end

    assert_response :no_content
  end
end
