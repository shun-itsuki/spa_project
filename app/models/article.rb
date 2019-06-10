class Article < ApplicationRecord
  belongs_to :user
  attachment :article_image
end
