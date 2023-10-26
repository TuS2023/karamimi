class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_review_path(review.id), notice: "投稿情報を更新しました。"
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path, notice: "投稿を削除しました。"
  end

  private

  def review_params
    params.require(:review).permit(:title, :explanation, :store_name, :address, :score, :price, category_ids: [])
  end
end
