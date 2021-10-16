class ProjectsController < ApplicationController
    def index          
        @open_projects= Project.open 
          
    end

    def show
        @projects= Project.all 
    end


    def employer_profile                    
        @projects = current_employer.projects
    end

    def new

    end

end