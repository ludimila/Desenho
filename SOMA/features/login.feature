#language: pt

Funcionalidade: Login
	Para poder acessar todas as páginas do aplicativo
	Como usuario
	Quero poder realizar login 

	Cenário: login bem sucedido
	Ao carregar pagina de login, deve aparecer um formulario de login

	Dado que eu estou na pagina de login
    E possuo uma conta de estudante
	Quando eu clico no link "Entrar"
    Entao sou redirecionado para a pagina "/students/1"


	Cenário: login mal-sucedido 
	Verificar se o login foi realizado com dados incorretos
	
	Dado que eu estou na pagina de login
	Quando clico no link "Entrar"
	Entao vejo o texto "Email/Senha incorretos"
	

