class AddAreaToLancerInfo < ActiveRecord::Migration[6.1]
  def change
    add_reference :lancer_infos, :area, null: false, foreign_key: true
  end
end
