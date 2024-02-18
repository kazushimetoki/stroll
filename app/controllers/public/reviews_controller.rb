class Public::ReviewsController < ApplicationController
  def index
    @review = Review.all
  end
  
  def create
    @post = Post.find(params[:post_id])
    @review = current_user.reviews.find_or_initialize_by(post_id: @post.id)
    @review.assign_attributes(review_params)
    if @review.save
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      @comment = Comment.new
      #byebug
      review_errors = @review.errors
      @review = current_user.reviews.find_or_initialize_by(post_id: @post.id)
      review_errors.each do |error|
        @review.errors.add(error.attribute, error.type)
      end
      @reviews = @post.reviews
      flash.now[:alert] = "レビューはできません"
      render 'public/posts/show'
    end
  end
    
  private

  def review_params
    params.require(:review).permit(:star, :commentcontent)
  end
  
end
