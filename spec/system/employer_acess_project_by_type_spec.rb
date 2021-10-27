require 'rails_helper'

    describe 'employer acess projects and' do

        it 'see projects open' do
            sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
            
           
            cozinha = Area.create!(name: 'Cozinha')
            atendente = Area.create!(name: 'Atendimento ao público')

            

            atendente = Project.create!(employer:sirigueijo, 
                title: 'Vaga de atendente no Sirigueijo Burguer',  
                description:'Procuro alguém para preparo de hamburgueres de Siri', 
                value_hour:'500',
                limit_proposal:'10/11/2021',
                start_date:'10/12/2021' ,
                end_date:'10/01/2022' ,
                squad_num: 1,
                adress: 'Fenda do Bikini' ,
                city: 'Atlantida' ,            
                area: atendente,
                remote: true)
            

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

            expect(page).to have_content('Projetos em aberto')
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')

            expect(page).to_not have_content('Projetos com colaboradores completos')
            expect(page).to_not have_content('Projetos em andamento')
            expect(page).to_not have_content('Projetos concluídos')

        end

        it 'see projects full' do
            sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
            
           
            cozinha = Area.create!(name: 'Cozinha')
            atendente = Area.create!(name: 'Atendimento ao público')

            

            atendente = Project.create!( employer:sirigueijo, 
                title: 'Vaga de atendente no Sirigueijo Burguer',  
                description:'Procuro alguém para preparo de hamburgueres de Siri', 
                value_hour:'500',
                limit_proposal:'10/11/2021',
                start_date:'10/12/2021' ,
                end_date:'10/01/2022' ,
                squad_num: 1,
                adress: 'Fenda do Bikini' ,
                city: 'Atlantida' ,            
                area: atendente,
                remote: true)
            

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

            atendente.full!
            cozinheiro.full!


            login_as sirigueijo, scope: :employer      
            visit root_path
            click_on 'Meus projetos'

            expect(page).to have_content('Projetos com colaboradores completos')
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')

            expect(page).to_not have_content('Projetos em aberto')
            expect(page).to_not have_content('Projetos em andamento')
            expect(page).to_not have_content('Projetos concluídos')

        end

        it 'see projects running' do
            sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
            
           
            cozinha = Area.create!(name: 'Cozinha')
            atendente = Area.create!(name: 'Atendimento ao público')

            

            atendente = Project.create!( employer:sirigueijo, 
                title: 'Vaga de atendente no Sirigueijo Burguer',  
                description:'Procuro alguém para preparo de hamburgueres de Siri', 
                value_hour:'500',
                limit_proposal:'10/11/2021',
                start_date:'10/12/2021' ,
                end_date:'10/01/2022' ,
                squad_num: 1,
                adress: 'Fenda do Bikini' ,
                city: 'Atlantida' ,            
                area: atendente,
                remote: true)
            

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

            atendente.running!
            cozinheiro.running!


            login_as sirigueijo, scope: :employer      
            visit root_path
            click_on 'Meus projetos'

            expect(page).to have_content('Projetos em andamento')
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')

            expect(page).to_not have_content('Projetos em aberto')
            expect(page).to_not have_content('Projetos com colaboradores completos')
            expect(page).to_not have_content('Projetos concluídos')

        end

    end