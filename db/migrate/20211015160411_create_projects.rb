class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.decimal :value_hour
      t.date :start_date
      t.date :end_date
      t.text :employer_feed
      t.integer :squad_num
      t.boolean :type
      t.string :adress
      t.string :city

      t.timestamps
    end
  end
end
