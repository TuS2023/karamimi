class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :set_user, only: [:favorites]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:review_id)
    @favorite_reviews = Review.find(favorites)
    @review = Review.find(params[:id])
  end


  private

    def ensure_guest_user
      @user = User.find(params[:id])
      if @user.name == "guestuser"
        redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :profile_image)
    end

    def is_matching_login_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to reviews_path
      end
    end

    def set_user
      @user = User.find(params[:id])
    end
end
