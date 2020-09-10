require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'associations' do
    it { should belong_to(:user).counter_cache(:photo_count)}
    it { should belong_to(:album).optional}
    it { should have_many(:likes)}
  end

  describe 'associations' do
    it { should validate_presence_of(:title)}
    it { should validate_length_of(:title).is_at_most(140)}
    it { should validate_presence_of(:description)}
    it { should validate_length_of(:description).is_at_most(300)}
    it { should validate_presence_of(:public)}
  end
end
