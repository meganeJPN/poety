require 'test_helper'

class PoeetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get poeets_index_url
    assert_response :success
  end

end
