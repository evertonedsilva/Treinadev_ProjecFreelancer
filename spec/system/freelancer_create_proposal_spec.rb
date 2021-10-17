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
        fill_in 'Mensagem', with: 'Contrata eu'
        fill_in 'Horas disponíveis por semana', with: 3
        fill_in 'Entrega prevista', with: '10/01/2022'
        fill_in 'Pretensão salarial por hora', with: '50'
        click_on 'Enviar proposta'  

        expect(page).to have_content('Cadidatura realizada com sucesso')
        expect(page).to have_content('Mensagem: Contrata eu')
        expect(page).to have_content('Previsão de término: 10/01/2022')
        expect(page).to have_content('Horas disponíveis por semana: 3')
        expect(page).to have_content('Valor pedido por hora: R$ 50,00')  
    end

    it 'unsucessufully' do
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
    
            expect(page).to_not have_content('Cadidatura realizada com sucesso')
            expect(page).to have_content('Candidatura não efetuada - possui erros')            
            expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')






            
      
        end
   
    
end