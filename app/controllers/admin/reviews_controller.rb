class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @review = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    if @review.update(review_params)
      redirect_to admin_review_path(@review)
    else
      render :edit
    end
  end
  
  private
  
  def review_params
    params.require(:reivew).permit(:title, :explanation, :store_name, :address, :score, :price,)
  end
end
