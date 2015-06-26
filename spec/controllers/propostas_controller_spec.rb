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

  describe 'lista meus apoios' do
    let!(:current_user) {FactoryGirl.create(:user)}

    before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in current_user
        #Proposta.stubs(:create).with(proposta_params).returns(proposta)
        get :lista_propostas_do_usuario 
    end
    it 'o usuario pode acessar a lista de propostas que ele apoiou' do
        propostas_do_usuario = lista_propostas_do_usuario
        votos_user = Voto.find_by_id(user_id: current_user.id)
        votos_user.proposta.each do |prop_do_voto|
          propostas_do_usuario.include?(prop_do_voto)
        end  
      
      end
  end
  
  describe 'criar' do
    let!(:current_user){
      FactoryGirl.create(:user) 
    }
    let!(:proposta){
      FactoryGirl.build(:proposta)
    }
    let!(:proposta_params){
      {"descricao"=>"teste controller proposta","tema_principal_id"=>"1", "tema_opcional_id"=>"2", "palavra_chave"=>"key-word"}
    }
    let!(:acao){
      FactoryGirl.build(:acao)
    }
    let!(:voto){
      FactoryGirl.build(:voto)
    }
  
    before(:each) do
      Proposta.stubs(:create).with(proposta_params).returns(proposta)
      Acao.stubs(:create).returns(acao)
      Voto.stubs(:create).returns(voto)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in current_user
    end

    context 'quando criar proposta' do
      before(:each) do
        post :create, proposta: proposta_params
      end
      it 'é esperado que o usuário seja redirecionado para a página de listagem de proposta' do
        is_expected.to redirect_to propostas_path
      end
    end

    context "quando o usuário atingir o limite de ações diário" do
      before(:each) do
        controller.stubs(:current_user).returns(current_user)
        current_user.stubs(:limite_acoes_atingido).returns(true)
        post :create, proposta: proposta_params
      end
      it 'deve aparecer uma mensagem de erro' do
        expect(flash[:warning]).to be_present
        flash[:warning].should eq("Proposta não foi criada. Limite de ações atingido!")
        is_expected.to redirect_to new_proposta_path
      end
    end

    context "quando a proposto tiver parâmetros errados" do
      let!(:proposta_params_invalid){
        {"descricao"=>nil,"tema_principal_id"=>"1", "tema_opcional_id"=>"2", "palavra_chave"=>"key-word"}
      }
      let!(:proposta_invalid){
        build(:proposta, proposta_params_invalid)
      }
      before(:each) do
        controller.stubs(:current_user).returns(current_user)
        current_user.stubs(:limite_acoes_atingido).returns(false)
        Proposta.stubs(:create).with(proposta_params_invalid).returns(proposta_invalid)
        post :create, proposta: proposta_params_invalid
      end
      it 'deve aparecer uma mensagem de erro' do
        expect(flash[:warning]).to be_present
        flash[:warning].should eq("Não foi possível criar proposta!")
        is_expected.to redirect_to new_proposta_path
      end
    end
  end

  describe 'nova' do
    let!(:proposta){ FactoryGirl.build(:proposta) }
    let!(:current_user){
      FactoryGirl.create(:user) 
    }
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in current_user
    end
    context "quando o usuário estiver logado" do
      it 'o usuário pode acessar a página de criação de proposta' do
        get :new
        response.should be_success
      end
    end
    context "quando o usuário atingir o limite de ações diário" do
      it 'deve aparecer uma mensagem de erro' do
        controller.stubs(:current_user).returns(current_user)
        current_user.stubs(:limite_acoes_atingido).returns(true)
        get :new
        expect(flash[:warning]).to be_present
        flash[:warning].should eq("Limite de ações atingido!")
      end
    end
  end
end

