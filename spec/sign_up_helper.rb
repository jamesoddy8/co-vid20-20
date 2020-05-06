def create_user_and_sign_up
    visit "/"
    click_link "Sign Up"
    fill_in("Email", with: "random@email.co.uk")
    fill_in("Username", with: "random_name")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "password")
    click_button "Sign up"
  end

def create_user_and_sign_up_2
  visit "/"
  click_link "Sign Up"
  fill_in("Email", with: "random@email.com")
  fill_in("Username", with: "random_person")
  fill_in("Password", with: "password")
  fill_in("Confirm Password", with: "password")
  click_button "Sign up"
end