class Movie < ApplicationRecord

	# all the movies that have been released, ordered with the most recently-released movie first
	def self.released
		where('released_on < ?', Time.now).order(released_on: :desc)
	end

	def flop?
		total_gross.blank? || total_gross < 255_000_000
	end
end
