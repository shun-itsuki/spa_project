class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :article_image

  geocoded_by :spa_address
  after_validation :geocode, if: :spa_address_changed?

  with_options presence: true do
  validates :article_image
  validates :spa_name
  validates :spa_address
  validates :date
  validates :impression
  end

  validates :impression, length: {minimum: 30}

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end


end
