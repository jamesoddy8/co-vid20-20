class LikesController < ApplicationController
    before_action :find_video
    before_action :find_like, only: [:destroy]

    def new
        @like = Like.new
    end

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @video.likes.create(user_id: current_user.id)
        end
        redirect_to video_path(@video)
    end

    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else
            @like.destroy
        end
        redirect_to video_path(@video)
    end

    private

    def find_like
        @like = @video.likes.find(params[:id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, video_id: params[:video_id]).exists?
    end

    def find_video
        @video = Video.find(params[:video_id])
    end
end
