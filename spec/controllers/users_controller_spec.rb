require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    build(:user).attributes
  }

  let(:invalid_attributes) {
    {name: 'Michail', fullname: 'Michail Jackson', age: '45'}
  }

  let(:valid_session) { {} }

  def json_parser(json)
    JSON.parse(json)
  end
  def user_attributes
    %w(id first_name last_name address_line_1 dob name age)
  end

  describe "POST #register" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :register, params: valid_attributes
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post :register, params: valid_attributes

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do
        post :register, params: invalid_attributes

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
