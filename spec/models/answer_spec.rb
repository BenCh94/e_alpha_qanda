require "rails_helper"

RSpec.describe Answer, :type => :model do
  let(:user) { User.create(name: 'test', email: 'test@email.ie', password: 'test123', password_confirmation: 'test123') }
  let(:question) { Question.create(title: 'Where for lunch?', text: 'pick a restraunt', user: user) }

  context "invalid answer" do
    it "has none to begin with" do
      expect(Answer.count).to eq(0)
    end

    it "won't create without question" do 
      answer = Answer.create(text: 'some text', user: user)

      expect(Answer.count).to eq(0)
    end
  end

  context "valid answers" do
    it "creates the new answer" do
      answer = Answer.create(text: 'some text', user: user, question: question)
      expect(Answer.count).to eq(1)
    end
  end
end