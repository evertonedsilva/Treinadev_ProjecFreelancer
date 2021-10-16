class Project < ApplicationRecord
    belongs_to :employer
    belongs_to :area
    enum status: {open: 5, running: 10, canceled: 20, closed: 30}

    validates :title,  
    :description, 
    :value_hour,
    :limit_proposal,
    :start_date,
    :end_date,
    :squad_num,
    :adress,
    :city ,            
    :area_id,
    :remote, presence: true
end
