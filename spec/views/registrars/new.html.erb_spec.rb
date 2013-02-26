require 'spec_helper'

describe "registrars/new" do
  before(:each) do
    assign(:registrar, stub_model(Registrar,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => 1
    ).as_new_record)
  end

  it "renders new registrar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", registrars_path, "post" do
      assert_select "input#registrar_first_name[name=?]", "registrar[first_name]"
      assert_select "input#registrar_last_name[name=?]", "registrar[last_name]"
      assert_select "input#registrar_email[name=?]", "registrar[email]"
      assert_select "input#registrar_phone[name=?]", "registrar[phone]"
    end
  end
end
