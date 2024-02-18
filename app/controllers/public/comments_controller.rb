class Public::CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      @review = current_user.reviews.find_or_initialize_by(post_id: @post.id)
      @reviews = @post.reviews
      flash.now[:alert] = "commentはできません"
      #byebug
      render 'public/posts/show'
    end
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commentcontent, :post_id)
  end
end
