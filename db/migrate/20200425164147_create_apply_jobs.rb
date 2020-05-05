class CreateApplyJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :apply_jobs do |t|
      t.string :name
      t.integer :exp
      t.string :ctc
      t.string :ectc
      t.string :notice_period
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
