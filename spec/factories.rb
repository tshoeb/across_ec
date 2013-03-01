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

  factory :application do
     application_date 2.months.ago
       course_no "s3124"
       passport_copy File.open(File.join(Rails.root, '/spec/test.pdf'))
       registrar_id 2
       semester_year "s2013"
       sign_form File.open(File.join(Rails.root, '/spec/test.pdf'))
       university_id 1
      # association :student
  end

end