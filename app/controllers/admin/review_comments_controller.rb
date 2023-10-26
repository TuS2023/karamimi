class Admin::ReviewCommentsController < ApplicationController

  def destroy
    comment = ReviewComment.find(params[:id])
    comment.destroy
    redirect_to request.referer, notice: "コメントを削除しました。"
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
