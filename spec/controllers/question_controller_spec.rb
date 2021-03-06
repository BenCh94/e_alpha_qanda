require "rails_helper"

RSpec.describe QuestionsController do
  let(:user) { User.create(name: 'test', email: 'test@email.ie', password: 'test123', password_confirmation: 'test123') }
  let(:question) { Question.create(title: 'Where for lunch?', text: 'pick a restraunt', user: user) }
  let(:answer) { Answer.create(text: 'Burger King', question: question, user: user) }

  describe "GET index" do
    it "assigns @questions" do
      get :index
      expect(assigns(:questions)).to eq([question])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    context "when missing field" do
      it "fails and shows error" do 
        post :create, params: { question: {title: 'some test'} }

        expect(response).to render_template(:new)
      end
    end

    context "when valid fields" do
      it "creates a question" do 
        post :create, params: { question: { title: 'name', text: 'some test', user_id: user.id} }

        expect(assigns(:question).title).to eq('name')
      end
    end
  end

  describe "GET show" do
    it "shows the question and any answers" do 
      get :show, params: {id: question.id}

      expect(response).to render_template(:show)
      expect(assigns(:question)).to eq(question)
      expect(assigns(:answers)).to eq([answer])
    end
  end
end