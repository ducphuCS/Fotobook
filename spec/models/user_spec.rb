require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'first test' do
    it 'glululu' do
      expect {User.create}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
