class UsersController < ApplicationController
    def index
        @users = User.all 
        render json: @users
    end 

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render json: @user
        else 
            render json: { error: "User not found" }, status: :not_found
        end
    end

    def create
            @User = User.new (review_params)
            if @user.save 
                render json: @user
            else 
                render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
            end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user
            if @user = User.update(user_params)
                render json: @user
            else 
                render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    def destroy
        find_user.destroy
        head :no_content
      end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params 
        params.permit(:name, :email, :password)
    end 
end
