require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        user_id: "User",
        title: "Title",
        text: "Text"
      ),
      Question.create!(
        user_id: "User",
        title: "Title",
        text: "Text"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", text: "User".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Text".to_s, count: 2
  end
end
