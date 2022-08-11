class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
 # validates :user_id, uniqueness: {scope: :post_id ,Message: "Cannot Like a post Twice" }

#  validate :duplii?
#   def duplii?
#         if Reaction.find_by(user_id: user_id, post_id: post_id)            
#           errors.add(:data, "rRepeated") 
#         end
#   end
end
