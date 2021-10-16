require 'rails_helper'

describe 'freelancer acess projects conditioning' do
    it 'have all lancer_info' do            
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        atendente = Project.create!(title:'Atendente',employer:sirigueijo )
        atendente.closed!
        cozinheiro = Project.create!(title:'Cozinheiro',employer:sirigueijo )

        especialidade = Area.create!(name: 'Carisma')
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
        expect(page).to_not have_content('Atendente')  
        expect(page).to have_content('Cozinheiro')    
    end

    it 'have not all lancer_info' do 
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
        atendente = Project.create!(title:'Atendente',employer:sirigueijo )
        atendente.closed!
        cozinheiro = Project.create!(title:'Cozinheiro',employer:sirigueijo )

        especialidade = Area.create!(name: 'Carisma')
        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        profile = LancerInfo.create(freelancer: julio )
        
        
        login_as julio, scope: :freelancer       
        visit root_path
        

        expect(page).to have_content('Crie seu perfil para acessar')
        expect(page).to_not have_content('Projetos disponíveis')
        expect(page).to_not have_content('Meu perfil')
        

    
    end


end