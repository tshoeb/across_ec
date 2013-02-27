require 'spec_helper'
require 'factory_girl_rails'
describe Application do
  describe "Validation Macros" do
      it {should validate_presence_of(:application_date)}
      it {should validate_presence_of(:course_no)}
      it {should validate_presence_of(:passport_copy)}
      it {should validate_presence_of(:registrar_id)}
      it {should validate_presence_of(:semester_year)}
      it {should validate_presence_of(:sign_form)}
      it {should validate_presence_of(:university_id)}
  end
  
  describe "Validate good good course numbers" do
    it {should allow_value("3").for(:course_no)}
  end
  
  describe "Validate bad course numbers" do
    #it {should_not allow_value("0").for(:course_no)}
    #it {should_not allow_value("1.1").for(:course_no)}
    #it {should_not allow_value("0.5").for(:course_no)}
  end
  


  
end
