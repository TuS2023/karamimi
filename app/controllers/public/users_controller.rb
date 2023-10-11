class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def check
    @user = current_user
  end

  def leave
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end


  private

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def user_parms
    parms.require(:user).permit(:name, :email)
  end
end
