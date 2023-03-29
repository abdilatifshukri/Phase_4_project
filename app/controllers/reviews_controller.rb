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
            render json: { error: "Review not found" }, status: :not_found
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

    def destroy
        review = find_review
        review.destroy
        head :no_content
    end


    def update
        @review = Review.find_by(id: params[:id])
        if @review
            if @review.update(review_params)
                render json: @review.as_json(only: [:movie_id, :description])
            else
                render json: { errors: @reviews.errors.full_messages }, status: :unprocessable_entity
        end
    else
            render json: { error: 'Review not found' }, status: :not_found
        end
    end

    private

    def review_params 
        params.permit(:description, :movie_id)
    end

    def find_review
        Review.find(params[:id])
    end
end
