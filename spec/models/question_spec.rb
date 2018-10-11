require "rails_helper"

RSpec.describe Question, :type => :model do
  let(:user) { User.create(name: 'test', email: 'test@email.ie', password: 'test123', password_confirmation: 'test123') }

  context "invalid question" do
    it "has none to begin with" do
      expect(Question.count).to eq(0)
    end

    it "won't create without user" do 
      question = Question.create(title: 'question 1?', text: 'some text')

      expect(Question.count).to eq(0)
    end
  end

  context "valid question" do
    it "creates the new question" do
      question = Question.create(title: "test?", text: 'some text', user: user)
      expect(Question.count).to eq(1)
    end
  end
end