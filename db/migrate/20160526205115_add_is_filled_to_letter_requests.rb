class AddIsFilledToLetterRequests < ActiveRecord::Migration
  def change
    add_column :letter_requests, :is_filled, :boolean
  end
end
