class Blog < ApplicationRecord
  attachment :image
  belongs_to :user

    validates :title, presence: true
    validates :memo, length: { maximum: 220 }
    validates :body, length: { maximum: 400 }
    
end
