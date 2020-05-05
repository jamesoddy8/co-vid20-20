class ProfilePicturesController < ApplicationController
  before_action :set_profile_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /profile_pictures
  # GET /profile_pictures.json
  def index
    @profile_pictures = ProfilePicture.all
  end

  # GET /profile_pictures/1
  # GET /profile_pictures/1.json
  def show
  end

  # GET /profile_pictures/new
  def new
    @profile_picture = ProfilePicture.new
  end

  # GET /profile_pictures/1/edit
  def edit
  end

  # POST /profile_pictures
  # POST /profile_pictures.json
  def create
    @profile_picture = ProfilePicture.new(profile_picture_params)
    @profile_picture.user = current_user
    respond_to do |format|
      if @profile_picture.save
        format.html { redirect_to '/profiles/' + @profile_picture.user.id.to_s }
        format.json { render :show, status: :created, location: @profile_picture }
      else
        format.html { render :new }
        format.json { render json: @profile_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_pictures/1
  # PATCH/PUT /profile_pictures/1.json
  def update
    respond_to do |format|
      if @profile_picture.update(profile_picture_params)
        format.html { redirect_to '/profiles/' + @profile_picture.user.id.to_s }
        format.json { render :show, status: :ok, location: @profile_picture }
      else
        format.html { render :edit }
        format.json { render json: @profile_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_pictures/1
  # DELETE /profile_pictures/1.json
  def destroy
    @profile_picture.destroy
    respond_to do |format|
      format.html { redirect_to '/profiles/' + @profile_picture.user.id.to_s }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_picture
      @profile_picture = ProfilePicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_picture_params
      params.require(:profile_picture).permit(:caption, :image)
    end
end
