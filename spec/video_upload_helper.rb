def create_video
  visit "/"
  click_link "Upload a new video"
  fill_in("Title", with: "random video")
  fill_in("Description", with: "random video description")
  attach_file('video_clip', 'testfiles/byetudemo.mov')
  attach_file('video_thumbnail', 'testfiles/Screenshot 2020-03-16 at 18.32.54.png')
  click_button "Create Video"
end
