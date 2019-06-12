class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :article_image
  geocoded_by :spa_address
  after_validation :geocode

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
