require 'rails_helper'

RSpec.describe Talk, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:duration) }
  end
end
