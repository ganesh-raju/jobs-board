class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, except: [:index, :show]
  before_action :set_job, only: [ :edit, :update, :destroy]
  before_action :check_current_user_applied_for_this_job, only: [:show]


  def index
    @search_params = params[:search]
    if @search_params.present?
      @jobs = Job.search_job(@search_params)
    else
      @jobs = Job.all
    end
    respond_to do |format|
      format.html
      format.json
    end

  end

  def show
    @job = Job.includes(:apply_jobs).find(params[:id])
    #nil.test!
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = @company.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    def set_company
      #nil.test!
      if current_user.job_seeker?
        redirect_to jobs_path
      else
        if current_user.company.present?
          @company = current_user.company
        else
          flash[:notice] = 'Please create company'
          redirect_to new_company_path
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def check_current_user_applied_for_this_job
      return unless user_signed_in? 
      @job_applied = ApplyJob.job_applied(current_user.id, params["id"].to_i)
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :company_id, :location, :salary, :skills)
    end
end
