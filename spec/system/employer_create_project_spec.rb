require 'rails_helper'

describe 'sucessfully' do
    it 'found link to create' do
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')

        login_as sirigueijo, scope: :employer      
        visit root_path

        expect(page).to have_content('Meus projetos')
        expect(page).to have_content('Criar um projeto')

    end
    it 'see empty project profile' do
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')

        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Meus projetos'


        expect(page).to have_content('Você ainda não possui projetos')

    end

end

