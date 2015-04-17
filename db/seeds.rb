# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

forum = Forum.create({ nome: 'Teste'})

sub_prefeitura = SubPrefeitura.create({ 
	nome: 'SubPrefeitura de Teste', 
	codigo: '12345678', 
	limite_de_usuarios: 100, 
	forum: forum
})

user = User.create({
	email: "pop@ime.com",
	password: "12345678",
	password_confirmation: "12345678",
	sub_prefeitura: sub_prefeitura
})

p1 = Proposta.create({
	descricao: "test1",
	user: user
})

p2 = Proposta.create({
	descricao: "test2",
	user: user
})

p3 = Proposta.create({
	descricao: "test3",
	user: user
})

Voto.create({
	user: user,
	proposta: p1
})

Voto.create({
	user: user,
	proposta: p1
})

Voto.create({
	user: user,
	proposta: p1
})

Voto.create({
	user: user,
	proposta: p1
})

Voto.create({
	user: user,
	proposta: p1
})

Voto.create({
	user: user,
	proposta: p1
})

Voto.create({
	user: user,
	proposta: p2
})

Voto.create({
	user: user,
	proposta: p2
})

Voto.create({
	user: user,
	proposta: p3
})

Voto.create({
	user: user,
	proposta: p3
})

Voto.create({
	user: user,
	proposta: p3
})
acaoApoio = AcaoTipo.create({
	nome: "Apoio"
})
acaoVeto = AcaoTipo.create({
	nome: "Veto"
})
acaoCriacao = AcaoTipo.create({
	nome: "Criacao"
})
acaousuario = Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
