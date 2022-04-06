class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def create

    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params.permit(:text))
    @comment.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully!'
        else
          # error message
          flash.now[:error] = 'Error: Post could not be created'
          # render new
          render :new, locals: { comment: }
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to user_posts_path, notice: 'Comment Deleted!'
  end
end


