require 'rails_helper'

RSpec.describe TransfersController, type: :controller do

  let(:valid_attributes) {
    user = create(:user)
    build(:transfer, user_id: user.id).attributes
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  def json_parser(json)
    JSON.parse(json)
  end

  def transfer_attributes
    ["id", "account_number_from",
     "account_number_to",
     "amount_pennies",
     "country_code_from",
     "country_code_to",
     "created_at",
     "updated_at",
     "user_id"]
  end

  describe "GET #index" do

    it "returns a success response" do
      user = create(:user)
      create(:transfer, user_id: user.id)
      get :index, params: {user_id: user.id}
      expect(response).to be_success
    end

    it "returns Array of Transfer attributes" do
      user = create(:user)
      create(:transfer, user_id: user.id)
      get :index, params: {user_id: user.id}
      output = json_parser(response.body)
      expect(output).to be_a(Array)
      expect(output.first).to be_a(Hash)
      expect(output.first.keys).to eq(transfer_attributes)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = create(:user)
      transfer = create(:transfer, user_id: user.id)
      get :show, params: {user_id: user.id, id: transfer.to_param}
      expect(response).to be_success
    end
    it "returns Transfer attributes" do
      user = create(:user)
      transfer = create(:transfer, user_id: user.id)
      get :show, params: {user_id: user.id, id: transfer.to_param}
      output = json_parser(response.body)
      expect(output.keys).to eq(transfer_attributes)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Transfer" do
        user = create(:user)
        expect {
          post :create, params: {user_id: user.id, transfer: valid_attributes}
        }.to change(Transfer, :count).by(1)
      end

      it "renders a JSON response with the new transfer" do
        user = create(:user)
        post :create, params: {user_id: user.id, transfer: valid_attributes}

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(user_transfer_url(user, Transfer.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new transfer" do

        post :create, params: {transfer: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested transfer" do
        transfer = Transfer.create! valid_attributes
        put :update, params: {id: transfer.to_param, transfer: new_attributes}, session: valid_session
        transfer.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the transfer" do
        transfer = Transfer.create! valid_attributes

        put :update, params: {id: transfer.to_param, transfer: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the transfer" do
        transfer = Transfer.create! valid_attributes

        put :update, params: {id: transfer.to_param, transfer: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested transfer" do
      transfer = Transfer.create! valid_attributes
      expect {
        delete :destroy, params: {id: transfer.to_param}, session: valid_session
      }.to change(Transfer, :count).by(-1)
    end
  end

end
