class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    user_id = params[:id]
    @profile_picture = ProfilePicture.where(user_id: user_id.to_i)
    @current_profile = User.find(user_id.to_i)
    @videos = Video.where(user_id: user_id.to_i).order(:updated_at).reverse_order
    render 'profiles/show'
  end

  def index
    @user = User.all
  end
  # private
  #
  # def video_params
  #   params.require(:video).permit(:title, :description, :clip, :thumbnail, :search, :all_tags, :profiles_id)
  # end
end
