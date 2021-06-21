class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  attachment :image
end
