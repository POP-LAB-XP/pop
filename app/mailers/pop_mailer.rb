class PopMailer < ActionMailer::Base
  default from: "pop.lab.xp@gmail.com"
  
  	def termos_email(user)
    	@user = user
    	mail(to: user.email, subject: 'Seja bem vindo ao POP!!')
  	end

	def avisar_veto(proposta, veto)
		@veto = veto
		@proposta = proposta
		destinatarios = proposta.get_emails_dos_apoiadores
		mail(bcc:destinatarios.join("; "), subject: '[POP] A proposta foi vetada!!' )
		#mail(to: @veto.user.email, subject: '[POP] Voc^e vetou a proposta com sucesso' )
	end
end
