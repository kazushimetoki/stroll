class Review < ApplicationRecord
    validates :user_id, uniqueness: { scope: :post_id}
    validates :commentcontent, presence: true
    validates :star, inclusion: { in: (1..5) }
end
