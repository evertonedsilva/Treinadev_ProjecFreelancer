class ProjectsController < ApplicationController
    

    def show
        @projects= Project.all 
    end


    def employer_profile                    
        @projects = current_employer.projects
    end

    def new
        @project = Project.new  

    end

    def create
        
        @project = Project.new(data_params)

        @project.employer = current_employer   
        
        if @project.save       
            render :show           
        else
            render :new
        end

    end

    def avaiable  
        @projects= Project.open           
    end

    private            

    def data_params
        params.require(:project).permit(
            :title,  
            :description, 
            :value_hour,
            :limit_proposal,
            :start_date,
            :end_date,
            :squad_num,
            :adress ,
            :city ,
            :formation ,            
            :area_id
        )
        
    end

end