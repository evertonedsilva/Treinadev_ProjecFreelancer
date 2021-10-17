class LancerInfosController < ApplicationController
    before_action :authenticate_freelancer!, only: [:new, :create, :update]

    def index        
        @profile = LancerInfo.find(current_freelancer.id)
    end
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
        
        if @profile.save       
            render :show           
        else
            render :new
        end
    end

    def edit
        @profile = LancerInfo.find(current_freelancer.id)
    end

    def update   
        @profile = LancerInfo.find(current_freelancer.id)

        @profile.freelancer = current_freelancer    
        
        if @profile.update(profile_params)      
            render :show           
        else
            render :edit
        end
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