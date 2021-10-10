require 'rails_helper'

describe 'visitor login' do
    context "as employer" do
        it 'sucessfully' do
            elonmusk = Employer.create!(email: 'elon@musk.com.br', password: '123456')

            visit root_path
            click_on 'Entrar como contratador'
            fill_in 'Email', with: elonmusk .email
            fill_in 'Senha', with: elonmusk .password
            #tem dois Entrar na tela: um para fazer 
            #o Login e outro para submeter o formulário, por isso:
            within 'form' do
                click_on 'Entrar'
            end

        expect(page).to have_content('Login efetuado com sucesso!')
        expect(page).to have_content(elonmusk.email)
        expect(page).to have_link('Logout')
        expect(page).not_to have_link('Entrar')
        end        
    end    
end