# TalkSched
TalkSched: Automated Conference Scheduling Solution.

## BACKEND
### Linguagem:
    - Ruby
    - Rails
### Gems:
    - gem "rails", "~> 7.0.8"
    - gem "pg", "~> 1.1"
    - gem "puma", "~> 5.0"
    - gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
    - gem "bootsnap", require: false
    - gem 'rack-cors'
    - gem "pry-byebug"
    - gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
    - gem 'factory_bot_rails', '~> 6.2', '>= 6.2.0'
    - gem 'faker', '~> 3.2', '>= 3.2.1'
    - gem 'shoulda-matchers', '~> 5.0', '>= 5.0.1'
## FRONT-END:
    Vue.js

## Rodando o Projeto:

1. clone o repositório https://github.com/henriquehsilva/TalkSched.git

2. confirme a versão `3.0.2` do ruby ​​e a versão `7.0.8` do Rails instalado na máquina.
3. Entre na pasta `ts-api` e rode o comando a seguir para instalar as dependências:

```sh
bundle install
```
4. Após instalar as dependências crie as migrations com o comando:
```sh
rails db:create
rails db:migrate
```

5. Rode os testes no teminal com o comando: 
```
rspec
``` 

6. Por fim rode o comando a seguir para iniciar o servidor puma:

```sh
rails s
```

7. Entre na pasta `ts-ui` e abra o arquivo `index.html` para ter acesso a página principal.
