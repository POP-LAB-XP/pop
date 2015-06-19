require 'rails_helper'

RSpec.describe Veto, type: :model do
  let(:veto) { build(:veto) }

  it "deve ter uma descricao" do
  	veto.descricao.should == "veto 1"
  end

  it "a descricao nao deve ser nula" do
    veto = build(:veto, :descricao => nil).should_not be_valid
  end

  it "deve ter usuario" do
  	user = build(:user)
    veto.user.id.should == user.id
  end

  it "o usuario nao pode ser nulo" do
    veto = build(:veto, :user_id => nil).should_not be_valid
  end

  it "proposta do veto deve ser preenchida" do
  	proposta = build(:proposta)
    veto.proposta.id.should == proposta.id
  end

  it "a proposta nao pode ser nula" do
    veto = build(:veto, :proposta_id => nil).should_not be_valid
  end

  it "o tamanho da descricao deve ter menos do que 140 caracteres" do
  	#geramos uma string com mais do que 140 caracteres
    veto = build(:veto, :descricao => "1" * 141 ).should_not be_valid
  end

  it "o tamanho da descricao deve ter até 140 caracteres" do
    veto = build(:veto, :descricao => "1" * 140).should be_valid
  end
end
