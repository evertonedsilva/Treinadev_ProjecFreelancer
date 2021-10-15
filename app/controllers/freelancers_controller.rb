class FreelancersController < ApplicationController
  before_action :authenticate_freelancer!, only: [:new, :create, :update]
  def show
  end 
end