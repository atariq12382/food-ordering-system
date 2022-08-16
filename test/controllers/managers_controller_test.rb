require "test_helper"

class ManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get managers_dashboard_url
    assert_response :success
  end
end
