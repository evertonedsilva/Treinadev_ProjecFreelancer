class Project < ApplicationRecord
    belongs_to :employer
    belongs_to :area
    has_many :proposal, dependent: :nullify

    
    enum status: {open: 5, full: 10, running: 20, closed: 30}

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
    presence: true


    validate :minimum_team
    validate :project_init_past
    validate :project_end_past
    validate :end_date_after_start_date
    validate :proposal_past



      
    #self.total_value = (end_date - start_date).to_i * property.daily_rate
  
    private
    def minimum_team
        return if squad_num.blank? 
        if squad_num < 1
            errors.add(:squad_num , 'Projeto deve conter pelo menos 1 colaborador') 
        end
    end

    def project_init_past
        return if start_date.blank? 
        
        if start_date< Date.today
            errors.add(:start_date, 'não pode ser em datas passadas') 
        end  
   end

   def proposal_past
        return if limit_proposal.blank? 
        if limit_proposal < Date.today
            errors.add(:limit_proposal, 'não pode ser em datas passadas') 
        end
    end


    def project_end_past
        return if start_date.blank? 
        if end_date < Date.today
            errors.add(:end_date, 'não pode ser em datas passadas') 
        end
    end

    def end_date_after_start_date
        return if end_date.blank? || start_date.blank?
    
        if end_date < start_date
          errors.add(:end_date, "deve ser depois da data de início do projeto")
        end
    end



end
