class ProjectsController < ApplicationController    
    before_action :authenticate_employer!, only: [:new, :create, :employer_profile,
        :running, :closed]
    before_action :authenticate_freelancer!, only: [:avaiable, :freelancer_team ]
    
    
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
        @open_projects = Project.where(employer_id:current_employer.id, status:'open') 
        @full_projects = Project.where(employer_id:current_employer.id, status:'full') 
        @running_projects = Project.where(employer_id:current_employer.id, status:'running') 
        @projects= @open_projects +  @full_projects + @running_projects 
         

    end

    def running
        @project = Project.find(params[:format])
        @project.running!
        @project.save
        redirect_to @project, notice: t('.success')  

    end

    def closed
        @project = Project.find(params[:format])
        @project.closed!
        @project.save   
        redirect_to employer_profile_projects_path, notice: t('.success')     
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