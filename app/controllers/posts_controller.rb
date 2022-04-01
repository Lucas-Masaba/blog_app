class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
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
    user = User.find(params[:user_id])
    @post = user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = "Success"
          redirect_to "/users/#{user.id}/posts"
        else
          flash.now[:error] = "Failed"
          render :new, locals: {post: @post}
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
