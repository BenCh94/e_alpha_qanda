require "rails_helper"

RSpec.describe UsersController do
  let(:user) { User.create(name: 'test', email: 'test@email.ie') }

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
        post :create, params: { user: {email: 'some@test.ie'} }

        expect(response).to render_template(:new)
      end
    end

    context "when valid fields" do
      it "creates" do 
        post :create, params: { user: { name: 'name', email: 'some@test.ie'} }

        expect(assigns(:user).name).to eq('name')
      end
    end
  end
end