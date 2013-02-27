require 'spec_helper'

describe "applications/new" do
  before(:each) do
    assign(:application, stub_model(Application,
      :course_no => "MyString",
      :university_id => 1,
      :passport_copy => "MyString",
      :sign_form => "MyString",
      :semester_year => "MyString",
      :registrar_id => 1
    ).as_new_record)
  end

  it "renders new application form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", applications_path, "post" do
      assert_select "input#application_course_no[name=?]", "application[course_no]"
      assert_select "input#application_university_id[name=?]", "application[university_id]"
      assert_select "input#application_passport_copy[name=?]", "application[passport_copy]"
      assert_select "input#application_sign_form[name=?]", "application[sign_form]"
      assert_select "input#application_semester_year[name=?]", "application[semester_year]"
      assert_select "input#application_registrar_id[name=?]", "application[registrar_id]"
    end
  end
end
