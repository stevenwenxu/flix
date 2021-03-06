class User < ApplicationRecord
	before_save :format_fields
	before_save :set_slug

	has_secure_password

	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorite_movies, through: :favorites, source: :movie

	validates :name, presence: true
	validates :email, format: { with: /\S+@\S+/ }, uniqueness: { case_sensitive: false }
	# allow_blank useful for editing user profiles
	validates :password, length: { minimum: 3, allow_blank: true }
	validates :username, presence: true, format: { with: /\A[A-Z0-9]+\z/i} , uniqueness: true

	scope :by_name, -> { order(:name) }
	scope :non_admins, -> { by_name.where(admin: false) }

	def gravatar_id
		Digest::MD5::hexdigest(email.downcase)
	end

	def to_param
		slug
	end

	private

	def format_fields
		self.username = username.downcase
		self.email = email.downcase
	end

	def set_slug
		self.slug = username.parameterize
	end
end
