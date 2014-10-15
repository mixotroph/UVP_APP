class User < ActiveRecord::Base

	# option 'dependent: :destroy' arranges for the dependent microposts 
	# to be destroyed when the user itself is destroyed
	has_many :microposts, dependent: :destroy

	before_create :create_remember_token

	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { maximum: 50 }
	validates :surname, presence: true, length: {maximum: 70}

	# TO-DO_ This expression below allows invalid addresses such as foo@bar..com
	# (that contain consecutive dots).
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i	
	
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }

	has_secure_password

	validates :password, length: { minimum: 6 }

	# digest and new_remember_token methods are attached to the User class because 
	# they don’t need a user instance to work, and they are public methods 
	# because we will put them to use outside of the User model
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		# call to 'to_s' makes sure we can handle 'nil' tokens, 
		# which shouldn’t happen in browsers but sometimes happens in tests
		Digest::SHA1.hexdigest(token.to_s)
	end

	# private methods
	private
		# customize the default "per_page" value for pagination
		self.per_page = 10

		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end


