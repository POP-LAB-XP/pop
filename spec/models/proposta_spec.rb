require 'rails_helper'

RSpec.describe Proposta, type: :model do
  let(:proposta) { build(:proposta) }

  it "deve ter uma descricao" do
  	proposta.descricao.should == "proposta 1"
  end

  it "deve ter um tema1" do
    proposta.tema_1.should_not equal(nil)
  end

  it "descricao nao deve ser nula" do
    proposta = build(:proposta, :descricao => "").should_not be_valid
  end

  it "proposta deve ter usuario" do
    proposta = build(:proposta, :user_id => nil).should_not be_valid
  end

  it "proposta deve ter tema1" do
    proposta = build(:proposta, :tema_1 => nil).should_not be_valid
  end

  it "proposta pode nao ter tema2" do
    proposta = build(:proposta, :tema_2 => nil).should be_valid
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

end