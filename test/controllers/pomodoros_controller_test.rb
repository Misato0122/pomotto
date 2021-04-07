require 'test_helper'

class PomodorosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pomodoros_create_url
    assert_response :success
  end

end
