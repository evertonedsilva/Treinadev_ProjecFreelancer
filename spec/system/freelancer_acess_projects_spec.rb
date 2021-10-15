require 'rails_helper'

describe 'freelancer acess projects conditioning' do
    it 'have all lancer_info' do            
        
        especialidade = Area.create!(name: 'Carisma')
        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        profile = LancerInfo.create!(name:'Julio César' , social:'Julinho', birth:'10/12/1005', 
            adress: 'Rua das Pedras num XX' , city:'Roma' , formation: 'Filosofia e Arte da Guerra', 
            description:'Otimo líder e extrategista', 
            experiences: 'Fui general, Imperador e namorei a Cleopatra',
            area: especialidade, freelancer: julio )
        
        
        login_as julio, scope: :freelancer       
        visit root_path

        
        expect(page).to have_content('Meu perfil') 
        expect(page).to have_content('Projetos')             


    end

end