require 'spec_helper'

describe User do
  before do
    @user = User.new(cpf: "717.870.697-02", email: "teste@teste.com",
      issuing_agency: "SSPDF", name: "Teste", phone1: "6111111111",
      rg: "1111111", zip_code: "70000000")
  end

  after do
    @user = nil
  end

      it "should not save if state has more than 3 characters" do
        @user.state = "ABCD"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:state]).not_to be_nil
      end
  context "when providing valid data" do
    it "should generate a User model" do
      expect(@user).to be_an_instance_of(User)
    end
  end

  context "when providing invalid data" do
    context "about cpf" do
      it "should not save if cpf is nil" do
        @user.cpf = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:cpf]).not_to be_nil
      end

      it "should not save if all digits from cpf are the same" do
        @user.cpf = "11111111111"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:cpf]).not_to be_nil
      end
      
      it "should not save if cpf is invalid" do
        @user.cpf = "1111122111"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:cpf]).not_to be_nil
      end

      it "should not save if cpf has size greater than 11" do
        @user.cpf = "111112211111"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:cpf]).not_to be_nil
      end

      it "should not save if cpf size is less than 11" do
        @user.cpf = "11111221"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:cpf]).not_to be_nil
      end
    end
    
    context "about email" do
      it "should not save if email is nil" do
        @user.email = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:email]).not_to be_nil
      end

      it "should not save if email has not a valid format" do
        @user.email = "aldkjalk"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:email]).not_to be_nil
      end
    end

    context "about name" do
      it "should not save if name is nil" do
        @user.name = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:name]).not_to be_nil
      end
      
      it "should not save if name is too small" do
        @user.name = "Small Nam"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:name]).not_to be_nil
      end
    end

    context "about RG" do
      it "should not save if rg is nil" do
        @user.rg = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:rg]).not_to be_nil
      end
      
      it "should not save if rg size is less than 3" do
        @user.rg = "12"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:rg]).not_to be_nil
      end
      
      it "should not save if rg size is greater than 11" do
        @user.rg = "123456789012"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:rg]).not_to be_nil
      end
      
      it "should not save if rg size has other chars than numbers" do
        @user.rg = "1234AB1"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:rg]).not_to be_nil
      end

      it "should not save if issuing agency is nil" do
        @user.issuing_agency = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:issuing_agency]).not_to be_nil
      end

      it "should not save if issuing agency is nil" do
        @user.issuing_agency = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:issuing_agency]).not_to be_nil
      end
      
      it "should not save if issuing agency has not only upcase letters" do
        @user.issuing_agency = "adsC328"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:issuing_agency]).not_to be_nil
      end
    end

    context "about phone number" do
      it "should not save if phone number 1 is nil" do
        @user.phone1 = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:phone1]).not_to be_nil
      end

      it "should not save if phone number 1 has not only numbers" do
        @user.phone1 = "2847c1111c"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:phone1]).not_to be_nil
      end
      
      it "should not save if phone number 1 has less than 10 characters" do
        @user.phone1 = "28471111"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:phone1]).not_to be_nil
      end
      
      it "should not save if phone number 1 has more than 11 characters" do
        @user.phone1 = "284711111111"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:phone1]).not_to be_nil
      end
      
      it "should not save if phone number 2 has not only numbers" do
        @user.phone2 = "2847c1111c"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:phone2]).not_to be_nil
      end
      
      it "should not save if phone number 2 has less than 10 characters" do
        @user.phone2 = "28471111"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:phone2]).not_to be_nil
      end
      
      it "should not save if phone number 1 has more than 11 characters" do
        @user.phone2 = "284711111111"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:phone2]).not_to be_nil
      end
    end

    context "about address" do
      it "should not save if zip code is nil" do
        @user.zip_code = nil
        expect(@user.save).to be_false
        expect(@user.errors.messages[:zip_code]).not_to be_nil
      end
      
      it "should not save if zip code has letters" do
        @user.zip_code = "123456df"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:zip_code]).not_to be_nil
      end
      
      it "should not save if zip code has less than 8 chars" do
        @user.zip_code = "1234567"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:zip_code]).not_to be_nil
      end
      
      it "should not save if zip code has more than 8 chars" do
        @user.zip_code = "12345678910"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:zip_code]).not_to be_nil
      end

      it "should not save if number is not a number" do
        @user.number = "num"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:number]).not_to be_nil
      end

      it "should not save if number has more than 6 characters" do
        @user.number = "1234567"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:number]).not_to be_nil
      end

      it "should not save if state has more than 3 characters" do
        @user.state = "ABCD"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:state]).not_to be_nil
      end

      it "should not save if state has numbers" do
        @user.state = "AB1"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:state]).not_to be_nil
      end

      it "should not save if state has less than 2 characters" do
        @user.state = "A"
        expect(@user.save).to be_false
        expect(@user.errors.messages[:state]).not_to be_nil
      end
    end
  end
end
