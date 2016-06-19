class AddMinLettersToApplicationProcesses < ActiveRecord::Migration
  def change
    add_column :application_processes, :min_letters, :integer
  end
end
