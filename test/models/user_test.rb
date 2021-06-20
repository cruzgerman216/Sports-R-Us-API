require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user can be saved" do
    user = User.new(username: "username", email: "test@test.com")
    assert_equal(user.save, true, "user can be saved with the appropriate keys")
  end

  test "user cannot save without email" do
    user = User.new
    assert_equal(user.save, false, "cannot save without email")
  end

  test "an emsil with space in front and back of email results to false" do
    user = User.new(email: " test@test.com ")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without an '@' is false" do
    user = User.new(email: "testtest.com")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without a '.com' is false" do
    user = User.new(email: "test@test")
    assert_equal(user.save, false, "user is saved")
  end

  test "Username can't be less than 2" do
    user = User.new(username: "a",email:"test@test.com")
    assert_equal(user.save, false, "username cannot have less than 2 characters")
  end

  test "Username can't be more than 10" do
    user = User.new(username: "12345678910111213",email:"test@test.com")
    assert_equal(user.save, false, "username cannot be more than 10 characters")
  end

  test "Username can't be a duplicate" do
    user = User.new(username: "12345678910111213",email:"test@test.com")
    user.save 
    user = User.new(username: "12345678910111213",email:"test@test.com")
    assert_equal(user.save, false, "username cannot be duplicate")
  end
end