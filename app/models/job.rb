class Job < ApplicationRecord

  has_and_belongs_to_many :boats

  validates :name , uniqueness: {case_sesitive: false}

  validates :cost, :numericality => { :greater_than => 1000 }

  validates_length_of :description, :minimum => 50

end
