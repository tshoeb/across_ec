class Student < ActiveRecord::Base

	has_secure_password
  validates_presence_of :password, :on => :create

  attr_accessible :email, :first_name, :last_name, :major, :mobile, :student_number, :year_of_graduation, :password, :password_confirmation, :university_id

  has_many :applications
end
