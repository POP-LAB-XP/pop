class AcaoUsuario < ActiveRecord::Base
  belongs_to :user
  belongs_to :acao_tipo
  belongs_to :proposta
end
