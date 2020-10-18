require 'rails_helper'

RSpec.describe Web::InssCalculatorsController do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #calculate' do
    let(:params) { { salary: 1045 } }
    before { get :calculate, format: :json, params: params }

    it 'returns ok status' do
      expect(response).to have_http_status(:ok)
    end

    context 'when salary is 1045' do
      it 'returns inss_value' do
        expect(JSON.parse(response.body)).to eq({ 'inss_value' => 78.37 })
      end
    end

    context 'when salary is 2089.6' do
      let(:params) { { salary: 2089.6 } }

      it 'returns inss_value' do
        expect(JSON.parse(response.body)).to eq({ 'inss_value' => 94.01 })
      end
    end

    context 'when salary is 3000' do
      let(:params) { { salary: 3000 } }

      it 'returns inss_value' do
        expect(JSON.parse(response.body)).to eq({ 'inss_value' => 109.24 })
      end
    end
  end
end