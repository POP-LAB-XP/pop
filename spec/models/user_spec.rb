# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:proposta) {build(:proposta)}

  describe 'create' do
    it "deve ter um email" do
      user.email.should == "pop@pop.com"
    end

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

  end

  describe 'quando o usuario tiver acoes hoje' do
    let(:acoes) {[build(:acao, :created_at => Time.now, :proposta => proposta), 
      build(:acao, :created_at => Time.now, :proposta => proposta), 
    build(:acao, :created_at => Time.now, :proposta => proposta)]}
    let(:user_nao_limitado) {create(:user, :acaos => acoes, :id => 100)}
    it  'eh esperado que ele tenha realizado acoes' do
      user_nao_limitado.usuario_realizou_acao_hoje(proposta).should == true
    end

    it 'eh esperado que a quantidade de acoes esteja correta' do
      user_nao_limitado.count_user_actions.should == acoes.length
    end
  end

end
