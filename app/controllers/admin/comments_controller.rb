class Admin::CommentsController < ApplicationController
    
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    redirect_to admin_post_path(@post)
  end
    
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commentcontent, :post_id)
  end
  
end