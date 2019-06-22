class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :image

  with_options on: :update do |update|
    update.validates :name, presence: true
    update.validates :profile, length: { in: 1..35 }
  end
end
