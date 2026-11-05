require "test_helper"
class UserTest < ActiveSupport::TestCase
  test "requires name and unique normalized valid email" do
    user = User.new(name: "Author", email: " FIRST@EXAMPLE.COM ")
    assert_equal "first@example.com", user.email
    assert_not user.valid?
    user.email = "invalid"
    assert_not user.valid?
    user.email = "new@example.com"
    user.name = ""
    assert_not user.valid?
  end
end
