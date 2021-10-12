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

end