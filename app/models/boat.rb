class Boat < ApplicationRecord

  belongs_to :company
  has_and_belongs_to_many :jobs


  has_attached_file :avatar,
    :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
    :default_url => "http://www.golenbock.com/wp-content/uploads/2015/01/placeholder-user.png"

  validates_attachment_content_type :avatar,
    :content_type => /\Aimage\/.*\Z/

end
