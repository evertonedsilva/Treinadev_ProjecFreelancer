class FreelancersController < ApplicationController
  before_action :authenticate_freelancer!, only: [:new, :create, :update]
  def lancer_profile
    @freelancer = current_freelancer
  end
end