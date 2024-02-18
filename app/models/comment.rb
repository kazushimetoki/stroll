class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :commentcontent, presence: true 
end
