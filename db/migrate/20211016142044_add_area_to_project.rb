class AddAreaToProject < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :area, null: true, foreign_key: true
  end
end
