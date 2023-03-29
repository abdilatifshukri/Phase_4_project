class ReviewsController < ApplicationController
    def index
        @reviews = Review.all 
        render json: @reviews
    end 

    def show
        @review = Review.find_by(id: params[:id])
        if @review
            render json: @review, serializer: ReviewSerializer
        else 
            render json: { error: "Hero not found" }, status: :not_found
        end
    end

    def create
            @review = Review.new (review_params)
            if @review.save 
                render json: @review, serializer: ReviewSerializer
            else 
                render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
            end
    end

    

    private

    def review_params 
        params.permit(:description, :movie_id)
    end 
end
