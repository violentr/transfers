require 'rails_helper'

RSpec.describe TransfersController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      transfer = Transfer.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      transfer = Transfer.create! valid_attributes
      get :show, params: {id: transfer.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Transfer" do
        expect {
          post :create, params: {transfer: valid_attributes}, session: valid_session
        }.to change(Transfer, :count).by(1)
      end

      it "renders a JSON response with the new transfer" do

        post :create, params: {transfer: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(transfer_url(Transfer.last))
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
