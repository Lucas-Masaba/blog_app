class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @a_post = Post.find(params[:id])
    @show_comments = @a_post.comments
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Success'
          redirect_to "/users/#{current_user.id}/posts"
        else
          flash.now[:error] = 'Failed'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
