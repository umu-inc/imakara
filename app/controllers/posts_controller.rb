class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :destroy] 
    
    def index
        @post = Post.all
    end
    
    def show    
        path = Rails.application.routes.recognize_path(request.referer)
        if path[:controller] == "pages" && path[:action] == "index" ||
            path[:controller] == "profiles" && path[:action] == "index"
            @post = Post.find(params[:id])
            @wont = Post.find_by(wont: @post.wont)
            @wont_today = Post.where(wont: @post.wont)
        else
            @wont = Post.find_by(wont: params[:id])
            @wont_today = Post.where(wont: params[:id])
        end
    end

    def new
        return redirect_to new_profile_path if current_user.profile.nil?
        @post = Post.new
    end

    def edit
    
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to root_path, notic: "成功"
        else
            render :new
        end
    end

    def update
        if @post.update(post_params)
            redirect_to root_path, notic: "成功"
        else
            render :edit
        end
    end

    def destroy
        if @post.destroy
            redirect_to root_path, notic: "成功"
        else
            redirect_to root_path, notic: "失敗"
        end
    end

    private

    def post_params
        params.require(:post).permit(:post, :wont)
    end

    def find_post
        @post = Post.find(params[:id])
    end
    
end
