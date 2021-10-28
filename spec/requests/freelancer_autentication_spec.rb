require 'rails_helper'

describe ' freelancer user autentication' do
    it 'cannot create freelancer profile  without login' do
        post '/lancer_infos'
        expect(response).to redirect_to(new_freelancer_session_path)
    end
    it 'cannot open new freelance profile form without login' do
        get new_lancer_info_path    
        expect(response).to redirect_to(new_freelancer_session_path)
    end
    it 'cannot acess freelancer proposal without login' do
        get freelancer_proposals_path    
        expect(response).to redirect_to(new_freelancer_session_path)
    end
    it 'cannot acess avaiable/open projects without login' do
        get avaiable_projects_path    
        expect(response).to redirect_to(new_freelancer_session_path)
    end
    it 'cannot acess project team without login' do
        get  freelancer_team_projects_path    
        expect(response).to redirect_to(new_freelancer_session_path)
    end
end
