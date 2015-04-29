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

  factory :tema , aliases: [:tema1, :tema2] do
    nome "tema teste 1"
  end

  factory :proposta do
    descricao "Teste legal! ;)"
    palavra_chave "word key"
    association :tema_1_id, factory: :tema1
    association :tema_2_id, factory: :tema2
    association :user_id, factory: :user
  end

end
