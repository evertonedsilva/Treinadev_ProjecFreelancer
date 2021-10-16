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
        especialidade1 = Area.create!(name: 'Atendimento ao público')
        especialidade2 = Area.create!(name: 'Piloto')
        atendente = Project.create!(title: 'Vaga de atendente no Sirigueijo Burguer',  employer:sirigueijo,              
            description:'Procuro alguém para preparo caixa e atendimento', 
            value_hour:'500',
            limit_proposal:'10/11/2021',
            start_date:'10/12/2021' ,
            end_date:'10/01/2022' ,
            squad_num: 1,
            adress: 'Fenda do Bikini' ,
            city: 'Atlantida' ,            
            area: especialidade1,
            remote: true)
         
         astronauta = Project.create!(title: 'Vaga de astronauta na SpaceX',employer:elonmusk,              
            description:'Procuro astronautas para mandar para Marte', 
            value_hour:'50000',
            limit_proposal:'10/11/2021',
            start_date:'10/12/2021' ,
            end_date:'10/01/2022' ,
            squad_num: 1,
            adress: 'Espaço' ,
            city: 'Sideral' ,            
            area: especialidade2,
            remote: true)

        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Meus projetos'

        expect(page).to have_content('Vaga de atendente no Sirigueijo Burguer')
        expect(page).to_not have_content('Vaga de astronauta na SpaceX')

    end

    it 'see details from project' do
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        
        especialidade1 = Area.create!(name: 'Atendimento ao público')
        
        atendente = Project.create!(title: 'Vaga de atendente no Sirigueijo Burguer',  employer:sirigueijo,              
            description:'Procuro alguém para caixa e atendimento', 
            value_hour:'500',
            limit_proposal:'10/11/2021',
            start_date:'10/12/2021' ,
            end_date:'10/01/2022' ,
            squad_num: 1,
            adress: 'Fenda do Bikini' ,
            city: 'Atlantida' ,            
            area: especialidade1,
            remote: true)
         
         

        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Meus projetos'
        click_on 'Vaga de atendente no Sirigueijo Burguer'

        expect(page).to have_content('Dados do projeto') 
        expect(page).to have_content('Procuro alguém para caixa e atendimento') 
        expect(page).to have_content('Remuneração máxima por hora: R$ 500,00') 
        expect(page).to have_content('Colaboradore(s) requerido(s): 1') 
        expect(page).to have_content('Data limite para candidaturas: 10/11/2021') 
        expect(page).to have_content('Previsão de início: 10/12/2021') 
        expect(page).to have_content('Previsão de fim: 10/01/2022') 
        expect(page).to have_content('Especialidade desejada: Atendimento ao público') 
        expect(page).to have_content('Remoto: Sim') 
        expect(page).to have_content('Endereço: Fenda do Bikini - Atlantida') 

    end

end

