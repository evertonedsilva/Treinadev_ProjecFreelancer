class LancerInfosController < ApplicationController
    def new
        @profile = LancerInfo.new    
    end

    def show
        @profile = LancerInfo.find(params[:id])
        @areas = Area.all
    end

    def create        
        @profile = LancerInfo.new(profile_params)    

        @profile.save        

       
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