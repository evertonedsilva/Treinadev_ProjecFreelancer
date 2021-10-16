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

    it 'see projects from its own' do
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        elonmusk = Employer.create!(email: 'elon@musk.com.br', password: '123456')

        atendente = Project.create!(title:'Atendente',employer:sirigueijo )
        astronauta = Project.create!(title:'Astronauta',employer:elonmusk)

        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Meus projetos'

        expect(page).to have_content('Atendente')
        expect(page).to_not have_content('Astronauta')

    end

end

