require 'rails_helper'

RSpec.describe Web::ProponentsController do
  let!(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    let!(:proponent1) { create(:proponent) }
    let!(:proponent2) { create(:proponent) }

    before { get :index }

    it 'assigns objects' do
      expect(assigns(:objects)).to contain_exactly proponent1, proponent2
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns object' do
      expect(assigns(:object)).to be_a_new(Proponent)
    end

    it 'render new template' do
      expect(response).to render_template('web/base/new')
    end
  end

  describe 'POST #create' do
    let(:params) { attributes_for(:proponent) }

    it 'creates a new Proponent' do
      expect { post :create, params: { proponent: params } }.to change(Proponent, :count).by(1)
    end

    it 'assigns calculated inss_discount' do
      post :create, params: { proponent: params }
      value = InssCalculator.calculate(params[:salary])
      expect(assigns(:object).inss_discount).to eq value
    end
  end

  describe 'GET #edit' do
    let!(:proponent1) { create(:proponent) }

    before { get :edit, params: { id: proponent1.id } }

    it 'find and assigns a Proponent' do
      expect(assigns(:object)).to eq proponent1
    end

    it 'render new template' do
      expect(response).to render_template('web/base/edit')
    end
  end

  describe 'PUT #update' do
    let!(:params) { attributes_for(:proponent, name: 'Test Proponent') }
    let!(:proponent1) { create(:proponent) }

    it 'updates an existent Proponent' do
      expect { put(:update, params: { id: proponent1.id, proponent: params }); proponent1.reload }.to change(proponent1, :attributes)
    end

    it 'assigns calculated inss_discount' do
      put(:update, params: { id: proponent1.id, proponent: params })
      value = InssCalculator.calculate(params[:salary])
      expect(assigns(:object).inss_discount).to eq value
    end
  end

  describe 'DELETE #destroy' do
    let!(:proponent1) { create(:proponent) }

    it 'destroy an existent Proponent' do
      expect { delete :destroy, params: { id: proponent1.id } }.to change(Proponent, :count).by(-1)
    end
  end
end