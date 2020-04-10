require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      user_id: "User",
      title: "Title",
      text: "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Text/)
  end
end
