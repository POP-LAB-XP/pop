require 'rails_helper'

describe PropostasController, type: :controller do
	describe 'listar' do
		subject { get :index }

		context 'quando estiver logado' do
			before(:each) do
		      @request.env["devise.mapping"] = Devise.mappings[:user]
		      user = FactoryGirl.create(:user)
		      sign_in user
		    end
			it 'o usuário pode acessar a lista de propostas' do
				response.should be_success
			end
		end
	end
	
	/
	describe 'criar' do
		subject { get :new }
		context 'quando criar proposta' do
			before(:each) do
		      @request.env["devise.mapping"] = Devise.mappings[:user]
		      user = FactoryGirl.create(:user)
		      sign_in user
		    end
			it 'é esperado que a proposta tenha um voto quando criada' do
				post :create, {'proposta'=>{"descricao"=>"teste controller proposta", "tema_1_id"=>"1", "tema_2_id"=>"2", "palavra_chave"=>"key-word"}}

				expect{Proposta.count}.to change{Proposta.count}.by(1)
				expect{Voto.count}.to change{Voto.count}.by(1)
			end
		end
	end
	/
end