
class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  P_LIMIT = 15
  
  def index   
      session[:pageNo] = 0
      @posts = Post.includes(:comments,:user,:reactions).limit(P_LIMIT).order(updated_at: :desc).offset(session[:pageNo]*P_LIMIT)
    
  end
  def pagination
    session[:pageNo] += 1
    @posts = Post.includes(:comments,:user,:reactions).limit(P_LIMIT).order(updated_at: :desc).offset(session[:pageNo]*P_LIMIT)
    render "index"
  end

  def show    
      @user = current_user
  end

  def createReaction
    if Reaction.find_by(user_id: current_user.id, post_id: params[:id])            
      Reaction.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    else
      Reaction.create(user_id: current_user.id, post_id: params[:id])
    end
    @posts = Post.includes(:comments,:user,:reactions).limit(P_LIMIT).order(updated_at: :desc).offset(session[:pageNo]*P_LIMIT)
    render "index"
  end
  def createComment
    
    Comment.create(user_id: current_user.id, post_id: params[:id],data: params[:data])
    redirect_to "/user"
  end
  def createPost
    Post.create(user_id: current_user.id,data: params[:data])
    redirect_to "/user"
  end
  def makefriends
    @user = User.includes(:friend_requests,:friends).where.not(id: current_user.id)
  end
  def friendrequests
    @requests = FriendRequest.where(friend_id: current_user.id)
  end
end

