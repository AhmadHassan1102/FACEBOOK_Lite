class FriendsController < ApplicationController
  def create
    request = FriendRequest.find(params[:id])
    Friend.create(user_id: request.user.id, friend_id: request.friend_id)
    Friend.create(friend_id: request.user.id, user_id: request.friend_id)
    request.destroy
    redirect_to "/"
  end
  def index
    @friends = current_user.friends
  end
  def destroy
    current_user.friends.find_by(friend_id: params[:id]).destroy
    Friend.find_by(friend_id: current_user.id,user_id: params[:id]).destroy
    redirect_to "/"
  end
end
