class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    comment.post_id = params[:post_id]

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = "Success"
          redirect_to "/users/#{current_user.id}/posts"
        else
          flash.now[:error] = "Failed"
          render :new, locals: {comment: comment}
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end