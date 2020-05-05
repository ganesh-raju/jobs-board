class ApplyJobsController < ApplicationController
	before_action :set_a_job, only: [:new, :create]
	before_action :apply_job_params, only: [:create]
  def index
  end

  def show
  end

  def new
  	@apply_job = ApplyJob.new
  end
  
  def create
  	@apply_job = @job.apply_jobs.new(apply_job_params)
  	@apply_job.user_id = current_user.id
  	if @apply_job.save!
  		flash[:notice] = "Job applied"
  		redirect_to job_path(@job)
  	else
  		flash[:notice] = "Something went wrong"
  		redirect_to job_path(@job)
  	end
  end

  private

  def set_a_job
  	@job = Job.find(params[:job_id])
  end

  def apply_job_params
  	params.require(:apply_job).permit(:name, :ctc, :ectc, :notice_period, :exp)
  end


end
