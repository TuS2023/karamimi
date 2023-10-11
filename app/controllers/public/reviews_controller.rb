class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review)
    else
      @reviews = Review.all
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def index
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :explanation, :image, :store_name, :score, :price, :address)

  end
end
