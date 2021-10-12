class CreateLancerInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :lancer_infos do |t|
      t.string :name
      t.string :social
      t.date :birth
      t.string :adress
      t.string :city
      t.string :formation
      t.string :description
      t.text :experiences

      t.timestamps
    end
  end
end
