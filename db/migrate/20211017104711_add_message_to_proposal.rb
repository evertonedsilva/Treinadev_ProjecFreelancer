class AddMessageToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :message, :text
  end
end
