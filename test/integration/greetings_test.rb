require "test_helper"
class GreetingsTest < ActionDispatch::IntegrationTest
  test "greetings and root route" do
    get hello_path
    assert_equal "Hello world!", response.body
    get goodbye_path
    assert_equal "goodbye, world!", response.body
    get root_path
    assert_response :success
    assert_select "h1", "Люди мініблогу"
  end
end
