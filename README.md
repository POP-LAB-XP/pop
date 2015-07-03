# POP

[![Build Status](https://travis-ci.org/POP-LAB-XP/pop.svg?branch=testday-subprefeitura-registration)](https://travis-ci.org/POP-LAB-XP/pop)

[![Code Climate](https://codeclimate.com/github/POP-LAB-XP/pop/badges/gpa.svg)](https://codeclimate.com/github/POP-LAB-XP/pop)

Painel de Opinião Popular

POP é um projeto que visa prover um meio de identificar e compartilhar as demandas de comunidades. É possível criar, apoiar e vetar propostas em um contexto anônimo e participativo.

## Desenvolvimento

O projeto foi desenvolvido em Ruby on Rails, integrado com POSTGRESql, durante a disciplina de Laboratório de Programação Extrema (1˚ semestre de 2015) do IME-USP.

## Ambiente de Produção

http://pop-lab-xp.herokuapp.com/

## Para contribuir

0. Instale RVM 
1. Fork o projeto
2. Rode `bundle install`
3. Crie sua branch (`git checkout -b minha-nova-funcionalidade`)
4. Faça suas modificações
5. Commit suas mudanças (`git commit -am 'Adiciona uma funcionalidade'`)
6. Push para a branch (`git push origin minha-nova-funcionalidade`)
7. Crie um novo pull request

execute:

    $ bundle install

## Uso

Acesse http://pop-lab-xp.herokuapp.com/ e logue com seu usário. Você pode criar um novo usuário e, ao fim do cadastro, você receberá um email de confirmação. Você pode criar novas propostas e vetar ou apoiar as já existentes. Você também pode consultar listas de mais novas da semana, mais votadas do seu grupo e mais votadas no contexto geral.

## Testes

Para rodar os testes, execute:

	$ bundle install
	$ rspec

## Configurações do banco de dados

As configurações dos bancos de teste, desenvolvimento e produção estão disponíveis em config/database.yml