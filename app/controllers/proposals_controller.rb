class ProposalsController < ApplicationController

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

    def accept
        @proposal = Proposal.find(params[:id])
        @proposal.accepted!
        redirect_to @proposal, notice: t('.success') 
    end

    private

    def proposal_params
        params.require(:proposal).permit(:message,
            :week_availability,
            :expected_end,
            :claim_hour)
    end




end