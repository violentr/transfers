require "rails_helper"

RSpec.describe TransfersController, type: :routing do
  xdescribe "routing" do
  let(:user) {create(:user) }
  let(:transfer) {create(:transfer, user_id: user.id) }
  let(:path) { "/users/#{user.id}" }
    it "routes to #index" do
      expect(:get => path + "/transfers").to route_to("transfers#index")
    end

    it "routes to #show" do
      expect(:get => path + "/transfers/#{transfer.id}").to route_to("transfers#show", :id => transfer.id )
    end


    it "routes to #create" do
      expect(:post => path + "/transfers").to route_to("transfers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => path + "/transfers/#{transfer.id}").to route_to("transfers#update", :id => transfer.id )
    end

    it "routes to #update via PATCH" do
      expect(:patch => path + "/transfers/#{transfer.id}").to route_to("transfers#update", :id => transfer.id )
    end

    it "routes to #destroy" do
      expect(:delete => path + "/transfers/#{transfer.id}").to route_to("transfers#destroy", :id => transfer.id )
    end

  end
end
