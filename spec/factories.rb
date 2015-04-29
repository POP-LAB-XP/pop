FactoryGirl.define do
    
  factory :forum, aliases: [:forum_teste] do
    nome "teste forum"
  end

  factory :sub_prefeitura, aliases: [:subprefeitura_teste] do
    nome "teste subprefeitura"
    association :forum, factory: :forum
  end

  factory :user do
    email "pop@pop.com"
    password "12345678"
    password_confirmation "12345678"
    association :sub_prefeitura, factory: :sub_prefeitura
  end

  factory :acao_tipo_apoiar, class: AcaoTipo do
    nome "apoiar"
  end

  factory :acao_tipo_vetar , class: AcaoTipo do
    nome "vetar"
  end

  factory :acao_tipo_criar , class: AcaoTipo do
    nome "criar"
  end

  factory :tema1, class: Tema do
    nome "tema1"
  end

  factory :proposta do
    descricao "proposta 1"
    palavra_chave "key word"
    association :user, factory: :user
    association :tema_1, factory: :tema1
    association :tema_2, factory: :tema1
  end

  factory :acao do
    association :user, factory: :user
    association :proposta, factory: :proposta
    association :acao_tipo, factory: :acao_tipo
  end

end
