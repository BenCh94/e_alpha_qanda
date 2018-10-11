require "rails_helper"

RSpec.describe AnswersController do
  let(:user) { User.create(name: 'test', email: 'test@email.ie', password: 'test123', password_confirmation: 'test123') }
  let(:question) { Question.create(title: 'Where for lunch?', text: 'pick a restraunt', user: user) }
  let(:answer) { Answer.create(text: 'Burger King', question: question, user: user) }

  describe "GET index" do
    it "assigns @answers" do
      get :index
      expect(assigns(:answers)).to eq([answer])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    context "when missing field" do
      it "fails and shows error" do 
        post :create, params: { answer: {text: 'some test'} }

        expect(response).to render_template(:new)
      end
    end

    context "when valid fields" do
      it "creates an answer" do 
        post :create, params: { answer: { text: 'some test', user_id: user.id, question_id: question.id } }

        expect(assigns(:answer).text).to eq('some test')
      end
    end
  end

  describe "GET show" do
    it "shows the answer" do 
      get :show, params: {id: answer.id}

      expect(response).to render_template(:show)
      expect(assigns(:answer)).to eq(answer)
    end
  end
end