class ProposalsController < ApplicationController
    before_action :authenticate_freelancer!, only: [:new, :create, :edit, :update, :cancel]
    before_action :authenticate_employer!, only: [ :accept, :reject_justify, :reject]
    before_action :authenticate_user!, only: [ :show ]

    def authenticate_user!
        redirect_to root_path, alert: "Acesso apenas para usuarios logados" unless freelancer_signed_in? || employer_signed_in?
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