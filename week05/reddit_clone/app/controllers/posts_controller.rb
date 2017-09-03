class PostsController < ApplicationController

  before_action :require_login

  def new
    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(param[:id])
  end

  def update
    @post = current_user.posts.find(param[:id])
    @post.update_attributes(post_params)
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
  end

  def destroy

  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
