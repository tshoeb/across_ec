require 'spec_helper'

describe "schedules/edit" do
  before(:each) do
    @schedule = assign(:schedule, stub_model(Schedule,
      :file_name => "MyString",
      :schedule => "",
      :semester_year => "MyString"
    ))
  end

  it "renders the edit schedule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", schedule_path(@schedule), "post" do
      assert_select "input#schedule_file_name[name=?]", "schedule[file_name]"
      assert_select "input#schedule_schedule[name=?]", "schedule[schedule]"
      assert_select "input#schedule_semester_year[name=?]", "schedule[semester_year]"
    end
  end
end
