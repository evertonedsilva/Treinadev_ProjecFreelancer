require 'rails_helper'

describe 'employer get' do
    it  'errors if invalid colaborator number, and dates of project' do
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        especialidade = Area.create!(name: 'Cozinheiro')

        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Criar um projeto'

        
        fill_in 'Título', with: 'Vaga de cozinheiro no Sirigueijo Burguer'
        fill_in 'Descrição', with: 'Procuro alguém para preparo de hamburgueres de Siri'
        fill_in 'Remuneração', with: '-500'
        select 'Cozinheiro', from: 'Especialidade'     
        fill_in 'Data limite para candidaturas', with: '10/11/1964' 
        fill_in 'Previsão de início', with: '10/01/2000' 
        fill_in 'Previsão de términio', with: '10/01/1999' 
        fill_in 'Número de colaboradores', with: '-1'
        check 'Remoto'           
        fill_in 'Endereço', with: 'Fenda do Bikini'
        fill_in 'Cidade', with: 'Oceano Pacífico'             
        click_on 'Enviar'

        
        expect(page).to have_content("Projeto deve conter pelo menos 1 colaborador")
        expect(page).to have_content("Previsão de início não pode ser em datas passadas")
        expect(page).to have_content("Previsão de términio não pode ser em datas passadas")
        expect(page).to have_content("Previsão de términio não pode ser em datas passadas")
        expect(page).to have_content("Previsão de términio deve ser depois da data de início do projeto")
        expect(page).to have_content("Data limite para candidaturas não pode ser em datas passadas")

    end
end
