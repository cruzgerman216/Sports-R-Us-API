require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user can be saved" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"Password123!", state: "Utah")
    assert_equal(user.save, true, "user can be saved with the appropriate keys")
  end

  test "user cannot save without any info" do
    user = User.new
    assert_equal(user.save, false, "cannot save without any info")
  end

  test "an email with space in front and back of email results to false" do
    user = User.new(username: "username", email: " test@test.com ", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without an '@' is false" do
    user = User.new(username: "username", email: "testtest.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "user is saved")
  end

  test "Without a '.com' is false" do
    user = User.new(username: "username",email: "test@test", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "user is saved")
  end

  test "Username can't be less than 2" do
    user = User.new(username: "a",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "username cannot have less than 2 characters")
  end

  test "Username can't be more than 10" do
    user = User.new(username: "usernameusername",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "username cannot be more than 10 characters")
  end

  test "Username can't be a duplicate" do
    user = User.new(username: "username",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    user.save 
    user = User.new(username: "username",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "username cannot be duplicate")
  end

  test "Username cannot be spaces" do
    user = User.new(username: " rtrt  ",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "username cannot be spaces")
  end

  test "Username cannot be an empty string" do
    user = User.new(username: "",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "username cannot be empty string ever")
  end


  test "Username cannot have any special characters" do
    user = User.new(username: "user!@#",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "username cannot have any special characters")
  end

  test "should not save username without at least one letter" do
    user = User.new(username: "123",email:"test@test.com", first_name: "first", last_name:"Last", password:"password123!")
    assert_equal(user.save, false, "username needs at least one letter")
  end

  test "should first names and last names not contain any numbers" do
    user = User.new(username: "username", email: "test@test.com", first_name: "fi2rst", last_name:"La2st", password:"password123!")
    assert_equal(user.save, false, "first names and last names cannot have numbers")
  end

  test "should first names and last names not contain any symbols" do
    user = User.new(username: "username", email: "test@test.com", first_name: "fi%rst", last_name:"La$st", password:"password123!")
    assert_equal(user.save, false, "first names and last names cannot have numbers")
  end

  test "should require a password from user" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last")
    assert_equal(user.save, false, "passwords are required when saving a user")
  end


  test "should password not contain less than 5 characters" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"a1!")
    assert_equal(user.save, false, "passwords cannot be less than 5 characters or more than 30 characters")
  end

  test "should not contain a password that is more than 30 characters" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"a1!12123451234567891012345678910")
    assert_equal(user.save, false, "passwords cannot be less than 5 characters or more than 30 characters")
  end

  test "should not contain a password that is missing a lower case letter" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"A12345!")
    assert_equal(user.save, false, "passwords require at least one lowercase letter")
  end

  test "should not contain a password that is missing a upper case letter" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"a12345!")
    assert_equal(user.save, false, "passwords require at least one upper case letter")
  end

  test "should not contain a password that is misssing a number" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"Abcdef!")
    assert_equal(user.save, false, "passwords require at least one number")
  end

  test "should not contain a password that is misssing a symbol" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"Abcdef123")
    assert_equal(user.save, false, "passwords require at least one symbol")
  end

  test "should not contain a state with numbers" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"Abcdef123", state:"234")
    assert_equal(user.save, false, "state name should not have numbers")
  end

  test "should not contain a state with less than 4 characters" do
    user = User.new(username: "username", email: "test@test.com", first_name: "first", last_name:"Last", password:"Abcdef123", state:"uta")
    assert_equal(user.save, false, "state name should not have numbers")
  end

end