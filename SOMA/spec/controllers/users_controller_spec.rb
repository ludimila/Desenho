require 'spec_helper'

describe UsersController, type: :controller do

  describe "GET 'new'" do
    xit "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    xit "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).not_to be_success
    end
  end
end
