require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    build(:user).attributes
  }

  let(:invalid_attributes) {
    {name: 'Michail', fullname: 'Michail Jackson', gae: '45'}
  }

  let(:valid_session) { {} }

  def json_parser(json)
    JSON.parse(json)
  end

  describe "GET #index" do
    before do
      create_list(:user, 5)
    end

    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end

    it "returns Array of user attributes" do
      get :index, params: {}
      output = json_parser(response.body)
      user_atrributes = User.first.attributes
      expect(output).to be_a(Array)
      expect(output.first).to be_a(Hash)
      expect(output.first.keys).to eq(user_atrributes.keys)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = create(:user)
      get :show, params: {id: user.to_param}
      expect(response).to be_success
    end
    it "returns User attributes" do
      user = create(:user)
      get :show, params: {id: user.to_param}
      output = json_parser(response.body)
      expect(output.keys).to eq(user.attributes.keys)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do

        post :create, params: {user: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do

        post :create, params: {user: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {"first_name"=>"Leanne", "last_name"=>"Sanford",
         "address_line_1"=>"273 Hoyt Ways", "dob"=>Date.new(1979, 12, 4)}
      }

      it "updates the requested user" do
        user = create(:user)
        put :update, params: {id: user.to_param, user: new_attributes}
        user.reload
        expect(User.first.first_name).to eq('Leanne')
        expect(User.first.last_name).to eq('Sanford')
      end

      it "renders a JSON response with the user" do
        user = create(:user)
        put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
        output = json_parser(response.body)
        expect(output.keys).to eq(user.attributes.keys)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        user = User.create! valid_attributes

        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end
  end

end
