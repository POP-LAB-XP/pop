require 'rails_helper'

RSpec.describe Acao, type: :model do
  let(:user) { 
    build(:user) 
  }
  let(:acao) { 
    build(:acao, :user => user) 
  }

  it "verifica limite de acoes atingido" do
    user.expects(:limite_acoes_atingido).returns (true)
    acao.verifica_limite_acoes
    expect(acao.errors.full_messages).to eq(["Acao Limite de ações atingido!"])
  end
end
