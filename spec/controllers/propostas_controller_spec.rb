# -*- encoding : utf-8 -*-
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
	
	describe 'apoiar' do
        let!(:user){
		 FactoryGirl.create(:user) 
		}

        let!(:proposta_params){
           {"id" => 1}

        }

        let!(:proposta){
            FactoryGirl.build(:proposta, :status => 0, :id => 1)
        }
       
        let!(:acao){
            FactoryGirl.build(:acao_vetar)
        }
        let!(:voto){
            FactoryGirl.build(:voto)
        }
        before(:each) do
	      Acao.expects(:create).returns(acao)
	      Voto.expects(:create).returns(voto)
        end

        context 'quando usuário estiver logado' do
            before(:each) do
		      @request.env["devise.mapping"] = Devise.mappings[:user]
		      sign_in user
			  proposta.stubs(:find_by_id).with(proposta.id).returns(proposta)
			  post '/propostas/4/new_voto', {"id" => 4}
		    end

            it 'não pode apoiar uma proposta vetada' do
			  user.stubs(:limite_acoes_atingido).returns(false)
			  user.stubs(:usuario_realizou_acao_hoje).with(proposta).returns(false)
    		  expect(flash[:notice]).to be_present
            end
        end 
    end
end
