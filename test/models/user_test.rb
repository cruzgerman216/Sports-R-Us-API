require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email format" do
    user = User.new(email: "test@test.com")
    assert_equal(user.save, true, "user is saved")
  end

  test "space in front and back of email results to false" do
    user = User.new(email: " test@test.com ")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without an @ is false" do
    user = User.new(email: "testtest.com")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without a '.com' is false" do
    user = User.new(email: "test@test")
    assert_equal(user.save, false, "user is saved")
  end

end