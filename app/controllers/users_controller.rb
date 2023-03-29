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
        @user = User.find_by(id: params[:id])
        if @user.nil?
          @user = User.new(user_params)
          if @user.save
            render json: @user, status: :created
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          render json: { message: "User already exists" }, status: :conflict
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
         render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user.nil?
            render json: { error: "User not found" }, status: :not_found
        else
          user.destroy
          render json: @users
        end
      end
    

    private

    def user_params 
        params.permit(:name, :email, :password)
    end 
end
