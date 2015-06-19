# -*- encoding : utf-8 -*-
module PropostasHelper

	def define_classe_estilo_glyph(proposta)
		if(!proposta.esta_ativa)
			["glyphicon glyphicon-remove-sign", "font-size:large; color:black"]
		elsif (current_user.usuario_realizou_acao_hoje( proposta)&& (proposta.esta_ativa))
			["glyphicon glyphicon-ok-sign", "font-size:large; color:green"]
		else
			["glyphicon glyphicon-record", "font-size:large; color:grey"]
		end
	end

end
