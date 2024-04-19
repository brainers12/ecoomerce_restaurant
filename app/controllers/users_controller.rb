class UsersController < ApplicationController

  def new
    @user = User.new
    @provinces = Province.all
  end

  def edit
    @user = User.find(params[:id])
    @provinces = Province.all
  end

  def create
    @user = User.new(user_params)
    @provinces = Province.all

    if @user.save
     
      flash.now[:notice] = 'Account created successfully.'
      render 'new'
    else
      if User.exists?(email: user_params[:email].downcase)
        flash.now[:alert] = 'Email already registered'
      elsif user_params[:password] != user_params[:password_confirmation]
        flash.now[:alert] = 'Passwords do not match'
      end
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to some_path, notice: 'Account updated successfully.'
    else
      @provinces = Province.all
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :province_id, :street, :city, :zip_code)
  end
  
end

