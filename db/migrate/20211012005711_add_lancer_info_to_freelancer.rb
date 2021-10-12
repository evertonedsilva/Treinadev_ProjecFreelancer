class AddLancerInfoToFreelancer < ActiveRecord::Migration[6.1]
  def change
    add_reference :freelancers, :lancer_info, null: true, foreign_key: true
  end
end
