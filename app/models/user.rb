class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company
  has_many :reviews, through: :company, as: :reviewable
  has_many :jobs, through: :company

  has_many :apply_jobs

  enum user_role: [:recruiter, :job_seeker]
end
