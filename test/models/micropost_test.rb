require "test_helper"
class MicropostTest < ActiveSupport::TestCase
  test "requires author and text and enforces 140 character limit" do
    post = Micropost.new(content: "a" * 140, user: users(:one))
    assert post.valid?
    post.content = "a" * 141
    assert_not post.valid?
    post.content = ""
    assert_not post.valid?
    post.content = "Hello"
    post.user = nil
    assert_not post.valid?
  end
  test "belongs to user and is deleted with author" do
    user = users(:one)
    assert_equal user, user.microposts.first.user
    assert_difference("Micropost.count", -user.microposts.count) { user.destroy! }
  end
end
