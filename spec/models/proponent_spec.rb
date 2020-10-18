require 'rails_helper'

RSpec.describe Proponent do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
  end
end