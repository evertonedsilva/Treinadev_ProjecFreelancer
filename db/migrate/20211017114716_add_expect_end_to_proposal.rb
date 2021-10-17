class AddExpectEndToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :expected_end, :date
  end
end
