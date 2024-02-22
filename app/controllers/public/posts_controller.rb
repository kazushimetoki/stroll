class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:prefecture).includes(:workout_tag)
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present?
    @posts = @posts.where(workout_tag_id: params[:workout_tag_id]) if params[:workout_tag_id].present?
    @posts = @posts.page(params[:page])
  end
  
  def new
   @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @review = current_user.reviews.find_or_initialize_by(post_id: @post.id)
    @reviews = @post.reviews
  end
  
  def create
   
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
    
    redirect_to '/posts'
    end
  end
  
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)  
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end
  
  private
 
  def post_params
     params.require(:post).permit(:titlename, :prefecture_id, :postcontent, :image, :review, :workout_tag_id)
  end
  
  
  
end
