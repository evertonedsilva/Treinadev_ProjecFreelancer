class RemoveClaimHourFromProposal < ActiveRecord::Migration[6.1]
  def change
    remove_column :proposals, :claim_hour, :decimal
  end
end
