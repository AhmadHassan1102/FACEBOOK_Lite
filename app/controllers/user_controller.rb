class UserController < ApplicationController
  def index   # when click on log in button


  end
  def verifyuser
    @user = User.find_by(email: params[:user][:email], password: params[:user][:password])
    if @user
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/login"
    end
    
  end

  def login   # login page
    @user = User.new
  end
  
  def show

    if session[:id]
      @user =User.find(params[:id])
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:id] = nil     
    redirect_to '/login' 
  end 
end
