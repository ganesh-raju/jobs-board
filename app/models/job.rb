class Job < ApplicationRecord
  belongs_to :company
  has_many :apply_jobs

  def self.search_job(search_params)
  	if search_params["company_name"].present?
  		company_name = Company.where("name like ?", "%#{search_params["company_name"]}%")
  		jobs = company_name.map{|a| a.jobs.where("title like ?", "%#{search_params["job_title"]}%")}[0] if (company_name.present? and search_params["job_title"].present?)
      jobs.present? ? jobs  : company_name.map{|a| a.jobs }[0]
  	else
  		self.where("title like ?", "%#{search_params["job_title"]}%")
  	end
  end

end
