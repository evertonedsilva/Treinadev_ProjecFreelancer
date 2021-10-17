class AddWeekAvailabilityToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :week_availability, :decimal
  end
end
