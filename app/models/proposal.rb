class Proposal < ApplicationRecord
    belongs_to :project
    belongs_to :freelancer

    

    enum status: {pending: 5, accepted: 10, rejected: 20, canceled: 30}

    validates :message,
    :week_availability,
    :expected_end,
    :claim_hour, 
     presence: true

     before_save :insert_submit_day
     validate :project_expired
     

     private
 
 
     def insert_submit_day
         self.submit_date = Date.today
     end
 
 
     
    def project_expired
        if Date.today>project.limit_proposal
            errors.add(:submit_date, 'esta fora do prazo estipulado')
        end
     
    end 
end
