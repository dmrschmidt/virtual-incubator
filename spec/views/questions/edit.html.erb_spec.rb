require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      user_id: "MyString",
      title: "MyString",
      text: "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[user_id]"

      assert_select "input[name=?]", "question[title]"

      assert_select "input[name=?]", "question[text]"
    end
  end
end
