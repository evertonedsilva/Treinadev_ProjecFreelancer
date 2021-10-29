require 'rails_helper'

describe 'an autenticated freelancer' do
    it 'try create a second proposal' do
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

        login_as bob, scope: :freelancer

        
        post '/projects/1/proposals/', params: { proposal: {
                message:'Não, contrata eu', week_availability: '50', 
                expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob
            }
          }

        expect(response).to redirect_to(root_path) 
        expect(flash[:alert]).to eq('Não é possível fazer duas propostas para o mesmo projeto')

    end
end