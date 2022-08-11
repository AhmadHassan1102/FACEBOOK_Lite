require "test_helper"

class ReactionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reaction_new_url
    assert_response :success
  end
end
