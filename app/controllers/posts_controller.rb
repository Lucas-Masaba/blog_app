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
  end

  def create
  end

end
