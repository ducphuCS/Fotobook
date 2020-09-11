require 'rails_helper'

RSpec.describe "Signups", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "scenario 1 with no email" do
    visit "/users/sign_up"

    fill_in "user[firstname]", with: "First"
    fill_in "user[lastname]", with: "Last"
    fill_in "user[password]", with: "vinamilk123"
    fill_in "user[password_confirmation]", with: "vinamilk123"

    click_button "Sign up"
    expect(page).to have_text("Email can't be blank")
  end

  it "scenario 1 with no firstname" do
    visit "/users/sign_up"

    fill_in "user[lastname]", with: "Last"
    fill_in "user[email]", with: "test@yopmail.com"
    fill_in "user[password]", with: "testpass"
    fill_in "user[password_confirmation]", with: "testpass"

    click_button "Sign up"
    expect(page).to have_text("Please enter your first name")
  end

  it "scenario 1 with no lastname" do
    visit "/users/sign_up"

    fill_in "user[firstname]", with: "First"
    fill_in "user[email]", with: "test@yopmail.com"
    fill_in "user[password]", with: "testpass"
    fill_in "user[password_confirmation]", with: "testpass"

    click_button "Sign up"
    expect(page).to have_text("Please enter your last name")
  end

  it "scenario 1 with no password" do
    visit "/users/sign_up"

    fill_in "user[firstname]", with: "First"
    fill_in "user[lastname]", with: "Last"
    fill_in "user[email]", with: "test@yopmail.com"

    click_button "Sign up"
    expect(page).to have_text("Please enter your password")
  end


  it "scenario 1 with no password confirmation" do
    visit "/users/sign_up"

    fill_in "user[firstname]", with: "First"
    fill_in "user[lastname]", with: "Last"
    fill_in "user[email]", with: "test@yopmail.com"
    fill_in "user[password]", with: "testpass"
    fill_in "user[password_confirmation]", with: "passtest"

    click_button "Sign up"
    expect(page).to have_text("Please enter the same password as above")
  end

  it "scenario 2 sign up successfully" do
    visit "/users/sign_up"

    fill_in "user[firstname]", with: "First"
    fill_in "user[lastname]", with: "Last"
    fill_in "user[email]", with: "test@yopmail.com"
    fill_in "user[password]", with: "testpass"
    fill_in "user[password_confirmation]", with: "testpass"

    click_button "Sign up"
    expect(page.current_path).to eq new_user_session_path
  end
end
