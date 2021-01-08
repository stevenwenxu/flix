class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :email, format: { with: /\S+@\S+/ }, uniqueness: { case_sensitive: false }
	# allow_blank useful for editing user profiles
	validates :password, length: { minimum: 3, allow_blank: true }

	def gravatar_id
		Digest::MD5::hexdigest(email.downcase)
	end
end
