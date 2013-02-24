require 'spec_helper'

describe "registrars/show" do
  before(:each) do
    @registrar = assign(:registrar, stub_model(Registrar,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
  end
end
