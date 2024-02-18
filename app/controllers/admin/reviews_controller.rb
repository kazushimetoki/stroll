class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @review = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(review.id)  
  end

  private
  
  def review_params
    #params.require(:list).permit(:title, :body)
  end
  
end
