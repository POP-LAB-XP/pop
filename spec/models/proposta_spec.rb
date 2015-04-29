require 'rails_helper'

RSpec.describe Proposta, type: :model do
  let(:proposta) { build(:proposta) }

  it "deve ter uma descricao" do
  	proposta.descricao.should == "Teste legal! ;)"
  end

  it "descricao nao deve ser nula" do
    proposta = build(:proposta, :descricao => "").should_not be_valid
  end

  it "proposta deve ter usuario" do
    proposta = build(:proposta, :user_id => nil).should_not be_valid
  end

  it "proposta deve ter tema1" do
    proposta = build(:proposta, :tema_1_id => nil).should_not be_valid
  end

  it "proposta pode nao ter tema2" do
    proposta = build(:proposta, :tema_2_id => nil).should be_valid
  end  
=begin
  it "deve ter email" do
        user = build(:user, :email => "").should_not be_valid
  end

  it "deve ter senha" do
        user = build(:user, :password => "").should_not be_valid
  end

  it "deve ter senha" do
        user = build(:user, :password => "1234567").should_not be_valid
        user = build(:user, :password => "12345678").should be_valid
  end

  it "deve ter código" do
        user = build(:user, :sub_prefeitura => nil).should_not be_valid
  end
=end
end