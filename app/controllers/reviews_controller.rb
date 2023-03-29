class ReviewsController < ApplicationController
    def index
        @reviews = Review.all 
        render json: @reviews
    end 

    def show
        @review = Review.find_by(id: params[:id])
        if @review
            render json: @review
        else 
            render json: { error: "Hero not found" }, status: :not_found
        end
    end

    def create
            @review = Review.new (review_params)
            if @review.save 
                render json: @review
            else 
                render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
            end
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review
            if @review = Review.update(review_params)
                render json: @review
            else 
                render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { error: "Review not found" }, status: :not_found
        end
    end

    def destroy
        find_restaurant.destroy
        head :no_content
      end

    private

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def review_params 
        params.permit(:description)
    end 
end
