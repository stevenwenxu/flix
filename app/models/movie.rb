class Movie < ApplicationRecord

	RATINGS = %w(G PG PG-13 R NC-17)

	validates :title, :released_on, :duration, presence: true
	validates :description, length: { minimum: 25 }
	validates :total_gross, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :image_file_name, format: {
		with: /\w+\.(jpg|png)\z/i,
		message: "must be a JPG or PNG image"
	}
	validates :rating, inclusion: { in: RATINGS }

	# all the movies that have been released, ordered with the most recently-released movie first
	def self.released
		where('released_on < ?', Time.now).order(released_on: :desc)
	end

	def flop?
		total_gross.blank? || total_gross < 255_000_000
	end
end
