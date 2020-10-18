require 'rails_helper'

RSpec.feature 'Web::Proponents' do
  given(:user) { create(:user) }

  before { login_as user }

  scenario 'create, update and destroy a proponent' do
    visit root_path

    click_link 'Proponentes'

    click_on 'Adicionar'
    fill_in 'Nome', with: 'Proponente 1'
    fill_in 'CPF', with: '12345678912'
    fill_in 'Data de Nascimento', with: I18n.l(Date.current.advance(months: -12))
    fill_in 'Logradouro', with: 'Logradouro 1'
    fill_in 'Número', with: '302'
    fill_in 'Bairro', with: 'Bairro 1'
    fill_in 'Cep', with: '64000000'
    fill_in 'Telefone Pessoal', with: '999999999'
    fill_in 'Salário', with: '3000'
    fill_in 'Telefone de Referência', with: '888888888'
    expect(page).to have_field('Desconto INSS', readonly: true, with: '109.24')
    click_button 'Salvar'

    expect(page).to have_content 'Proponente adicionado(a) com sucesso.'
    expect(page).to have_content 'Proponente 1'
    expect(page).to have_content '12345678912'
    expect(page).to have_content I18n.l(Date.current.advance(months: -12))
    expect(page).to have_content 'Logradouro 1'
    expect(page).to have_content '302'
    expect(page).to have_content 'Bairro 1'
    expect(page).to have_content '64000000'
    expect(page).to have_content '999999999'
    expect(page).to have_content 'R$ 3.000,00'
    expect(page).to have_content '888888888'
    expect(page).to have_content 'R$ 109,24'
    find('#edit').click

    fill_in 'Nome', with: 'Proponente 2'
    fill_in 'Salário', with: '2089,6'
    fill_in 'Data de Nascimento', with: I18n.l(Date.current.advance(months: -24))
    expect(page).to have_field('Desconto INSS', readonly: true, with: '94.01')
    click_button 'Salvar'

    expect(page).to have_content 'Proponente atualizado(a) com sucesso.'
    expect(page).to have_content 'Proponente 2'
    expect(page).to have_content I18n.l(Date.current.advance(months: -24))
    expect(page).to have_content 'R$ 2.089,60'
    expect(page).to have_content 'R$ 94,01'

    accept_confirm do
      find('#destroy').click
    end

    expect(page).to have_content 'Proponente removido(a) com sucesso.'
    expect(page).not_to have_content 'Proponente 2'
    expect(page).not_to have_content 'R$ 2.089,60'
    expect(page).not_to have_content 'R$ 94,01'
  end
end