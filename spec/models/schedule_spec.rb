require 'spec_helper'

describe Schedule do
  it{should belong_to(:registrar)}
  it{should validate_presence_of(:file_name)}
  it{should validate_presence_of(:date_uploaded)}
  it{should validate_presence_of(:semester_year)}
  

  describe "Factory Creation" do 
    it "should create valid objects" do 
      @reg = FactoryGirl.create(:registrar)
      @sch = FactoryGirl.create(:schedule, :registrar_id => @reg.id)
      @sch.should be_valid
    end
  end
  
  

end
