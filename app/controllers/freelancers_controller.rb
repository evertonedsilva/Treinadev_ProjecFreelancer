class FreelancersController < ApplicationController
  before_action :authenticate_freelancer!, only: [:show, :freelancer_proposals ]
  def show
  end 

  def freelancer_proposals     

    @proposals = Proposal.where(freelancer_id:current_freelancer.id).and(Proposal.where.not(status: 'canceled'))

  end

end