require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:photos).dependent(:destroy)}
    it { should have_many(:albums).dependent(:destroy)}
    it { should have_many(:likes).dependent(:destroy)}
    it { should have_many(:followees).class_name('User').dependent(:destroy)}
    it { should have_many(:followers).class_name('User').dependent(:destroy)}
  end

  describe 'validations' do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:firstname).scoped_to(:lastname)}
    it { should validate_length_of(:firstname).is_at_most(25)}
    it { should validate_length_of(:lastname).is_at_most(25)}
    it { should validate_length_of(:email).is_at_most(255)}
    it { should validate_length_of(:password).is_at_most(64)}
  end

end
