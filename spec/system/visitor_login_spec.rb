require 'rails_helper'

describe 'visitor login' do
    context "as employer" do
        it 'sucessfully' do
            elonmusk = Employer.create!(email: 'elon@musk.com.br', password: '123456')
            

            visit root_path
            click_on 'Entrar como contratador'
            fill_in 'E-mail', with: elonmusk .email
            fill_in 'Chave de acesso', with: elonmusk .password
            #tem dois Entrar na tela: um para fazer 
            #o Login e outro para submeter o formulário, por isso:
            within 'form' do
                click_on 'Entrar'
            end

            expect(page).to have_content('Você ta dentro!')
            expect(page).to have_content('elon@musk.com.br')
            expect(page).to have_link('Logout')
            expect(page).not_to have_link('Entrar')
        end
    end
    context "as freelancer" do
        it "sucessfully" do
            chaves = Freelancer.create!(email: 'bolanos@sbt.com.br', password: '123456')

            visit root_path
            click_on 'Entrar como freelancer'
            fill_in 'E-mail', with: chaves .email
            fill_in 'Chave de acesso', with: chaves .password
            
            within 'form' do
                click_on 'Entrar'
            end

            expect(page).to have_content('Você ta dentro!')
            expect(page).to have_content(chaves.email)
            expect(page).to have_link('Logout')
            expect(page).not_to have_link('Entrar')
            expect(page).to have_link('Crie seu perfil para acessar')
        end        
    end    
end