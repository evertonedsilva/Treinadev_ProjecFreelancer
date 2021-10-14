class LancerInfosController < ApplicationController
    before_action :authenticate_freelancer!, only: [:new, :create, :update]

    
    def new
        @profile = LancerInfo.new    
    end

    def show
        @profile = LancerInfo.find(params[:id])
        @areas = Area.all
        
    end

    def create     
        @profile = LancerInfo.new(profile_params)
           
        @profile.freelancer = current_freelancer      

       
        render :show     
    
    
    end

    private            

    def profile_params
        params.require(:lancer_info).permit(
            :name,  
            :social, 
            :birth ,
            :adress ,
            :city ,
            :formation ,
            :description ,
            :experiences,
            :area_id)
        
    end
  
end