require 'rails_helper'

describe 'create a proposal' do
    it 'sucessufully' do
    sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')        
    especialidade = Area.create!(name: 'Cozinheiro')        
    cozinheiro = Project.create!(title:'Cozinheiro',employer:sirigueijo, 
        title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
        description:'Procuro alguém para preparo de hamburgueres de Siri', 
        value_hour:'500',
        limit_proposal:'10/11/2021',
        start_date:'10/12/2021' ,
        end_date:'10/01/2022' ,
        squad_num: 1,
        adress: 'Fenda do Bikini' ,
        city: 'Atlantida' ,            
        area: especialidade,
        remote: true)

        bobesponja = Freelancer.create!(email: 'bob@spoj.br', password: '123456789')

        profile = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
            adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
            description:'Entusiasmado', 
            experiences: 'Moro num abacaxi',
            area: especialidade, freelancer: bobesponja )

        login_as bobesponja, scope: :freelancer       
        visit root_path
        click_on 'Projetos'
        click_on 'Vaga de cozinheiro no Sirigueijo Burguer'
        click_on 'Enviar proposta'  

        expect(page).to have_content('Cadidatura realizada com sucesso')
    end
    
end