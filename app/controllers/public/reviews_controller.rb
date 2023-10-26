class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to review_path(@review)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      @reviews = Review.all
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
    @review_comment = ReviewComment.new
  end

  def index
    if params[:latest]
      @reviews = Review.latest
    elsif params[:old]
      @reviews = Review.old
    elsif params[:high_score]
      @reviews = Review.high_score
    elsif params[:low_score]
      @reviews = Review.low_score
    else
      @reviews = params[:category_id].present? ? Category.find(params[:category_id]).reviews : Review.all
    end

    if params[:keyword]
      @reviews = @reviews.search(params[:keyword]).page(params[:page])
    else
      @reviews = @reviews.page(params[:page])
    end
    @keyword = params[:keyword]

  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    flash[:notice] = "投稿の編集に成功しました。"
    redirect_to review_path(review.id)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = "投稿の削除に成功しました。"
    redirect_to '/reviews'
  end

  private

  def review_params
    params.require(:review).permit(:title, :explanation, :image, :store_name, :score, :price, :address, category_ids: [])
  end

end
