class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, :post_id, uniqueness: {"Cannot Like a post Twice"}
end
