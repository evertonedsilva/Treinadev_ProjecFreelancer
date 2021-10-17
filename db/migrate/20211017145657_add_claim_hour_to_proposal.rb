class AddClaimHourToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :claim_hour, :decimal
  end
end
