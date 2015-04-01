class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates_confirmation_of :password

         belongs_to :sub_prefeitura
         validates :sub_prefeitura, :presence => true

        @codigo
		def codigo
		    @codigo
		 end
end
