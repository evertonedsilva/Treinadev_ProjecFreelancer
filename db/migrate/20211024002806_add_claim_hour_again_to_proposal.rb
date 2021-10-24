class AddClaimHourAgainToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :claim_hour, :integer
  end
end
