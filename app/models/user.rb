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

  def self.count_user_actions
    Acao.where(created_at: (Time.now.midnight)..(Time.now.midnight + 1.day))
      .where("user_id = user.id").count
  end
end
