require 'rails_helper'

describe 'an autenticated employer' do
    it 'try edit employer proposal' do
        cozinha = Area.create!(name: 'Cozinha')  

        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
        cozinheiro = Project.create!( employer:sirigueijo, title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
            description:'Procuro alguém para preparo de hamburgueres de Siri', value_hour:'500', 
            limit_proposal:'10/11/2021', start_date:'10/12/2021', end_date:'10/01/2022', squad_num: 1,
            adress: 'Fenda do Bikini' , city: 'Atlantida' , area: cozinha, remote: true)
        

        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', experiences: 'Moro num abacaxi', area: cozinha, freelancer: bob )

        proposal = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)

        login_as sirigueijo, scope: :employer 
        get  edit_proposal_path(1) 
        expect(response).to redirect_to(new_freelancer_session_path) 
        expect(flash[:alert]).to eq('Apenas o dono da proposta pode editá-la')
    end

    it 'try update employer proposal' do
        cozinha = Area.create!(name: 'Cozinha')  

        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
        cozinheiro = Project.create!( employer:sirigueijo, title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
            description:'Procuro alguém para preparo de hamburgueres de Siri', value_hour:'500', 
            limit_proposal:'10/11/2021', start_date:'10/12/2021', end_date:'10/01/2022', squad_num: 1,
            adress: 'Fenda do Bikini' , city: 'Atlantida' , area: cozinha, remote: true)
        

        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', experiences: 'Moro num abacaxi', area: cozinha, freelancer: bob )

        proposal = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)

        login_as sirigueijo, scope: :employer 
        post   '/projects/1/proposals/1/cancel'        
        expect(response).to redirect_to(new_freelancer_session_path) 
        expect(flash[:alert]).to eq('Apenas o dono da proposta pode editá-la')
    end
    
  
end





