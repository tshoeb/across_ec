require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :student_number => 1,
      :mobile => 1,
      :major => "MyString"
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", students_path, "post" do
      assert_select "input#student_first_name[name=?]", "student[first_name]"
      assert_select "input#student_last_name[name=?]", "student[last_name]"
      assert_select "input#student_email[name=?]", "student[email]"
      assert_select "input#student_student_number[name=?]", "student[student_number]"
      assert_select "input#student_mobile[name=?]", "student[mobile]"
      assert_select "input#student_major[name=?]", "student[major]"
    end
  end
end
