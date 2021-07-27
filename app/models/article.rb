class Article < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :stamps, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def stamped_by?(user)
    stamps.where(user_id: user.id).exists?
  end

  def self.search(keyword) # 温泉名、住所、その他から特定のワードを検索可能にしている
    where(["name like? OR introduction like?  OR address_city like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  geocoded_by :address_city
  after_validation :geocode

  validates :address_city, presence: true
  validates :name, presence: true, uniqueness: true
  validates :introduction, length: { maximum: 100 }
  validates :tax, length: { maximum: 60 }
  validates :image, presence: true
end
