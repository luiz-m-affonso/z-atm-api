require "rails_helper"

RSpec.describe BankCostumersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bank_costumers").to route_to("bank_costumers#index")
    end

    it "routes to #show" do
      expect(get: "/bank_costumers/1").to route_to("bank_costumers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bank_costumers").to route_to("bank_costumers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/bank_costumers/1").to route_to("bank_costumers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/bank_costumers/1").to route_to("bank_costumers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bank_costumers/1").to route_to("bank_costumers#destroy", id: "1")
    end
  end
end
