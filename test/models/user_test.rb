require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name:"Nameexample", email:"example@email.com", 
                      password: "foobar", password_confirmation: "foobar")
  end 


  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do 
    @user.name = "      " 
    assert_not @user.valid?
  end 
  
  test "email should be present " do
    @user.email = "     "
    assert_not @user.valid?    
  end

  test "name should not be too long" do 
    @user.name = "z" *51
    assert_not @user.valid?
  end 

  test "email should not be too long" do 
    @user.email = "y" * 256
    assert_not @user.valid?
  end 

  test "email validation should accept valid addresses" do 
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.com]
    valid_addresses.each do|valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"    
    end
  end

  test "email validation should reject invalid addresses" do  
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
            foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address| 
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be INvalid"
    end 
  end 

  test "there should be no duplicate in the DB" do 
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save 
    assert_not duplicate_user.valid? 
  end 

  test "emails should be saved with lowercase" do
    mixed_case_email = "exaMplE@whaTEVer.com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end 

  test "password should not be blank" do
    @user.password = @user.password_confirmation = "    " * 6
    assert_not @user.valid?
  end 

  test "password should have a 6 characters minimum length" do
    @user.password = @user.password_confirmation =  "g" * 5 
    assert_not @user.valid? 
  end 


end
