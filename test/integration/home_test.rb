require "test_helper"

class HomeTest < ActionDispatch::IntegrationTest
  test "home page renders sucessfully" do
    get root_path

    assert_match /Home#index/, response.body
  end
end
