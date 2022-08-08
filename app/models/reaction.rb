class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, uniqueness: {scope: :post_id ,Message: "Cannot Like a post Twice" }
end
