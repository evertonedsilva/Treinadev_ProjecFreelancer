require 'rails_helper'

describe 'employer change project status' do
    it  'sucessufully to running' do
        cozinha = Area.create!(name: 'Cozinha')  
        piloto = Area.create!(name: 'Piloto') 
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
        cozinheiro = Project.create!(employer:sirigueijo, 
            title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
            description:'Procuro alguém para preparo de hamburgueres de Siri', 
            value_hour:'500',
            limit_proposal:'10/11/2021',
            start_date:'10/12/2021' ,
            end_date:'10/01/2022' ,
            squad_num: 1,
            adress: 'Fenda do Bikini' ,
            city: 'Atlantida' ,            
            area: cozinha,
            remote: true)

            login_as sirigueijo, scope: :employer      
            visit root_path
            click_on 'Meus projetos'
            click_on 'Vaga de cozinheiro no Sirigueijo Burguer'
            click_on 'Iniciar projeto'

            expect(page).to have_content('Projeto iniciado com sucesso!')
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')
            
            

        end
        it  'sucessufully to running' do
            cozinha = Area.create!(name: 'Cozinha')  
            piloto = Area.create!(name: 'Piloto') 
            sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                         
            cozinheiro = Project.create!(employer:sirigueijo, 
                title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
                description:'Procuro alguém para preparo de hamburgueres de Siri', 
                value_hour:'500',
                limit_proposal:'10/11/2021',
                start_date:'10/12/2021' ,
                end_date:'10/01/2022' ,
                squad_num: 1,
                adress: 'Fenda do Bikini' ,
                city: 'Atlantida' ,            
                area: cozinha,
                remote: true)
    
                login_as sirigueijo, scope: :employer      
                visit root_path
                click_on 'Meus projetos'
                click_on 'Vaga de cozinheiro no Sirigueijo Burguer'
                click_on 'Iniciar projeto'
                click_on 'Encerrar projeto'
    
                expect(page).to have_content('Projeto encerrado com sucesso!')
                expect(page).to_not have_content('Vaga de cozinheiro no Sirigueijo Burguer')
                

            end
    end
        