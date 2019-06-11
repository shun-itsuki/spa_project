class Article < ApplicationRecord
  belongs_to :user
  attachment :article_image
  geocoded_by :spa_address
  after_validation :geocode
end
