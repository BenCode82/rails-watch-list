class Movie < ApplicationRecord
  has_one_attached :movie_photo

  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
