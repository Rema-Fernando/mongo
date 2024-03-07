class UsersController < ApplicationController
    before_action :get_user, except: [:create]
    # ExampleJob.perform_later(args)
    # FailingJob.perform_now(args)
          
    #       # Schedule the job to send a welcome email one day after registration
    #   ExampleJob.perform_at(1.minutes.from_now, @user)
      

    def get_user
        @user=User.find(params[:id])
    end
    
    def create
        @user= User.create!(permitted_data)
        render json: {message: "Created Successfully"}, status:201
    end

    def update
        @user.update(permitted_data)
        render json: {message: "updated Successfully"}, status:200
    end

    def show
        @user
        # render json: {authors: @author}, status: 200
    end

    def destroy
        @user.delete
        render json: {message: "Deleted Successfully"}, status:200
    end

    # def index
    #     # authors: Author.all
    #     # render json: {authors: Author.all}, status: 200
    # end
    def permitted_data
        params.permit(:name, :email, :password)
    end
end