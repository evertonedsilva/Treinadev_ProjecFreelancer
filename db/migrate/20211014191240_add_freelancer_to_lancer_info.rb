class AddFreelancerToLancerInfo < ActiveRecord::Migration[6.1]
  def change
    add_reference :lancer_infos, :freelancer, null: false, foreign_key: true
  end
end
