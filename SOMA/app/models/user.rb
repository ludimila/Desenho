class User < ActiveRecord::Base
  attr_accessible :cpf, :email, :issuing_agency, :name, :phone1, :phone2, :rg, :zip_code
  
  validates :cpf, uniqueness: true, length: {is: 11}, presence: true
  validate :check_cpf
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, format: {with: EMAIL_REGEX }, uniqueness: true, presence: true

  ISSUE_AGENCY_REGEX = /\A[A-Z]+\z/
  validates :issuing_agency, length: {in: 5..20}, presence: true, format: {with: ISSUE_AGENCY_REGEX, message: "Use somente letras MAIUSCULAS."} 
  
  validates :name, presence: true, length: {minimum: 10}
  
  #validates :password, length: {minimum: 5}
  
  validates :phone1, length: {in: 10..11}, presence: true, numericality: {only_integer: true}
  validates :phone2, length: {in: 10..11}, numericality: {only_integer: true}
 
  validates :rg, length: {in: 3..11}, presence: true, uniqueness: true, numericality: {only_integer: true}
  
  validates :zip_code, presence: true, length: {is: 8}, numericality: {only_integer: true}

  
  def check_cpf
    if(!validate_cpf(self.cpf))
      errors.add(:cpf, "invalido")
    end
  end

  private
    def validate_cpf(cpf = nil)
      valid = false
      if(!cpf.blank?)
        params = {}
        valid = compare_digits(cpf)
        if(valid)
          test_cpf = cpf.from(0).to(8)
          values = [10, 9, 8, 7, 6, 5, 4, 3, 2]
          params[:test_cpf] = test_cpf
          params[:values] = values
          params = cpf_algorithm(params)
          if(params[:test_cpf].last != cpf[9])
            valid = false
          else
            params = cpf_algorithm(params)
            if(params[:test_cpf] == cpf)
              valid = true
            end
          end
        end
      end
      valid
    end
  
    def compare_digits(cpf)
      may_be_valid = false
      range = 0..cpf.size-2
      for i in range do
        may_be_valid = !(cpf[i] == cpf[i+1])
        if(may_be_valid)
          return may_be_valid 
        end
      end
      may_be_valid
    end

    def cpf_algorithm(params = {})
      sum = 0
      params[:values].each_with_index do | value, index |
        sum += params[:test_cpf][index].to_i * value
      end
      mod = sum%11
      if(mod < 2)
        params[:test_cpf] << "0"
      else
        params[:test_cpf] << (11-mod).to_s
      end
      params[:values].unshift(11)
      params
    end
end
