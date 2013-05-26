class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
 	validates :name, presence: true, length: { maximum: 50 }
	has_secure_password
	validates :password_confirmation, presence: true
	validates :password, length: { minimum: 6 }
	before_save { self.email = email.downcase }
end
