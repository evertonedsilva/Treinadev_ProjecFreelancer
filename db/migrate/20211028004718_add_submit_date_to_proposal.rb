class AddSubmitDateToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :submit_date, :date
  end
end
