class FreelancersController < ApplicationController
  before_action :authenticate_freelancer!, only: [:new, :create, :update]
  
end