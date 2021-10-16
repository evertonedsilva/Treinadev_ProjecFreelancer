class ProjectsController < ApplicationController
    def index          
        @open_projects= Project.open 
          
    end

    def show
        @projects= Project.all 
    end


    def my_project
        @projects = current_employer.projects
    end

    def new

    end

end