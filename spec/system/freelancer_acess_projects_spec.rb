require 'rails_helper'

describe 'freelancer acess projects conditioning' do
    it 'have all lancer_info' do            
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        especialidade = Area.create!(name: 'Carisma')
        atendente = Project.create!(title:'Atendente', employer:sirigueijo, 
            title: 'Vaga de atendente no Sirigueijo Burguer',  
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
        atendente.closed!
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

        
        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        profile = LancerInfo.create!(name:'Julio César' , social:'Julinho', birth:'10/12/1005', 
            adress: 'Rua das Pedras num XX' , city:'Roma' , formation: 'Filosofia e Arte da Guerra', 
            description:'Otimo líder e extrategista', 
            experiences: 'Fui general, Imperador e namorei a Cleopatra',
            area: especialidade, freelancer: julio )
        
        
        login_as julio, scope: :freelancer       
        visit root_path
        click_on 'Projetos'

        
        expect(page).to have_content('Projetos disponíveis') 
        expect(page).to_not have_content('Vaga de atendente no Sirigueijo Burguer')  
        expect(page).to have_content('Vaga de cozinheiro no Sirigueijo Burguer')    
    end

    it 'have all lancer_info' do            
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        especialidade = Area.create!(name: 'Carisma')
        atendente = Project.create!(title:'Atendente', employer:sirigueijo, 
            title: 'Vaga de atendente no Sirigueijo Burguer',  
            description:'Procuro alguém para preparo caixa e atendimento', 
            value_hour:'500',
            limit_proposal:'10/11/2021',
            start_date:'10/12/2021' ,
            end_date:'10/01/2022' ,
            squad_num: 1,
            adress: 'Fenda do Bikini' ,
            city: 'Atlantida' ,            
            area: especialidade,
            remote: true)
        atendente.closed!
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

        
        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        profile = LancerInfo.create(freelancer: julio )
        
        
        login_as julio, scope: :freelancer       
        visit root_path

        
        expect(page).to have_content('Crie seu perfil para acessar')
        expect(page).to_not have_content('Projetos disponíveis')
        expect(page).to_not have_content('Meu perfil')   
    end
   
    


end