require 'rails_helper'

describe 'employer acess proposal' do
    it  'sucessufully' do
        cozinha = Area.create!(name: 'Cozinha')  
        piloto = Area.create!(name: 'Piloto') 

        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
        cozinheiro = Project.create!(title:'Cozinheiro', employer:sirigueijo, 
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
        

        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        profile_julio = LancerInfo.create!(name:'Julio César' , social:'Julinho', birth:'10/12/1005', 
                adress: 'Rua das Pedras num XX' , city:'Roma' , formation: 'Filosofia e Arte da Guerra', 
                description:'Otimo líder e extrategista', 
                experiences: 'Fui general, Imperador e namorei a Cleopatra',
                area: piloto, freelancer: julio )

        proposal2 = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: julio)
    
        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', 
                experiences: 'Moro num abacaxi',
                area: cozinha, freelancer: bob )
        proposal3 = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)
           
            
        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Meus projetos'
        click_on 'Vaga de cozinheiro no Sirigueijo Burguer'
        click_on 'Aceitar proposta de bob@sponj.com.br'
       
        
        expect(page).to have_content('Proposta aceita com sucesso') 
        expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')         
        
    end
    it  'and if accepted could not chage status to accepted' do
        cozinha = Area.create!(name: 'Cozinha')  
        piloto = Area.create!(name: 'Piloto') 

        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
        cozinheiro = Project.create!(title:'Cozinheiro', employer:sirigueijo, 
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
        

        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        profile_julio = LancerInfo.create!(name:'Julio César' , social:'Julinho', birth:'10/12/1005', 
                adress: 'Rua das Pedras num XX' , city:'Roma' , formation: 'Filosofia e Arte da Guerra', 
                description:'Otimo líder e extrategista', 
                experiences: 'Fui general, Imperador e namorei a Cleopatra',
                area: piloto, freelancer: julio )

        proposal2 = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: julio)
        
    
        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', 
                experiences: 'Moro num abacaxi',
                area: cozinha, freelancer: bob )
        proposal3 = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)
        proposal3.accepted!
           
            
        login_as sirigueijo, scope: :employer      
        visit root_path
        click_on 'Meus projetos'
        click_on 'Vaga de cozinheiro no Sirigueijo Burguer'
        
        expect(page).to_not have_content('Aceitar proposta de bob@sponj.com.br') 
                
        
    end

end