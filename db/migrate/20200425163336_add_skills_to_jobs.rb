class AddSkillsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :skills, :string
  end
end
