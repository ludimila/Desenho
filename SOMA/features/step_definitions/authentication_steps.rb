# encoding: utf-8

#login bem sucedido

Dado(/^que eu estou na pagina de login$/) do
	visit root_path
end

E(/^possuo uma conta de estudante$/) do
	@user = User.new(name: "Ludi", email: "ludi@gmail.com", phone1: "99297567",phone2: "99297007", 
		     rg: "111111188", zip_code: "47888999", number: "5", state: "GO")
end

Quando(/^eu clico no link "(.*?)"$/) do |arg1|
	click_button (arg1)
end

Entao(/^sou redirecionado para a pagina "(.*?)"$/) do |arg1|
	visit arg1
end

#login mal sucedido

Quando(/^clico no link "(.*?)"$/) do |arg1|
	click_button (arg1)
end


Entao(/^vejo o texto "(.*?)"$/) do |arg1|
  page.has_text?("Email/Senha incorretos")
end

