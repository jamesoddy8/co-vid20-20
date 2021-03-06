class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :clip
  has_one_attached :thumbnail
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :likes, dependent: :destroy
  acts_as_votable
  acts_as_punchable

  def all_tags=(names)
    self.tags = names.split(", ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def self.search(search)
   where("lower(users.username) LIKE :search OR lower(videos.title) LIKE :search OR lower(videos.description) LIKE :search OR lower(tags.name) LIKE :search", search: "%#{search.downcase}%").uniq
  #  WHY do we need .uniq here? where were the duplicates coming from??
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end
end

# def self.search(search)
#   where("lower(users.username) LIKE :search OR lower(videos.title) LIKE :search OR lower(videos.description) LIKE :search", search: "%#{search.downcase}%")
# end
