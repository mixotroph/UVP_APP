class User < ActiveRecord::Base

	before_save { self.email = email.downcase }
	# method, equivalent to validates(:name, presence: true)
	validates :name, presence: true, length: { maximum: 50 }

	# This expression below allows invalid addresses such as foo@bar..com
	# (that contain consecutive dots).
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i	
	
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }

	has_secure_password

	validates :password, length: { minimum: 6 }

end


