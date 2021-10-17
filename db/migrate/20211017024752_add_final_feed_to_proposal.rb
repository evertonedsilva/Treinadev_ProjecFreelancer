class AddFinalFeedToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :final_feed, :text
  end
end
