class AddAsIntegerWeekAvailabilityToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :week_availability, :integer
  end
end
