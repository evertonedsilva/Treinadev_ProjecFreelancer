require 'rails_helper'

describe 'freelancer edit profile' do
    it 'sucessfully' do
        especialidade = Area.create!(name: 'Carisma')
        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile = LancerInfo.create!(name:'Bob Esponja' , social:'Calça Quadrada', birth:'10/12/2005', 
            adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Escola de esponjas', 
            description:'Entusiasta', 
            experiences: 'Moro num abacaxi',
            area: especialidade, freelancer: bob)
        
        
        login_as bob, scope: :freelancer       
        visit root_path
        click_on 'Editar perfil'

        fill_in 'Nome', with: 'Julio César'
        fill_in 'Nome social', with: 'Julinho'
        fill_in 'Nascimento', with: '10/12/1005' 
        fill_in 'Endereço', with: 'Rua das Pedras num XX'
        fill_in 'Cidade', with: 'Roma'
        fill_in 'Formação', with: 'Filosofia e Arte da Guerra'
        fill_in 'Descrição', with: 'Otimo líder e extrategista'
        fill_in 'Experiências', with: 'Fui general, Imperador e namorei a Cleopatra'
        select 'Carisma', from: 'Especialidade'
        click_on 'Enviar'

        expect(page).to have_content('Julio César')
        expect(page).to have_content('Julinho')
        expect(page).to have_content("Nascimento: 10/12/1005")
        expect(page).to have_content("Rua das Pedras num XX - Roma")
        expect(page).to have_content("Filosofia e Arte da Guerra")
        expect(page).to have_content("Otimo líder e extrategista")
        expect(page).to have_content("Fui general, Imperador e namorei a Cleopatra")
        expect(page).to have_content("Especialidade: Carisma") 

    end   
end