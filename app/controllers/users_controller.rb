class UsersController < ApplicationController

  def new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to '/'
      # ... successful save actions ...
    else
      # Check if the email is already taken
      if User.exists?(email: user_params[:email].downcase)
        flash[:alert] = 'Email already registered'
      else
        flash[:alert] = 'Failed to register'
      end
      redirect_to '/signup'
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end