require 'rails_helper'

describe 'visitor create account' do
    context "as employer" do
        it 'sucessfully by navbar' do
           
            
            visit root_path
            click_on 'Cadastre-se como contratador'
            fill_in 'E-mail', with: 'elon@musk.com.br'
            fill_in 'Chave de acesso', with: "123456"
            fill_in 'Confirme', with: '123456'
            within 'form' do
                click_on 'Cadastrar'
            end

            expect(page).to have_content('Login efetuado com sucesso')
            expect(page).to have_content('elon@musk.com.br')
            expect(page).to have_link('Logout')
            expect(page).not_to have_link('Entrar')
        end
    end
    context "as freelancer" do
        it "sucessfully by navbar" do
            
            
            visit root_path
            click_on 'REGISTRE-SE AQUI COMO FREELANCER'
            fill_in 'E-mail', with: 'elon@musk.com.br'
            fill_in 'Chave de acesso', with: "123456"
            fill_in 'Confirme', with: '123456'
            within 'form' do
                click_on 'Cadastrar'
            end

            expect(page).to have_content('Login efetuado com sucesso')
            expect(page).to have_content('elon@musk.com.br')
            expect(page).to have_link('Logout')
            expect(page).not_to have_link('Entrar')
        end        
    end    
end