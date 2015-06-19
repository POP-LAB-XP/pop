# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates_confirmation_of :password

         belongs_to :sub_prefeitura
         has_many :propostas
         has_many :votos
         validates :sub_prefeitura, :presence => true

  def count_user_actions
    acoes_usuario_no_dia.count
  end

  def limite_acoes_atingido
    count_user_actions >= 8
  end

  def usuario_realizou_acao_hoje( proposta)
    acoes_usuario_no_dia.where( "proposta_id = #{proposta.id}").any?
  end

  private 

  def acoes_usuario_no_dia 
    Acao.where(created_at: (Time.now.midnight)..(Time.now.midnight + 1.day))
      .where("user_id = #{self.id}")
  end
end
