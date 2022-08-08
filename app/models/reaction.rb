class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, :post_id, uniqueness: {Message: "Cannot Like a post Twice" }
end
