require 'rails_helper'

describe 'sucessfully' do
    it 'create a project' do
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        especialidade = Area.create!(name: 'Cozinheiro')

        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Criar um projeto'

        
        fill_in 'Título', with: 'Vaga de cozinheiro no Sirigueijo Burguer'
        fill_in 'Descrição', with: 'Procuro alguém para preparo de hamburgueres de Siri'
        fill_in 'Remuneração', with: '500'
        select 'Cozinheiro', from: 'Especialidade'     
        fill_in 'Data limite para candidaturas', with: '10/11/2021' 
        fill_in 'Previsão de início', with: '10/12/2021' 
        fill_in 'Previsão de términio', with: '10/01/2022' 
        fill_in 'Número de colaboradores', with: '1'
        check 'Presencial'           
        fill_in 'Endereço', with: 'Fenda do Bikini'
        fill_in 'Cidade', with: 'Oceano Pacífico'             
        click_on 'Enviar'

        
        expect(page).to have_content("Vaga de cozinheiro no Sirigueijo Burguer")
        expect(page).to have_content('Procuro alguém para preparo de hamburgueres de Siri')
        expect(page).to have_content("Remuneração máxima por hora: R$ 500,00")
        expect(page).to have_content("Especialidade desejada: Cozinheiro")
        expect(page).to have_content("Colaboradore(s) requerido(s): 1")   
        expect(page).to have_content("Data limite para candidaturas: 10/11/2021") 
        expect(page).to have_content("Previsão de início: 10/12/2021") 
        expect(page).to have_content("Previsão de fim: 10/01/2022") 
        expect(page).to have_content("Presencial: Sim")           



        
        

    end
end