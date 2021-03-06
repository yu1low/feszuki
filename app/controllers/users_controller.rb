class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if @user == current_user
    else
      redirect_to root_path, alert: "不正なアクセスです！"
    end
  end
  
  def update
    if @user == current_user
      if @user.update(user_params)
        flash[:success] = "ユーザー情報を編集しました"
        redirect_to current_user
      else
        render 'edit'
      end
    else
      redirect_to root_path, alert: "不正なアクセスです！"
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location, :profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

end
