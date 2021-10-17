class ProposalsController < ApplicationController

    def show
        @proposal = Proposal.find(params[:id])
    end

    def create
        @proposal = current_freelancer.proposal.new(proposal_params)
        @proposal.project = Project.find(params[:project_id])
        @proposal.save
    
        redirect_to @proposal, notice: t('.success')
                          #pode ser apenas notice: 'Pedido de reserva enviado com sucesso'
    end

    private

    def proposal_params
        params.require(:proposal).permit(:message,
            :week_availability,
            :expected_end,
            :claim_hour)
    end




end