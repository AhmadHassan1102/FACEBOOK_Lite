class User < ApplicationRecord
    has_many :posts
    has_many :reactions
    has_many :friends
    has_many :comments
end
