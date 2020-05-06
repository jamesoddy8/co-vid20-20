# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :vote]
  respond_to :js, :json, :html

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @comment = Comment.new
    @comments = Comment.where(video_id: params[:id])
    @video.punch(request)
    @profiles_id = @video.profiles_id
  end

  # GET /videos/new
  def new
    @profiles_id = params[:profiles_id]
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
    @profiles_id = @video.profiles_id
  end

  def vote
    if !current_user.liked? @video
      @video.liked_by current_user
    elsif current_user.liked? @video
      @video.unliked_by current_user
    end
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
    @profiles_id = @video.profiles_id
    # redirect_to profiles_path(id: @profiles_id)
  end

  def search
    if params[:search].blank?
      flash.now[:notice] = 'Empty field!'
    else
      @parameter = params[:search].downcase
      @title_results = Video.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
      @description_results = Video.all.where("lower(description) LIKE :search", search: "%#{@parameter}%")
      @tags_results = Video.joins(:tags).where("lower(tags.name) LIKE :search", search: "%#{@parameter}%")
      @user_results = Video.joins(:user).where("lower(users.username) LIKE :search", search: "%#{@parameter}%")
      @combined_results = [@title_results, @description_results, @tags_results, @user_results].flatten.uniq


      # @results = Video.joins(:user).search(params[:search])
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.require(:video).permit(:title, :description, :clip, :thumbnail, :search, :all_tags, :profiles_id)
  end
end
