class User < ApplicationRecord
    # 为name属性加上存在性验证
    # validates :name, presence:true ,length: { maximum: 50 },uniqueness: true
    
    # email属性存在性测试
     # validates :email, presence:true, length: { maximum: 255 },uniqueness: true,uniqueness: { case_sensitive: false }
    before_save { self.email = email.downcase }
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
            VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    
    test "email addresses should be saved as lower-case" do
        mixed_case_email = "Foo@ExAMPle.CoM"
        @user.email = mixed_case_email
        @user.save
        assert_equal mixed_case_email.downcase, @user.reload.email
    end

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
