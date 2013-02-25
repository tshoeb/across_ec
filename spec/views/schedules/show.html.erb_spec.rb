require 'spec_helper'

describe "schedules/show" do
  before(:each) do
    @schedule = assign(:schedule, stub_model(Schedule,
      :file_name => "File Name",
      :schedule => "",
      :semester_year => "Semester Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File Name/)
    rendered.should match(//)
    rendered.should match(/Semester Year/)
  end
end
