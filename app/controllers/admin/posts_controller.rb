class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
    
  def index
    @users = User.page(params[:page])
    @posts = Post.includes(:prefecture).includes(:workout_tag)
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present?
    @posts = @posts.where(workout_tag_id: params[:workout_tag_id]) if params[:workout_tag_id].present?
    byebug
    @posts = @posts.page(params[:page])
  end
    
    
  def show
    @post = Post.find(params[:id])
    @post_comment = Comment.new
    @reviews = @post.reviews
  end
    
    
  def edit
    @users = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id) 
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

end
