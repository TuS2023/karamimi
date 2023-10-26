class Admin::ReviewCommentsController < ApplicationController

  def destroy
    comment = ReviewComment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
