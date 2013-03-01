require 'spec_helper'
require 'factory_girl_rails'
describe Application do
  describe "Validation Macros" do
      it {should validate_presence_of(:application_date)}
      it {should validate_presence_of(:course_no)}
      it {should validate_presence_of(:passport_copy)}
      it {should validate_presence_of(:semester_year)}
      it {should validate_presence_of(:sign_form)}
      it {should validate_presence_of(:university_id)}
  end

  describe " Creating Objects" do
        before (:each) do
        @aa = FactoryGirl.create(:application)
        @aa1 = FactoryGirl.create(:application , :course_no => "s2390")
        @aaa2 = FactoryGirl.create(:application , :semester_year => "s2013")
        end
      end

  


  
end
