class AddMaxLettersToApplicationProcesses < ActiveRecord::Migration
  def change
    add_column :application_processes, :max_letters, :integer
  end
end
