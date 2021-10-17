class AddFesusedJustifyToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :refused_justify, :text
  end
end
