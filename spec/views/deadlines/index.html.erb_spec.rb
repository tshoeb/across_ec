require 'spec_helper'

describe "deadlines/index" do
  before(:each) do
    assign(:deadlines, [
      stub_model(Deadline,
        :semester => "Semester"
      ),
      stub_model(Deadline,
        :semester => "Semester"
      )
    ])
  end

  it "renders a list of deadlines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Semester".to_s, :count => 2
  end
end
