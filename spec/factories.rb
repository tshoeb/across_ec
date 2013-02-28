FactoryGirl.define do
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