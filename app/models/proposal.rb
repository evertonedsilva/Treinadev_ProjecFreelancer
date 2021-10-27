class Proposal < ApplicationRecord
    belongs_to :project
    belongs_to :freelancer

    enum status: {pending: 5, accepted: 10, rejected: 20, canceled: 30}

    validates :message,
    :week_availability,
    :expected_end,
    :claim_hour, 
     presence: true
    

end
