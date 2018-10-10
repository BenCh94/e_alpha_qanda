require "rails_helper"

RSpec.describe User, :type => :model do
  let(:user) { User.create(name: 'test', email: 'test@email.ie') }

  context "with questions" do
    it "lists all questions" do
      question = Question.create(title: 'q 1', text: 'some text', user: user)
      question2 = Question.create(title: 'q 2', text: 'some text', user: user)
      expect(user.reload.questions).to eq([question, question2])
    end
  end

  context "with answers" do
    it "lists all questions" do
      question = Question.create(title: 'q 1', text: 'some text', user: user)
      answer = Answer.create(text: 'some text', user: user, question: question)
      expect(user.reload.answers).to eq([answer])
    end
  end
end