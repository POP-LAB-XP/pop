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
end