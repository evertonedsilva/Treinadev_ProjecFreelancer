class LancerInfo < ApplicationRecord
    belongs_to :freelancer
    belongs_to :area

    validates :name,     
    :birth ,
    :adress ,
    :city ,
    :formation ,
    :description ,
    :experiences,
    :area_id,   
    presence: true
        
end
