class RemoveTotalLettersToApplicationProcesses < ActiveRecord::Migration
  def change
    remove_column :application_processes, :total_letters, :integer
  end
end
