class Article < ApplicationRecord
 has_many :favorites, dependent: :destroy
 has_many :stamps, dependent: :destroy
 belongs_to :admin
 has_many :comments, dependent: :destroy

 attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  def stamped_by?(user)
    stamps.where(user_id: user.id).exists?
  end

    def self.search(keyword)
      where(["name like? OR introduction like?  OR address_city like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end

    geocoded_by :address_city
    after_validation :geocode
    
    validates :address_city, presence: true
    validates :name, presence: true, uniqueness: true
    validates :introduction, presence: true
    validates :tax, presence: true
    validates :opening_hours, presence: true
    validates :image, presence: true
    validates :closed,presence: true
    validates :time,presence: true
end
