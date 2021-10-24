class ProposalsController < ApplicationController
    before_action :authenticate_freelancer!, only: [:new, :create, :update, :destroy]
    def show
        @proposal = Proposal.find(params[:id])
    end

    def create
        @proposal = current_freelancer.proposal.new(proposal_params)
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

    def destroy
        @proposal = Proposal.find(params[:id])    
        @proposal.destroy!
        redirect_to freelancer_proposals_path, notice: t('.success')  
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