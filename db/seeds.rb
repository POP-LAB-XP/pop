# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tSaude = Tema.create({
	nome: 'SAUDE'
	})

tEducacao = Tema.create({
	nome: 'EDUCAÇÃO'
	})


tTransporte = Tema.create({
	nome: 'TRANSPORTE'
	})

tSeguranca = Tema.create({
	nome: 'SEGURANÇA'
	})

tAssistenciaSocial = Tema.create({
	nome: 'ASSISTENCIA SOCIAL'
	})

tEsporte = Tema.create({
	nome: 'ESPORTE'
	})

tMeioAmbiente = Tema.create({
	nome: 'MEIO AMBIENTE'
	})

tInfraEstrutura = Tema.create({
	nome: 'INFRA ESTRUTURA'
	})

tServico = Tema.create({
	nome: 'SERVIÇO'
	})

tHabitacao = Tema.create({
	nome: 'HABITAÇÃO'
	})

tComercio = Tema.create({
	nome: 'COMERCIO'
	})

tAmbienteUrbano = Tema.create({
	nome: 'AMBIENTE URBANO'
	})

tAtendimento = Tema.create({
	nome: 'ATENDIMENTO'
	})

tCrianca = Tema.create({
	nome: 'CRIANÇA'
	})


tAdolescente = Tema.create({
	nome: 'ADOLESCENTE'
	})

tIdoso = Tema.create({
	nome: 'IDOSO'
	})


tIluminacao = Tema.create({
	nome: 'ILUMINAÇÃO'
	})

tLixo = Tema.create({
	nome: 'LIXO'
	})

tImposto = Tema.create({
	nome: 'IMPOSTO'
	})

tAgua = Tema.create({
	nome: 'AGUA'
	})

tArvore = Tema.create({
	nome: 'ARVORE'
	})

tEscola = Tema.create({
	nome: 'ESCOLA'
	})

tHospital = Tema.create({
	nome: 'HOSPITAL'
	})

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
	user: user,
	tema_1: tSaude,
	tema_2: tTransporte,
	palavra_chave: 'teste_palavra'
})

p2 = Proposta.create({
	descricao: "test2",
	user: user,
	tema_1: tEducacao
})

p3 = Proposta.create({
	descricao: "test3",
	user: user,
	tema_2: tArvore,
})


(1..100).each do |p|
	Proposta.create({
		descricao: "test_" << p,
		user: user,
		tema_2: tArvore,
	})
end

/Voto.create({
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
})/
acaoApoio = AcaoTipo.create({
	nome: "Apoio"
})
acaoVeto = AcaoTipo.create({
	nome: "Veto"
})
acaoCriacao = AcaoTipo.create({
	nome: "Criacao"
})
/Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
Acao.create({
	user:user,
	acao_tipo:acaoCriacao,
	proposta:p1
})
/