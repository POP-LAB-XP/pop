# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tSaude = Tema.create({
 nome: 'saúde'
})

tEducacao = Tema.create({
 nome: 'educação'
})


tTransporte = Tema.create({
 nome: 'transporte'
})

tSeguranca = Tema.create({
 nome: 'segurança'
})

tAssistenciaSocial = Tema.create({
 nome: 'assistencia social'
})

tEsporte = Tema.create({
 nome: 'esporte'
})

tMeioAmbiente = Tema.create({
 nome: 'meio ambiente'
})

tInfraEstrutura = Tema.create({
 nome: 'infra estrutura'
})

tServico = Tema.create({
 nome: 'serviço'
})

tHabitacao = Tema.create({
 nome: 'habitação'
})

tComercio = Tema.create({
 nome: 'comércio'
})

tAmbienteUrbano = Tema.create({
 nome: 'ambiente urbano'
})

tAtendimento = Tema.create({
 nome: 'atendimento'
})

tCrianca = Tema.create({
 nome: 'criança'
})


tAdolescente = Tema.create({
 nome: 'adolecente'
})

tIdoso = Tema.create({
 nome: 'idoso'
})


tIluminacao = Tema.create({
 nome: 'iluminação'
})

tLixo = Tema.create({
 nome: 'lixo'
})

tImposto = Tema.create({
 nome: 'imposto'
})

tAgua = Tema.create({
 nome: 'água'
})

tArvore = Tema.create({
 nome: 'árvores'
})

tEscola = Tema.create({
 nome: 'escola'
})

tHospital = Tema.create({
 nome: 'hospital'
})

forum = Forum.create({ nome: 'Cenário 1'})

sub_prefeitura = SubPrefeitura.create({ 
 nome: 'Colégio Equipe', 
 codigo: '12345678', 
 limite_de_usuarios: 2000, 
 forum: forum,
 cidade: 'São Paulo'
})

user = User.create({
 email: "axleirner@gmail.com",
 password: "12345678",
 password_confirmation: "12345678",
 sub_prefeitura: sub_prefeitura
})

user_pop = User.create({
 email: "pop@ime.com",
 password: "12345678",
 password_confirmation: "12345678",
 sub_prefeitura: sub_prefeitura
})

Proposta.create({
	descricao: "Primeira proposta do POP!",
	user: user,
	tema_principal: tArvore,
	status: 1
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

