class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  attachment :article_image
  geocoded_by :spa_address
  after_validation :geocode
end
