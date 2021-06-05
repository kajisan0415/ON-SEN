class Article < ApplicationRecord
 has_many :favorites, dependent: :destroy
 has_many :stamps, dependent: :destroy
 belongs_to :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  def stamped_by?(user)
    stamps.where(user_id: user.id).exists?
  end
end
