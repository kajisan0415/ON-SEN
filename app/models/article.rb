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

  include JpPrefecture
    jp_prefecture :prefecture_code

    def prefecture_name
      JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
    end

    def prefecture_name=(prefecture_name)
      self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end

    def self.search(keyword)
      where(["name like? OR introduction like? OR prefecture_code like? OR address_city like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    end
end
