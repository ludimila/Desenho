
#language: pt

Funcionalidade: Ir para a página de cadastro
	Para poder ter acesso ao material e as aulas
	Como aluno
	Quero acessar a página para realizar meu cadastro

  	Cenário: Carregar página de cadastrar
    Ao carregar página de cadastro, é mostrado um formulário de cadastro para o aluno

    Dado que eu estou na página de login
    Quando eu clico no link "Cadastre-se"
    Entao sou redirecionado para a página "/students/new"


    Cenário: Cadastrar novo aluno
    Ao preencher informações do novo usuário e salvá-las, novo usuário é cadastrado.

    Dado que eu estou na página de login
    Quando eu clico no botão "Cadastre -se"
    E preencho o campo "Nome Completo" com "Ludimila"
    E preencho o campo "E-mail" com "ludimila@hotmail.com"
    E preencho o campo "CPF" com "16125861473"
    E preencho o campo "Orgao Emissor" com "SSPAC"
	E preencho o campo "Telefone" com "6177770000"
	E preencho o campo "Telefone Alternativo" com "7799998877"
	E preencho o campo "CEP" com "45768000"
	E preencho o campo "Numero" com "0"
	E preencho o campo "Complemento" com "Brasil, meu Brasil brasileiro"
    E clico no botão "Finalizar"
    Entao sou redirecionado para a pagina "/students/"
    


