require 'spec_helper'

describe "deadlines/show" do
  before(:each) do
    @deadline = assign(:deadline, stub_model(Deadline,
      :semester => "Semester"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Semester/)
  end
end
