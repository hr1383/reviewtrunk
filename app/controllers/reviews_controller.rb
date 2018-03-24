class ReviewsController < ApplicationController


	def show
		review_obj = Review.find_by_identifier(params[:id])
		render :json =>review_obj.reviews
	end
end
