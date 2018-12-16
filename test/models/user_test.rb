require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=User.new(name:"Peter",phonenum: "15870687585",email:"shuailongwen18@mails.ucas.ac.cn",password: "foobar", password_confirmation: "foobar")
  end
  # 测试用户对象一开始就是有效的
  test "should be valid" do
    assert @user.valid?
  end
  
  # 验证name属性存在, name不能为空
  test "name should be valid" do 
    @user.name =" "
    assert_not @user.valid?
  end
  
  test "email should be valid" do
    @user.email=" "
    assert_not @user.valid?
  end 
  
    test "name should not be too long" do
      @user.name = "a" * 51
      assert_not @user.valid?
    end
    
    test "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      assert_not @user.valid?
    end
    
    # 确保邮箱是唯一的
    test "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end
    # 确保用户名是唯一的
    test "name should be unique" do
      duplicate_user= @user.dup
      duplicate_user.name = @user.name.upcase
      @user.save
      assert_not duplicate_user.valid?
    end
    
    # 密码最短长度限制
    test "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      assert_not @user.valid?
    end
    test "password should have a minimum length" do
        @user.password = @user.password_confirmation = "a" * 5
        assert_not @user.valid?
    end
end
