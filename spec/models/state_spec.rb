require 'rails_helper'

RSpec.describe State do
  context 'relationship' do
    it { is_expected.to have_many(:cities) }
  end
end