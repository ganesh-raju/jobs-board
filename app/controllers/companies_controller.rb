class CompaniesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :company_params, only: [:create]

	def index
		@companies = Company.all
	end

	def show
		@company = Company.find(params[:id])
		@reviews = @company.reviews
	end

	def new
		@company = Company.new
	end

	def create
		@company = current_user.build_company(company_params)
		#nil.test!
		#nil.test!
		if @company.save!
			flash[:notice] = "company is created"
			redirect_to new_job_path
		else
			flash[:error] = "Something went wrong"
			render :new
		end
	end

	private

	def company_params
		params.require(:company).permit(:name, :description, :user_id, :location, :emp_count)
	end
end
