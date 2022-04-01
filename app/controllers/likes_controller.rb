class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(params.permit(:text))
    @like.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @like.save
          redirect_to "/users/#{current_user.id}/posts/#{current_user.id}", notice: 'Comment created successfully!'
        else
          # error message
          flash.now[:error] = 'Error: Post could not be created'
          # render new
          render :new, locals: { comment: }
        end
      end
    end
  end
end