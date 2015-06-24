class Veto < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposta

  validates :user, :presence => true
  validates :proposta, :presence => true, :uniqueness => true
  validates :descricao, length:{maximum: 140}, :presence => true

  delegate :descricao, :to => :proposta, :prefix => true
  after_create :send_mail

  def veta_proposta
    self.proposta.desabilitar
    Acao.insere_acao(AcaoTipo.getVetar, self.proposta, self.user)	
  end

  private
  
  def send_mail
   mailer = PopMailer.avisar_veto(self.proposta, self)
   mailer.deliver
 end

end
