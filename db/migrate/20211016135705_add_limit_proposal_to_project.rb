class AddLimitProposalToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :limit_proposal, :date
  end
end
