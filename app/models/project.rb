class Project < ApplicationRecord
    belongs_to :employer
    belongs_to :area
    has_many :proposal, dependent: :nullify

    
    enum status: {open: 5, running: 10, closed: 30}

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
