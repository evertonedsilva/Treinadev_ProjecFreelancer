require 'rails_helper'

describe 'Freelancer view own empty profile' do
    it 'using menu' do
        #arrange
        profile = LancerInfo.new
        bobsponja = Freelancer.create!(email: 'spongee@bob.com.br', password: '123456789')
        login_as bobsponja, scope: :freelancer
        #bobsponja.lancer_info_id=profile.id
        

        #act        
        visit root_path

        #assert
        expect(page).to have_link('Complete seu perfil para acessar', href: new_lancer_info_path )
        #rota customizada my_properties adicionada em properties (routes)
    end

    it 'completing its profile' do
        
        Area.create!(name: 'Carisma')
        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        login_as julio, scope: :freelancer

        visit root_path
        click_on'Complete seu perfil para acessar'
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
    it 'completing its profile' do
       
        Area.create!(name: 'Carisma')
        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        login_as julio, scope: :freelancer

        visit root_path
        click_on'Complete seu perfil para acessar'
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
        click_on 'Voltar para pagina principal'


        #expect(page).to_not have_link('Complete seu perfil para acessar', href: new_lancer_info_path )
        expect(page).to have_link('Meu perfil', href: lancer_infos_path )
    end


end