class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :reviews, as: :reviewable
end
