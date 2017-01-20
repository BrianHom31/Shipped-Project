class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boats


  has_attached_file :avatar,
    :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
    :default_url => "http://www.golenbock.com/wp-content/uploads/2015/01/placeholder-user.png"

  validates_attachment_content_type :avatar,
    :content_type => /\Aimage\/.*\Z/


  # validates_uniqueness_of :name
  validates :name , uniqueness: {case_sesitive: false}

end
