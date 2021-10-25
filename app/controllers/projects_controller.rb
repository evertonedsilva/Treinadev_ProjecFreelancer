class ProjectsController < ApplicationController    
    before_action :authenticate_employer!, only: [:new, :create]
    def show        
        @project = Project.find(params[:id])
        @proposal= Proposal.new
        
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

    def employer_profile                    
        @projects = current_employer.projects
    end

    def freelancer_team     
        @proposal = Proposal.find(params[:format])
        @project_id =  @proposal.project_id
        @proposals = Proposal.where(project_id:@project_id, status:'accepted') 
       

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
            :area_id,
            :remote
        )
        
    end

end