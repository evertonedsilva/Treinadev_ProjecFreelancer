class FreelancersController < ApplicationController
  before_action :authenticate_freelancer!, only: [:new, :create, :update]
  def show
  end 

  def freelancer_proposals     
    @proposals = Proposal.where(freelancer_id:current_freelancer.id)
  end

end