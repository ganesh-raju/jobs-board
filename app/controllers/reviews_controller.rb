class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :review_params
  def create
  	@company = Company.find(params[:company_id])
  	@review = @company.reviews.new(review_params)
  	@review.user_id = @company.user_id
  	if @review.save!
  		flash[:notice] = "Review submitted"
  	else
  		flash[:error] = "Review not submitted"
  	end
  	redirect_to company_path(@company)
  end

  private

  def review_params
  	params.require(:review).permit(:body, :role)
  end
end
