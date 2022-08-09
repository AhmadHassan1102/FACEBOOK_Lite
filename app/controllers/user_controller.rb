class UserController < ApplicationController
  def index   

  end

  def register

  end

  def saveUser 
    # debugger
    @user=User.new(email: params[:email], password: params[:password])
    if @user.valid?
      @user.save
      redirect_to "/login"
    else
      redirect_to "/register"
    end
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
      @all_users=User.all
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:id] = nil     
    redirect_to '/login' 
  end 
end
