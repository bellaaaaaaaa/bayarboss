class ReviewsController < ApplicationController

    def my_reviews
        # byebug
        @user = User.find(params[:id])
        @my_reviews = Review.where(review_for:@user.id)
        @item = current_user.reviews.find_by(review_for: @user.id)
        # @write_review_for = current_user.reviews.find_by(review_for: @user.id)
        respond_to do |format|
            format.html {}
            format.js
        end
    end
end
