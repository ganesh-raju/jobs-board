class ApplyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job

  def self.job_applied(user, job)
  	where('user_id like ? and job_id like ?', user, job)
  end
end
