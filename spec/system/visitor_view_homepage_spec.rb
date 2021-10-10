require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'successfully' do
    visit root_path
    expect(page).to have_css('h3', text: 'Bem vindo a sua plataforma de freelance')
  end
end