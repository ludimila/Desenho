require 'spec_helper'

describe SessionsController, type: :controller do
  before do
    @user = User.create(cpf: "71787069702", email: "teste@teste.com",
      issuing_agency: "SSPDF", name: "Teste de Criacao de Usuario", phone1: "6111111111",
      rg: "1111111", zip_code: "70000000", state: "DF", number: "10", password: "senha", 
      activated_at: Date.current.last_month, activated: true, password_confirmation: "senha",
      login: "teste@teste.com")
  end

  after do
    @user = nil
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    subject { post :create, {session: {login: "teste@teste.com", password: "senha"}} }
    
    it "returns http success" do
      #expect(response).to be_success
    end

    it "should deactivate user after one month" do
      expect(subject).to redirect_to("/")
      expect(subject.request.flash[:notice]).to match("Sua conta foi desativada. Entre em contato com o administrador do sistema.")
    end
  end

end
