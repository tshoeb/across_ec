class Student < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :major, :mobile, :student_number, :year_of_graduation, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :on => :create

end
