class ProposalsController < ApplicationController    
    
    before_action :autenticate_proposal_edition!, only: [ :edit, :update, :cancel]
   
    before_action :autenticate_proposal_acept_reject!, only: [:accept, :reject_justify, :reject]
    
    before_action :expired_proposal_cancel!, only: [:cancel]
   
    before_action :expired_proposal_deadline!, only: [:create]
    
    before_action :duplicate_proposal!, only: [:create]
    
    before_action :authenticate_freelancer!, only: [:new, :create, :edit, :update, :cancel]
    before_action :authenticate_employer!, only: [ :accept, :reject_justify, :reject]
    before_action :authenticate_user!, only: [ :show ]


    def authenticate_user!
        redirect_to root_path, alert: "Acesso apenas para usuários logados" unless 
        freelancer_signed_in? || employer_signed_in?
    end

    def autenticate_proposal_acept_reject!
        project_id = Proposal.find(params[:id]).project_id
        employer_id = Project.find(project_id).employer_id
            if current_employer.blank?
                redirect_to new_employer_session_path, alert: "Apenas o dono do projeto pode aceitar ou rejeitar a proposta"
            else  
                redirect_to new_employer_session_path, alert: "Apenas o dono do projeto pode aceitar ou rejeitar a proposta" unless 
                current_employer.id ==  employer_id
            end
    end

  
    def autenticate_proposal_edition!
        proposal = Proposal.find(params[:id])
        if current_freelancer.blank?
            redirect_to new_freelancer_session_path, alert: "Apenas o dono da proposta pode editá-la"
        else
            redirect_to new_freelancer_session_path, alert: "Apenas o dono da proposta pode editá-la" unless
            current_freelancer.id==proposal.freelancer_id
        end
    end

    def expired_proposal_cancel!
        proposal = Proposal.find(params[:id])
        redirect_to root_path, alert: "Proposta só pode ser cancelada 3 dias após ser submetida" unless 
        proposal.submit_date > 3.day.ago        
    end

    def expired_proposal_deadline!
        project = Project.find(params[:project_id])        
        redirect_to root_path, alert: "A proposta só pode ser cancelada 3 dias após ser submetida" unless 
        project.limit_proposal > Time.now     
    end

    def duplicate_proposal!
        project = Project.find(params[:project_id])
        proposals = Proposal.where.not(project:project) 
        active_proposals = proposals.where.not(status:'canceled')         
        proposal_freelancer_ids = active_proposals.pluck(:freelancer_id)        
        redirect_to root_path, alert: "A proposta só pode ser cancelada 3 dias após ser submetida" unless 
        proposal_freelancer_ids.exclude?(current_freelancer.id)    
    end



    def show
        @proposal = Proposal.find(params[:id])
    end

    def create
        @proposal = current_freelancer.proposals.new(proposal_params)
        @proposal.project = Project.find(params[:project_id])

        if @proposal.save    
            redirect_to @proposal, notice: t('.success')  
        else
            redirect_to project_path(params[:project_id]), notice: t('.unsuccess') 
        end

    end  

    def edit
        @proposal =  Proposal.find(params[:id]) 
    end

    def update   
        @proposal = Proposal.find(params[:id])       

        @proposal.freelancer = current_freelancer    
        
        if @proposal.update(proposal_params)      
            redirect_to proposal_path , notice: t('.success')
        else
            render :edit
        end
    end

    def cancel
        @proposal = Proposal.find(params[:id])    
        @proposal.canceled! 
        @proposal.save
        redirect_to freelancer_proposals_path, notice: t('.success') 
        # não exclui do banco, só oculta do usuario 

    end


    def accept
        @proposal = Proposal.find(params[:project_id])
        @proposal.accepted!
        redirect_to @proposal, notice: t('.success') 
    end

    def reject_justify
        @proposal = Proposal.find(params[:project_id])


    end

    def reject
        @proposal = Proposal.find(params[:project_id])
        @proposal.refused_justify=  params[:refused_justify]
        @proposal.rejected!
        @proposal.save

        if (@proposal.refused_justify == nil) or (@proposal.refused_justify == '')
            redirect_to  reject_justify_project_proposal_path(@proposal.id), 
            notice: 'Justificativa não pode ficar em branco!'
        else

            @proposal.rejected!
            redirect_to @proposal,
            notice: 'Justificativa registrada com sucesso!'
        end
    end

    private

    def proposal_params
        params.require(:proposal).permit(:message,
            :week_availability,
            :expected_end,
            :claim_hour)
    end   




end