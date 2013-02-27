require 'spec_helper'

describe "applications/show" do
  before(:each) do
    @application = assign(:application, stub_model(Application,
      :course_no => "Course No",
      :university_id => 1,
      :passport_copy => "Passport Copy",
      :sign_form => "Sign Form",
      :semester_year => "Semester Year",
      :registrar_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Course No/)
    rendered.should match(/1/)
    rendered.should match(/Passport Copy/)
    rendered.should match(/Sign Form/)
    rendered.should match(/Semester Year/)
    rendered.should match(/2/)
  end
end
