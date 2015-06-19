class Veto < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposta

  validates :user, :presence => true
  validates :proposta, :presence => true, :uniqueness => true
  validates :descricao, length:{maximum: 140}, :presence => true

	def veta_proposta
		self.proposta.desabilitar
		Acao.insere_acao(AcaoTipo.getVetar, self.proposta, current_user)	
		mailer = PopMailer.avisar_veto(self.proposta, self)
		mailer.deliver
	end
		

end
