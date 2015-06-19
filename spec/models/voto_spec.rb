require 'rails_helper'

RSpec.describe Voto, type: :model do
	let(:voto) { 
		build(:voto) 
	}

	let(:user) { 
		build(:user) 
	}





	describe 'proposta_valida' do
	 
	    it "Nao posso votar em proposta invalida!" do
	     	voto = build(:voto, :proposta => nil).should_not be_valid
		end 

		it "Nao posso votar em proposta vetada!" do
			proposta =  build(:proposta, :status => 0)
	     	voto = build(:voto, :proposta => proposta).should_not be_valid
		end 


	end

end
