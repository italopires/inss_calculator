require 'rails_helper'

RSpec.describe Proponent do
  context 'relationship' do
    it { is_expected.to belong_to(:state) }
    it { is_expected.to belong_to(:city) }
  end

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
    it { is_expected.to validate_presence_of(:state_id) }
    it { is_expected.to validate_presence_of(:city_id) }
  end
end