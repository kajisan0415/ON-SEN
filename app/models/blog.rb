class Blog < ApplicationRecord
  attachment :image
  belongs_to :user
end
