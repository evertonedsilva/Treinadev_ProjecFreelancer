class AddRemoteToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :remote, :boolean
  end
end
