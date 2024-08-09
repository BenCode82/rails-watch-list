class List < ApplicationRecord
  has_one_attached :list_photo

  has_many :bookmarks
  has_many :movies , through: :bookmarks, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
end
