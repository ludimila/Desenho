namespace :db do
  desc "Fill database with sample users"
  task populate: :environment do
    admin = Doctor.find_by(login: "admin")
    if(admin.nil?)
      admin = Doctor.new(name: "Administrador", login: "admin", password: "admin",
                 password_confirmation: "admin", admin: true, activated: true, activated_at: Date.current.last_year)
      admin.save(validate: false)
    end

    2.times do |n|
      name = Faker::Name.name
      email = "aluno#{n+1}@teste.com"
      user_params = {email: email, login: email, name: name, password: "senha",
                    password_confirmation: "senha", rg: "000000#{n}", cpf: "0000000000#{n}",
                    issuing_agency: "SSPDF", zip_code: "00000000", phone1: "0000000000", phone2: nil}
      user = Student.create(user_params)
      user.save(validate: false)
    end
  end
end
