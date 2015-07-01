# -*- encoding : utf-8 -*-
class Proposta < ActiveRecord::Base
  belongs_to :user
  has_one :sub_prefeitura, :through => :user

  has_many :votos
  validates :descricao, length:{maximum: 255}, :presence => true
  validates :palavra_chave, length:{maximum: 32}
  validates :user, :presence => true

  belongs_to :tema_principal, :class_name => "Tema"
  belongs_to :tema_opcional, :class_name => "Tema"

  validates :tema_principal, :presence => true

  after_create :gerar_codigo

  def self.order_por_votos
    order('status desc, votos_count desc, id')
  end

  def self.order_mais_da_semana
    where('created_at >= :sete_dias_atras', :sete_dias_atras => Time.now - 7.days).order('status desc, votos_count desc, id').limit(10)
  end

  def esta_ativa
    if(self.status == 1)
      return true
    else 
      return false
    end
  end

  def desabilitar
    self.status = 0
    self.save
  end

  def get_ranking_subprefeitura
    self.sub_prefeitura.relaciona_propostas
        .where('votos_count > ?', self.votos_count)
        .order(:id)
        .count + 1
  end

  def get_emails_dos_apoiadores
    self.votos.map{|v| v.user.email}
  end

  def gerar_codigo
    self.codigo = (200000 + self.id).to_s
    self.save
  end
end
