require 'spec_helper'

describe "schedules/index" do
  before(:each) do
    assign(:schedules, [
      stub_model(Schedule,
        :file_name => "File Name",
        :schedule => "",
        :semester_year => "Semester Year"
      ),
      stub_model(Schedule,
        :file_name => "File Name",
        :schedule => "",
        :semester_year => "Semester Year"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 4
    assert_select "tr>td", :text => "Semester Year".to_s, :count => 2
  end
end
