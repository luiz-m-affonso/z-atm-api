require 'rails_helper'

RSpec.describe "/bank_accounts", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      BankAccount.create! valid_attributes
      get bank_accounts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      bank_account = BankAccount.create! valid_attributes
      get bank_account_url(bank_account), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new BankAccount" do
        expect {
          post bank_accounts_url,
               params: { bank_account: valid_attributes }, headers: valid_headers, as: :json
        }.to change(BankAccount, :count).by(1)
      end

      it "renders a JSON response with the new bank_account" do
        post bank_accounts_url,
             params: { bank_account: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new BankAccount" do
        expect {
          post bank_accounts_url,
               params: { bank_account: invalid_attributes }, as: :json
        }.to change(BankAccount, :count).by(0)
      end

      it "renders a JSON response with errors for the new bank_account" do
        post bank_accounts_url,
             params: { bank_account: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested bank_account" do
        bank_account = BankAccount.create! valid_attributes
        patch bank_account_url(bank_account),
              params: { bank_account: new_attributes }, headers: valid_headers, as: :json
        bank_account.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the bank_account" do
        bank_account = BankAccount.create! valid_attributes
        patch bank_account_url(bank_account),
              params: { bank_account: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the bank_account" do
        bank_account = BankAccount.create! valid_attributes
        patch bank_account_url(bank_account),
              params: { bank_account: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested bank_account" do
      bank_account = BankAccount.create! valid_attributes
      expect {
        delete bank_account_url(bank_account), headers: valid_headers, as: :json
      }.to change(BankAccount, :count).by(-1)
    end
  end
end
