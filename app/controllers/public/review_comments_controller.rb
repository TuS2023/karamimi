class Public::ReviewCommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    comment = current_user.review_comments.new(review_comment_params)
    comment.review_id = review.id

    if comment.save
      flash[:notice] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = ReviewComment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to request.referer
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
