require 'spec_helper'

describe University do
  describe "Validation Macros" do
    it {should validate_presence_of(:name)}
  end
  	describe "All factories are properly created" do
	    before(:each) do
	        @talal = FactoryGirl.create(:university)
	        @cmu = FactoryGirl.create(:university, :name => "CMUQ")
	    end
	    it "should check the creation of universities" do
	        @talal.should be_valid
	        @cmu.should be_valid
	    end
	    it "should have the correct names" do
	    	@talal.name.should == "Talal Sciences Institute Qatar"
	    	@cmu.name.should == "CMUQ"
	    end
	end
end
