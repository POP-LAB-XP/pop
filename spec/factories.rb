# -*- encoding : utf-8 -*-
FactoryGirl.define do  
  factory :forum, aliases: [:forum_teste] do
    nome "teste forum"
  end

  factory :sub_prefeitura, aliases: [:subprefeitura_teste] do
    nome "teste subprefeitura"
    limite_de_usuarios 1
    association :forum, factory: :forum, strategy: :build
  end

  factory :user do
    email "pop@pop.com"
    password "12345678"
    password_confirmation "12345678"
    association :sub_prefeitura, factory: :sub_prefeitura, strategy: :build
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

  factory :temaPrincipal, class: Tema do
    nome "temaPrincipal"
  end

  factory :temaOpcional, class: Tema do
    nome "temaOpcional"
  end

  factory :proposta do
    id 123
    descricao "proposta 1"
    palavra_chave "key word"
    status 1
    codigo "200123"
    association :user, factory: :user, strategy: :build
    association :tema_principal, factory: :temaPrincipal, strategy: :build
    association :tema_opcional, factory: :temaOpcional, strategy: :build
  end

  factory :acao do
    association :user, factory: :user, strategy: :build
    association :proposta, factory: :proposta, strategy: :build
    association :acao_tipo, factory: :acao_tipo_criar, strategy: :build
  end
  factory :acao_vetar, class: Acao do
    association :user, factory: :user, strategy: :build
    association :proposta, factory: :proposta, strategy: :build
    association :acao_tipo, factory: :acao_tipo_vetar, strategy: :build
  end


  factory :voto do
    association :user, factory: :user, strategy: :build
    association :proposta, factory: :proposta, strategy: :build
  end

  factory :veto do
    descricao "veto 1"
    association :user, factory: :user, strategy: :build
    association :proposta, factory: :proposta, strategy: :build
  end

end
