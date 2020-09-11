require 'rails_helper'

RSpec.describe "SignUp", type: :request do
  describe "GET /sign_up" do
    it "works! scenario 1" do
      get new_user_registration_path
      expect(response).to render_template("devise/registrations/new")
    end

    it "failed because missing required email" do
      before_count = User.count
      post user_registration_path, params: {user: {firstname: "First", lastname: "Last", password: "testpass", password_confirmation: "testpass"}}

      expect(User.count).to eq before_count
      expect(response).to render_template("devise/registrations/new")
    end

    it "failed because missing required password" do
      before_count = User.count
      post user_registration_path, params: {user: {firstname: "First", lastname: "Last", email: "test@yopmail.com"}}

      expect(User.count).to eq before_count
      expect(response).to render_template("devise/registrations/new")
    end

    it "failed because missing required password confirmation" do
      before_count = User.count
      post user_registration_path, params: {user: {firstname: "First", lastname: "Last", email: "test@yopmail.com", password: "testpass", password_confirmation: ""}}

      expect(User.count).to eq before_count
      expect(response).to render_template("devise/registrations/new")
    end

    it "post request successfully" do
      before_count = User.count
      post user_registration_path, params: {user: {firstname: "First", lastname: "Last", email: "test@yopmail.com", password: "testpass", password_confirmation: "testpass"}}

      expect(User.count).not_to eq before_count
      expect(response).to redirect_to(root_path)
    end
  end
end
