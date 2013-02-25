require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :student_number => 1,
      :mobile => 2,
      :major => "Major"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Major/)
  end
end
