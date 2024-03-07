class BlogsController < ApplicationController
    before_action :get_blog, except: [:create]

    def get_blog
        @blog=Blog.find(params[:id])
    end
    
    def create
        Blog.create!(permitted_data)
        render json: {message: "Created Successfully"}, status:200
    end

    def update
        @blog.update(permitted_data)
        render json: {message: "updated Successfully"}, status:200
    end

    def show
        @blog
        # render json: {blogs: @blog}, status: 200
    end

    def destroy
        @blog.delete
        render json: {message: "Deleted Successfully"}, status:200
    end
    # def index
    #     # render json: {blogs: Blog.all}, status: 200
    # end

    # def show_status
    #     render json: {blogs: @blog.status}, status: 200
    # end

    # def view_blog
    #     @view_b = Blog.find_by status: "inactive"
    #     render json: {blogs: @view_b.all}, status: 200
    # end 

    def permitted_data
        params.permit(:title, :description, :edition)
    end



end
