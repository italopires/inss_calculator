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
    let!(:state1) { create(:state, name: 'State1') }
    let!(:state2) { create(:state, name: 'State2') }
    let!(:city1) { create(:city, name: 'City1', state: state1) }
    let!(:city2) { create(:city, name: 'City2', state: state2) }

    before { get :new }

    it 'assigns object' do
      expect(assigns(:object)).to be_a_new(Proponent)
    end

    it 'assigns cities' do
      expect(assigns(:cities)).to eq [city1, city2]
    end

    it 'assigns states' do
      expect(assigns(:states)).to eq [state1, state2]
    end

    it 'render new template' do
      expect(response).to render_template('web/base/new')
    end
  end

  describe 'POST #create' do
    let!(:state1) { create(:state, name: 'State1') }
    let!(:state2) { create(:state, name: 'State2') }
    let!(:city1) { create(:city, name: 'City1', state: state1) }
    let!(:city2) { create(:city, name: 'City2', state: state2) }
    let(:params) { attributes_for(:proponent, city_id: city1.id, state_id: city1.state.id) }

    it 'creates a new Proponent' do
      expect { post :create, params: { proponent: params } }.to change(Proponent, :count).by(1)
    end

    context 'assigns' do
      before { post :create, params: { proponent: params } }

      it 'assigns cities' do
        expect(assigns(:cities)).to eq [city1, city2]
      end

      it 'assigns states' do
        expect(assigns(:states)).to eq [state1, state2]
      end

      it 'assigns calculated inss_discount' do
        value = InssCalculator.calculate(params[:salary])
        expect(assigns(:object).inss_discount).to eq value
      end
    end
  end

  describe 'GET #edit' do
    let!(:state1) { create(:state, name: 'State1') }
    let!(:state2) { create(:state, name: 'State2') }
    let!(:city1) { create(:city, name: 'City1', state: state1) }
    let!(:city2) { create(:city, name: 'City2', state: state2) }
    let!(:proponent1) { create(:proponent, city: city1, state: city1.state) }

    before { get :edit, params: { id: proponent1.id } }

    it 'find and assigns a Proponent' do
      expect(assigns(:object)).to eq proponent1
    end

    it 'assigns cities' do
      expect(assigns(:cities)).to eq [city1, city2]
    end

    it 'assigns states' do
      expect(assigns(:states)).to eq [state1, state2]
    end

    it 'render new template' do
      expect(response).to render_template('web/base/edit')
    end
  end

  describe 'PUT #update' do
    let!(:state1) { create(:state, name: 'State1') }
    let!(:state2) { create(:state, name: 'State2') }
    let!(:city1) { create(:city, name: 'City1', state: state1) }
    let!(:city2) { create(:city, name: 'City2', state: state2) }
    let!(:params) { attributes_for(:proponent, name: 'Test Proponent') }
    let!(:proponent1) { create(:proponent, city: city1, state: city1.state) }

    it 'updates an existent Proponent' do
      expect { put(:update, params: { id: proponent1.id, proponent: params }); proponent1.reload }.to change(proponent1, :attributes)
    end

    context 'assigns' do
      before { put(:update, params: { id: proponent1.id, proponent: params }) }

      it 'assigns cities' do
        expect(assigns(:cities)).to eq [city1, city2]
      end

      it 'assigns states' do
        expect(assigns(:states)).to eq [state1, state2]
      end

      it 'assigns calculated inss_discount' do
        value = InssCalculator.calculate(params[:salary])
        expect(assigns(:object).inss_discount).to eq value
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:proponent1) { create(:proponent) }

    it 'destroy an existent Proponent' do
      expect { delete :destroy, params: { id: proponent1.id } }.to change(Proponent, :count).by(-1)
    end
  end
end