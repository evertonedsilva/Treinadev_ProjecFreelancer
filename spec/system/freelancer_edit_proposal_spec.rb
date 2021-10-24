require 'rails_helper'

describe 'freelancer edit proposal and' do
    it  'sucessufully with changes' do
        cozinha = Area.create!(name: 'Cozinha')  
        
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
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
    
        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', 
                experiences: 'Moro num abacaxi',
                area: cozinha, freelancer: bob )

        proposal = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)
           
            
        login_as bob, scope: :freelancer     
        visit root_path         
        click_on 'Meus Projetos'
        click_on 'Vaga de cozinheiro no Sirigueijo Burguer'
        click_on 'Editar proposta'

        fill_in 'Mensagem', with: 'Posso fazer horas extras'
        fill_in 'Horas disponíveis por semana', with: 300
        fill_in 'Entrega prevista', with: '02/01/2022'
        fill_in 'Pretensão salarial por hora', with: '25'
        click_on 'Alterar proposta' 
        
        expect(page).to have_content('Proposta alterada com êxito!') 
        expect(page).to have_content('Projeto: Vaga de cozinheiro no Sirigueijo Burguer') 
        expect(page).to have_content('Mensagem: Posso fazer horas extras') 
        expect(page).to have_content('Previsão de término: 02/01/2022') 
        expect(page).to have_content('Horas disponíveis por semana: 300') 
        expect(page).to have_content('Valor pedido por hora: R$ 25,00') 
        expect(page).to have_content('Situação: Pendente') 
        expect(page).to have_content('Reveja os dados do projeto:') 
        expect(page).to have_content('Descrição: Procuro alguém para preparo de hamburgueres de Siri') 

    end

    it  'sucessufully with no changes' do
        cozinha = Area.create!(name: 'Cozinha')  
        
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
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
    
        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', 
                experiences: 'Moro num abacaxi',
                area: cozinha, freelancer: bob )

        proposal = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)
           
            
        login_as bob, scope: :freelancer     
        visit root_path         
        click_on 'Meus Projetos'
        click_on 'Vaga de cozinheiro no Sirigueijo Burguer'
        click_on 'Editar proposta'        
        click_on 'Alterar proposta' 
        
        expect(page).to have_content('Proposta alterada com êxito!') 
        expect(page).to have_content('Projeto: Vaga de cozinheiro no Sirigueijo Burguer') 
        expect(page).to have_content('Mensagem: Não, contrata eu') 
        expect(page).to have_content('Previsão de término: 01/01/2021') 
        expect(page).to have_content('Horas disponíveis por semana: 50') 
        expect(page).to have_content('Valor pedido por hora: R$ 30,00') 
        expect(page).to have_content('Situação: Pendente') 
        expect(page).to have_content('Reveja os dados do projeto:') 
        expect(page).to have_content('Descrição: Procuro alguém para preparo de hamburgueres de Siri') 

    end

    it  'he is blocked because proposal is already approved' do
        cozinha = Area.create!(name: 'Cozinha')  
        
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                     
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
    
        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', 
                experiences: 'Moro num abacaxi',
                area: cozinha, freelancer: bob )

        proposal = Proposal.create!(message:'Não, contrata eu', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)

        proposal.accepted!
           
            
        login_as bob, scope: :freelancer     
        visit root_path         
        click_on 'Meus Projetos'
        click_on 'Vaga de cozinheiro no Sirigueijo Burguer'        
        
        expect(page).to have_content('Situação: Aceita') 
        expect(page).to_not have_content('Editar proposta') 

    end


end