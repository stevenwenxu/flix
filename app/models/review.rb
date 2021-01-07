class Review < ApplicationRecord
  STARS = 1..5

  belongs_to :movie

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  validates :stars, inclusion: STARS

  def stars_as_percent
  	(stars / 5.0) * 100.0
  end
end
