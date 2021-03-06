require 'rails_helper'

RSpec.describe Proposta, type: :model do
  let(:proposta) { build(:proposta) }

  it "deve ter uma descricao" do
    proposta.descricao.should == "proposta 1"
  end

  it "deve ter um tema1" do
    proposta.tema_principal.should_not equal(nil)
  end

  it "descricao nao deve ser nula" do
    proposta = build(:proposta, :descricao => "").should_not be_valid
  end

  it "proposta deve ter usuario" do
    proposta = build(:proposta, :user => nil).should_not be_valid
  end

  it "proposta deve ter tema1" do
    proposta = build(:proposta, :tema_principal => nil).should_not be_valid
  end

  it "proposta pode nao ter tema2" do
    proposta = build(:proposta, :tema_opcional => nil).should be_valid
  end

  it "tamanho alem do permitido da palavra-chave" do
    proposta = build(:proposta, :palavra_chave => "123456789012345678901234567890123").should_not be_valid
  end

  it "tamanho permitido da palavra-chave" do
    proposta = build(:proposta, :palavra_chave => "12345678901234567890123456789012").should be_valid
  end

  it "deve ter status Ativo (1) " do 
    proposta.status.should == 1
  end

  it "esta_ativa deve retornar true" do 
    proposta.esta_ativa.should == true
  end

  it "deve ter um código" do
    proposta.codigo.should be_present
  end

  it "código deve se relacionar com id" do
    proposta.gerar_codigo
    proposta.codigo.should eq( (200000 + proposta.id).to_s)
  end

  it "Deve ter um ranking de acordo com a sua subprefeitura" do
    proposta.get_ranking_subprefeitura.should be_present
  end

  it "Deve retornar uma lista de propostas do ranking da subprefeitura" do
    Proposta.order_mais_da_semana.should be_present
  end  

  context "sempre" do
    let(:emails) { ["pop@pop.com", "pop2@pop.com"] }
    let(:user) { build(:user, :email => emails[0]) }
    let(:user2) { build(:user, :email => emails[1]) }
    let(:voto) { build(:voto, :user => user)}
    let(:voto2) { build(:voto, :user => user2)}
    it "deve ter email correto dos apoiadores" do
      emails == proposta.get_emails_dos_apoiadores
    end
  end
end
