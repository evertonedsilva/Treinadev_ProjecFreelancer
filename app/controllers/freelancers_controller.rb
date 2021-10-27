class FreelancersController < ApplicationController
  before_action :authenticate_freelancer!, only: [:show]
  def show
  end 

  def freelancer_proposals     

    @proposals = Proposal.where(freelancer_id:current_freelancer.id)
    @open_proposal = @proposals.where(status: 'pending')
    @accepted_proposal = @proposals.where(status: 'accepted')
    @rejected_proposal = @proposals.where(status: 'rejected')
    @proposals = @open_proposal + @accepted_proposal + @rejected_proposal

   

    #.and(Proposal.where.not(status: 'canceled'))
    

  end

end