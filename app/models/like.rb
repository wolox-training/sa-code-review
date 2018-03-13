class Like < ApplicationRecord
  validates :post_id, uniqueness: { scope: %i[user_id] }

  belongs_to :user, required: true
  belongs_to :post, required: true
end
