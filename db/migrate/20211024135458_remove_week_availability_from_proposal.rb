class RemoveWeekAvailabilityFromProposal < ActiveRecord::Migration[6.1]
  def change
    remove_column :proposals, :week_availability, :decimal
  end
end
