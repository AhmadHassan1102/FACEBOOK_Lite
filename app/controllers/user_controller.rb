class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index   
    # if session[:id]
      @posts = Post.all.order(updated_at: :desc)
    # else
    # redirect_to "/login"
    # end
  end

  # def register
  #   render "register", layout: "for_login"
  # end

  # def saveUser 
  #   @user=User.new(email: params[:email], password: params[:password])
  #   if @user.valid?
  #     @user.save
  #     redirect_to "/login"
  #   else
  #     redirect_to "/register"
  #   end
  # end
  
  # def verifyuser
  #   @user = User.find_by(email: params[:user][:email], password: params[:user][:password])
  #   if @user
  #     session[:id] = @user.id
  #     redirect_to user_index_path(@user)
  #   else
  #     redirect_to "/login"
  #   end
    
  # end

  # def login   # login page
  #   @user = User.new
  #   render "login", layout: "for_login"
  # end

  # def destroy
  #   session[:id] = nil     
  #   redirect_to '/login' 
  # end 

  def show    
    if user_signed_in?
      @user = current_user
      
    else
      redirect_to "/users/sign_in"
    end
  end

  def createReaction
    if Reaction.find_by(user_id: current_user.id, post_id: params[:id])            
      Reaction.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    else
      Reaction.create(user_id: current_user.id, post_id: params[:id])
    end
    redirect_to "/user"
  end
  def createComment
    
    Comment.create(user_id: current_user.id, post_id: params[:id],data: params[:data])
    redirect_to "/user"
  end
  def createPost
    Post.create(user_id: current_user.id,data: params[:data])
    redirect_to "/user"
  end
end
