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
    redirect_to admin_review_path(review.id)
    #if @review.update(review_params)
      #redirect_to admin_review_path(review.id)
    #else
      #render :edit
    #end
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to '/reviews'
  end

  private

  def review_params
    params.require(:review).permit(:title, :explanation, :store_name, :address, :score, :price,)
  end
end
