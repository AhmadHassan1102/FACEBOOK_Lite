class FriendRequestsController < ApplicationController
    def create
        current_user.friend_requests.create(friend_id: params[:friend_id])
        @user =User.where.not(id: current_user.id)
        redirect_to "/makefriends"
    end
    def destroy

        FriendRequest.find(params[:id]).delete
        redirect_to "/makefriends"
    end
end
