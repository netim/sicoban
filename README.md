# Sistema de Controle Bancário (Sicoban)

## Requisitos

A aplicação foi desenvolvida em Ruby 2.5.1 e Rails 5.2.1. Em distribuições Linux, Ruby pode ser gerenciado via [Ruby Version Manager (RVM)](http://rvm.io/).

## Instalação

Após clonar ou baixar esse repositório, instale as *gems* necessárias:
```
bundle
```
Migre o banco de dados:
```
rails db:migrate
```
Opcional: adicione dados ao banco:
```
rails db:seed
```
Rode o servidor do Rails:
```
rails s
```
A aplicação pode ser acessada via [0.0.0.0:3000](http://0.0.0.0:3000/). O painel de administração do ActiveAdmin pode ser acessado via [0.0.0.0:3000/admin](http://0.0.0.0:3000/admin/) com email *admin@example.com* e senha *password*.

## Utilização

O Sicoban permite gerenciar transações bancárias. É possível gereciar usuários, contas e agências bancárias e fazer depósitos, saques, transferências e estornos.

## Testes

Para executar os testes com *RSpec* utilize o comando:
```
bundle exec rspec
```


## Bibliotecas

* Puma como servidor;
* Bootstrap para estilos;
* Kaminari para paginação;
* ActiveAdmin para administração de usuários;
* Devise para autenticação e autorização;
* Simple_form personalização de formulário;
* Haml para simplificação do código HTML nas páginas criadas manualmente;
* Pg para banco Postgresql (banco *sicoban*, usuário *postgres* e senha *123456*). Tutoriais podem ser encontrados [aqui](https://www.digitalocean.com/community/tutorials/como-instalar-e-utilizar-o-postgresql-no-ubuntu-16-04-pt) e [aqui](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04).
* RSpec para testes.

## Agradecimentos

* Livro Ruby on Rails Tutorial (Rails 5) do Michael Hartl;
* Aos usuários do StackOverflow;
* Documentação da *gems*;
* W3Schools.
