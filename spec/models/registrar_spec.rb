require 'spec_helper'

describe Registrar do
  describe "presence validation" do 
     it {Registrar.new.should validate_presence_of :first_name}
     it {validate_presence_of :last_name}
     it {validate_presence_of :phone}
     it {Registrar.new.should validate_presence_of :email} 
   end
   describe "validates good emails" do 
     it {should allow_value("zuhair.ghalib@gmail.com").for(:email)}
     it {should allow_value("zuhair.ghalib@gmail.qa").for(:email)}
   end
   describe "rejects bad emails" do 
     it {should_not allow_value("das.sad@gmail,com").for(:email)}
     it {should_not allow_value("das.sad@gmail.p").for(:email)}
     it {should_not allow_value("dasd.com").for(:email)}
     it {should_not allow_value("@gmail.com").for(:email)}
   end
   describe "validates good numbers" do 
     it {should allow_value("97412343243").for(:phone)}
   end
   describe "Reject bad numbers" do 
     it {should_not allow_value("800-bad-number").for(:phone)}
    end
end
