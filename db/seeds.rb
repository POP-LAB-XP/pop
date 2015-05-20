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
	nome: 'Agua'
	})

tArvore = Tema.create({
	nome: 'Arvore'
	})

tEscola = Tema.create({
	nome: 'escola'
	})

tHospital = Tema.create({
	nome: 'hospital'
	})

forum = Forum.create({ nome: 'Teste'})

sub_prefeitura = SubPrefeitura.create({ 
	nome: 'SubPrefeitura de Teste', 
	codigo: '12345678', 
	limite_de_usuarios: 100, 
	forum: forum,
	cidade: 'São Paulo'
})

user = User.create({
	email: "pop@ime.com",
	password: "12345678",
	password_confirmation: "12345678",
	sub_prefeitura: sub_prefeitura
})

(1..100).each do |i|
	Proposta.create({
	descricao: "Test " << i.to_s,
	user: user,
	tema_1: tArvore
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

Veto.create({
	user: user,
	proposta: Proposta.first,
	descricao: "Descricao de teste blablabla"
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
