require 'factory_girl'

FactoryGirl.define do
	factory :university do
		name "Talal Sciences Institute Qatar"
	end

  factory :registrar do 
      first_name "Biannca"
      last_name "Zac"
      email "Biancca@gmail.com"
      phone  "97444144112"
      #association :schedule
  end
    
  factory :schedule do 
      file_name "filename"
      date_uploaded 2.days.ago
      semester_year "Spring2012"
      schedule "Spring.pdf"
      association :registrar
  end
end