require 'rails_helper'

describe PropostasController, type: :controller do
	describe 'listar' do

		context 'quando estiver logado' do
			before(:each) do
		      @request.env["devise.mapping"] = Devise.mappings[:user]
		      sign_in FactoryGirl.create(:user)
              get :index 
		    end
			it 'o usuário pode acessar a lista de propostas' do
				response.should be_success
			end
		end
	end
	
	
	describe 'criar' do
		let!(:user){
		 FactoryGirl.create(:user) 
		}
        let!(:proposta){
            FactoryGirl.build(:proposta)
        }
       
        let!(:proposta_params){
           {"descricao"=>"teste controller proposta","tema_1_id"=>"1", "tema_2_id"=>"2", "palavra_chave"=>"key-word"}

        }
        let!(:acao){
            FactoryGirl.build(:acao)
        }
        let!(:voto){
            FactoryGirl.build(:voto)
        }
        before(:each) do
	      Proposta.expects(:create).with(proposta_params).returns(proposta)
	      Acao.expects(:create).returns(acao)
	      Voto.expects(:create).returns(voto)
        end
		context 'quando criar proposta' do
			before(:each) do
		      @request.env["devise.mapping"] = Devise.mappings[:user]
		      sign_in user
			  post :create, proposta: proposta_params
		    end
			it 'é esperado que o usuário seja redirecionado para a página de listagem de proposta' do
			    is_expected.to redirect_to propostas_path
			end
		end
	end
end
