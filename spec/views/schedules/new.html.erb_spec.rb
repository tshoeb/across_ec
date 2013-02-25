require 'spec_helper'

describe "schedules/new" do
  before(:each) do
    assign(:schedule, stub_model(Schedule,
      :file_name => "MyString",
      :schedule => "",
      :semester_year => "MyString"
    ).as_new_record)
  end

  it "renders new schedule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", schedules_path, "post" do
      assert_select "input#schedule_file_name[name=?]", "schedule[file_name]"
      assert_select "input#schedule_schedule[name=?]", "schedule[schedule]"
      assert_select "input#schedule_semester_year[name=?]", "schedule[semester_year]"
    end
  end
end
