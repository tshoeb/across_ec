class Student < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :major, :mobile, :student_number, :year_of_graduation
end
