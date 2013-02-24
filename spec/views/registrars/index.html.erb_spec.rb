require 'spec_helper'

describe "registrars/index" do
  before(:each) do
    assign(:registrars, [
      stub_model(Registrar,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1
      ),
      stub_model(Registrar,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => 1
      )
    ])
  end

  it "renders a list of registrars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
