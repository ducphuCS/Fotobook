require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'associations' do
    it { should belong_to(:user).counter_cache(:album_count)}
    it { should have_many(:photos).dependent(:destroy)}
    it { should have_many(:likes)}
  end
  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:public)}
    it { should validate_length_of(:title).is_at_most(140)}
    it { should validate_length_of(:description).is_at_most(300)}
  end
end
