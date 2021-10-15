class ProjectsController < ApplicationController
    def index 
       # @open_projects= Project.find_by(status:5)    
        @open_projects= Project.open    

       # @open_projects = Project.all     
    end

    def show
        @projects= Project.all 
    end

end