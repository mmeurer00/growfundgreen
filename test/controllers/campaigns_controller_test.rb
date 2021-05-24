require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get campaigns_url, as: :json
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { description: @campaign.description, donation_id: @campaign.donation_id, member_id: @campaign.member_id, name: @campaign.name, user_id: @campaign.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show campaign" do
    get campaign_url(@campaign), as: :json
    assert_response :success
  end

  test "should update campaign" do
    patch campaign_url(@campaign), params: { campaign: { description: @campaign.description, donation_id: @campaign.donation_id, member_id: @campaign.member_id, name: @campaign.name, user_id: @campaign.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign), as: :json
    end

    assert_response 204
  end
end
