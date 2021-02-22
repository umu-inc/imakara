class ProfilesController < ApplicationController
    before_action :find_profile, only: [:show] 
    before_action :find_profile_info, only: [:edit, :update] 
    
    def index
        @profile_all = Profile.all
        @profile = current_user.profile
        @posts = current_user.posts
    end
    
    def show
        @posts = Post.where(user: params[:id])
    end

    def new
        return redirect_to edit_profile_path(current_user.profile) if current_user.profile.present?
        @profile = Profile.new
    end

    def edit
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user = current_user
        if @profile.save
            redirect_to profiles_path, notic: "成功"
        else
            render :new
        end
    end

    def update
        if  @profile.update(profile_params)
            redirect_to profiles_path, notic: "成功"
        else
            render :edit
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:name)
    end

    def find_profile
        @profile = Profile.find_by(user: params[:id])
    end

    def find_profile_info
        @profile = Profile.find(params[:id])
    end
end
