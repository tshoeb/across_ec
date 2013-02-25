require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :student_number => 1,
        :mobile => 2,
        :major => "Major"
      ),
      stub_model(Student,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :student_number => 1,
        :mobile => 2,
        :major => "Major"
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Major".to_s, :count => 2
  end
end
