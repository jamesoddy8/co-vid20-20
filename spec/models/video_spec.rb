require 'rails_helper'

RSpec.describe Video, type: :model do
  it { is_expected.to be }

  it 'video has a title' do
    video = Video.new(title: "Hello")
    expect(video.title).to eq "Hello"
  end

  it 'video has a description' do
    video = Video.new(description: "I am a video")
    expect(video.description).to eq "I am a video"
  end

  it 'video has tags' do
    video = Video.new(all_tags: "video")
    expect(video.all_tags).to eq "video"
  end

  it 'video has multiple tags' do
    video = Video.new(all_tags: "video" "animal" "rabbit")
    expect(video.all_tags).to eq "video" "animal" "rabbit"
  end

end
