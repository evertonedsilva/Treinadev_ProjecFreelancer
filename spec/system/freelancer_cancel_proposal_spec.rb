require 'rails_helper'

describe 'frelancer delete proposal' do
    it 'sucessfully and redirected to projects page' do
             
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        cozinha = Area.create!(name: 'Cozinha')                
        cozinheiro = Project.create!( employer:sirigueijo, 
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

        elonmusk = Employer.create!(email: 'elon@musk.com.br', password: '123456')
        piloto = Area.create!(name: 'Piloto')
        astronauta = Project.create!(title: 'Vaga de astronauta na SpaceX',employer:elonmusk,              
            description:'Procuro astronautas para mandar para Marte', 
            value_hour:'50000',
            limit_proposal:'10/11/2021',
            start_date:'10/12/2021' ,
            end_date:'10/01/2022' ,
            squad_num: 1,
            adress: 'Espaço' ,
            city: 'Sideral' ,            
            area: piloto,
            remote: true)



        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
            adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
            description:'Entusiasmado', 
            experiences: 'Moro num abacaxi',
            area: cozinha, freelancer: bob )
        proposal1 = Proposal.create!(message:'Não, contrata eu', week_availability: '500', 
                expected_end:'07/10/2021',claim_hour: '30', project: astronauta, freelancer: bob)
        proposal2 = Proposal.create!(message:'Sei preparar hamburgueres', week_availability: '50', 
                expected_end:'11/11/2021',claim_hour: '3', project: cozinheiro, freelancer: bob)
       
        
        login_as bob, scope: :freelancer       
        visit root_path
        click_on 'Meus Projetos' 
        click_on 'Vaga de astronauta na SpaceX'
        click_on 'Excluir proposta'

       
        expect(page).to have_content('Proposta excluida com sucesso!')
        expect(page).to_not have_content('Vaga de astronauta na SpaceX')
        expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')



        
    end
end