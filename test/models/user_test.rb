require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user can be saved" do
    user = User.new(username: "username", email: "test@test.com")
    assert_equal(user.save, true, "user can be saved with the appropriate keys")
  end

  test "user cannot save without any info" do
    user = User.new
    assert_equal(user.save, false, "cannot save without any info")
  end

  test "an email with space in front and back of email results to false" do
    user = User.new(username: "username", email: " test@test.com ")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without an '@' is false" do
    user = User.new(username: "username", email: "testtest.com")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without a '.com' is false" do
    user = User.new(username: "username",email: "test@test")
    assert_equal(user.save, false, "user is saved")
  end

  test "Username can't be less than 2" do
    user = User.new(username: "a",email:"test@test.com")
    assert_equal(user.save, false, "username cannot have less than 2 characters")
  end

  test "Username can't be more than 10" do
    user = User.new(username: "usernameusername",email:"test@test.com")
    assert_equal(user.save, false, "username cannot be more than 10 characters")
  end

  test "Username can't be a duplicate" do
    user = User.new(username: "username",email:"test@test.com")
    user.save 
    user = User.new(username: "username",email:"test@test.com")
    assert_equal(user.save, false, "username cannot be duplicate")
  end

  test "Username cannot be spaces" do
    user = User.new(username: " rtrt  ",email:"test@test.com")
    assert_equal(user.save, false, "username cannot be spaces")
  end

  test "Username cannot be an empty string" do
    user = User.new(username: "",email:"test@test.com")
    assert_equal(user.save, false, "username cannot be empty string ever")
  end


  test "Username cannot have any special characters" do
    user = User.new(username: "user!@#",email:"test@test.com")
    assert_equal(user.save, false, "username cannot have any special characters")
  end

  test "should not save username without at least one letter" do
    user = User.new(username: "123",email:"test@test.com")

    assert_equal(user.save, false, "username needs at least one letter")
  end

end