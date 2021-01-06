class Review < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  validates :stars, inclusion: 1..5

  def stars_as_percent
  	(stars / 5.0) * 100.0
  end
end
