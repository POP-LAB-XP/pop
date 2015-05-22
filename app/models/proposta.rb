# -*- encoding : utf-8 -*-
class Proposta < ActiveRecord::Base
  belongs_to :user
  has_many :votos
  validates :descricao, length:{maximum: 255}, :presence => true
  validates :palavra_chave, length:{maximum: 32}
  validates :user, :presence => true

  belongs_to :tema_1, :class_name => "Tema"
  belongs_to :tema_2, :class_name => "Tema"

  validates :tema_1, :presence => true

  def self.order_por_votos
    order('votos_count desc, id')
  end

  def esta_ativa
    if(self.status == 1)
      return true
    else 
      return false
    end
  end

end
