class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    user_id = params[:id]
    @videos = Video.where(user_id: user_id.to_i).order(:updated_at).reverse_order
    @profiles_id = user_id
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
