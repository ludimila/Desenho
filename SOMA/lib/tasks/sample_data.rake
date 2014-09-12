namespace :db do
  desc "Fill database with sample users"
  task populate: :environment do
    admin = User.find_by(login: "admin")
    if(admin.nil?)
      admin = User.new(name: "Administrador", login: "admin", password: "admin",
                 password_confirmation: "admin", admin: true, activated: true)
      admin.save(validate: false)
    end

    2.times do |n|
      name = Faker::Name.name
      email = "aluno#{n+1}@teste.com"
      user_params = {email: email, login: email, name: name, password: "senha",
                    password_confirmation: "senha", rg: "000000#{n}", cpf: "0000000000#{n}",
                    issuing_agency: "SSPDF", zip_code: "00000000", phone1: "0000000000", phone2: nil}
      user = User.create(user_params)
      user.save(validate: false)
    end
  end
end
