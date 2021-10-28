require 'rails_helper'

describe ' employer user autentication' do
    it 'cannot create project without login' do
        post '/projects'
        expect(response).to redirect_to(new_employer_session_path)
    end
    it 'cannot change project status to running without login' do
        post '/projects/running'
        expect(response).to redirect_to(new_employer_session_path)
    end
    it 'cannot change project status to closed without login' do
        post '/projects/closed'
        expect(response).to redirect_to(new_employer_session_path)
    end
    it 'cannot acess all employer projects without login' do
        get  employer_profile_projects_path  
        expect(response).to redirect_to(new_employer_session_path)
    end
    it 'cannot open new project form without login' do
        get new_project_path    
        expect(response).to redirect_to(new_employer_session_path)
    end
end


