require 'rails_helper'

RSpec.describe Proponent do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:birthdate) }
    it { is_expected.to validate_presence_of(:address_number) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:public_place) }
    it { is_expected.to validate_presence_of(:cep) }
    it { is_expected.to validate_presence_of(:personal_phone) }
    it { is_expected.to validate_presence_of(:salary) }
    it { is_expected.to validate_presence_of(:inss_discount) }
  end
end