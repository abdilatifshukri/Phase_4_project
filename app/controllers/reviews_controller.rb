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
        @user = Review.find_by(id: params[:id])
        if @review.nil?
          @review = Review.new(review_params)
          if @review.save
            render json: @review, status: :created
          else
            render json: @review.errors, status: :unprocessable_entity
          end
        else
          render json: { message: "Review already exists" }, status: :conflict
        end
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
         render json: @review
        else
          render :edit
        end
    end

    def destroy
        review = Review.find_by(id: params[:id])
        if review.nil?
            render json: { error: "Review not found" }, status: :not_found
        else
          review.destroy
          render json: @reviews
        end
    end

    private

    def review_params 
        params.permit(:description)
    end 
end
