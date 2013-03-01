require 'spec_helper'

describe "applications/index" do
  before(:each) do
    assign(:applications, [
      stub_model(Application,
        :course_no => "Course No",
        :university_id => 1,
        :passport_copy => "Passport Copy",
        :sign_form => "Sign Form",
        :semester_year => "Semester Year",
        :registrar_id => 2
      ),
      stub_model(Application,
        :course_no => "Course No",
        :university_id => 1,
        :passport_copy => "Passport Copy",
        :sign_form => "Sign Form",
        :semester_year => "Semester Year",
        :registrar_id => 2
      )
    ])
  end

  it "renders a list of applications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Course No".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>th", :text => "Sign Form".to_s, :count => 1
    assert_select "tr>td", :text => "Semester Year".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
