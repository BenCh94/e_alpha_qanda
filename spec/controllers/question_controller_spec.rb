require "rails_helper"

RSpec.describe QuestionsController do
  let(:user) { User.create(name: 'test', email: 'test@email.ie', password: 'test123', password_confirmation: 'test123') }
  let(:question) { Question.create(title: 'Where for lunch?', text: 'pick a restraunt', user: user) }

  describe "GET index" do
    it "assigns @users" do
      get :index
      expect(assigns(:users)).to eq([user])
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
        post :create, params: { question: { title: 'name', text: 'some test', user: user} }

        expect(assigns(:question).title).to eq('name')
      end
    end
  end

  describe "GET show" do
    it "shows the question and any answers" do 
      get :show, params: {id: user.id}

      expect(response).to render_template(:show)
      expect(assigns(:questions)).to eq([question])
    end
  end
end