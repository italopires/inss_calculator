require 'rails_helper'

RSpec.describe City do
  context 'relationship' do
    it { is_expected.to belong_to(:state) }
  end
end