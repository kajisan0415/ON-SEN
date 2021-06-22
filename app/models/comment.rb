class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  attachment :image

  validates :title, presence: true
  validates :body, presence: true
end
