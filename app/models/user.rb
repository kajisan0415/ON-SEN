class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :blogs, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :stamped_articles, through: :stamps, source: :article

  validates :name, length: { maximum: 20, minimum: 2 }
  validates :introduction, length: { maximum: 270 }
end
