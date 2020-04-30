class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :clip
  has_one_attached :thumbnail

  def self.search(search)
   where("lower(users.username) LIKE :search OR lower(videos.title) LIKE :search OR lower(videos.description) LIKE :search", search: "%#{search.downcase}%")
  end


end
