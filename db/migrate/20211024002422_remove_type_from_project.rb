class RemoveTypeFromProject < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :type, :boolean
  end
end
