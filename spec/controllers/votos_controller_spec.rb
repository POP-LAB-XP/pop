require 'rails_helper'

RSpec.describe VotosController, type: :controller do

  describe 'apoiar' do
    let!(:current_user){
      FactoryGirl.create(:user) 
    }

    let!(:proposta_normal){
      build(:proposta, :status => 1, :id => 1)
    }

    let!(:proposta_vetada){
      build(:proposta, :status => 0, :id => 1)
    }
        let!(:acao){
      build(:acao_vetar)
    }
    let!(:voto){
      build(:voto)
    }
    let!(:back){
      "/propostas"
    }

    before(:each) do
      #para permitir o redirect_to back
      request.env["HTTP_REFERER"] = back
    end

    context 'quando usuário estiver logado' do
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in current_user

        Acao.stubs(:insere_acao).returns(acao)
        Voto.stubs(:insere_voto).returns(voto)
      end

      it 'deve poder votar numa proposta válida' do
        Proposta.expects(:find_by_id).returns(proposta_normal)
        current_user.stubs(:limite_acoes_atingido).returns(false)
        current_user.stubs(:usuario_realizou_acao_hoje).returns(false)

        post :create, :id => proposta_normal.id

        expect(flash[:notice]).to be_present
        flash[:notice].should eq("Voto efetuado com sucesso!")

      it 'não pode votar se seu limite de ações for atingido' do
        Proposta.expects(:find_by_id).returns(proposta_normal)

      it 'não pode votar se seu limite de ações for atingido' do
        Proposta.expects(:find_by_id).returns(proposta_normal)

        controller.stubs(:current_user).returns(current_user)
        current_user.stubs(:limite_acoes_atingido).returns(true)
        current_user.stubs(:usuario_realizou_acao_hoje).returns(false)

        post :create, :id => proposta_normal.id

        expect(flash[:warning]).to be_present
        flash[:warning].should eq("Limite de ações atingido!")

        response.should redirect_to back
      end

      it 'não pode votar duas vezes na mesma proposta' do
        Proposta.expects(:find_by_id).returns(proposta_normal)
        controller.stubs(:current_user).returns(current_user)
        current_user.stubs(:limite_acoes_atingido).returns(false)
        current_user.stubs(:usuario_realizou_acao_hoje)
        .with(proposta_normal)
        .returns(true)

        post :create, :id => proposta_normal.id

        #TODO nao funciona
        expect(flash[:warning]).to be_present
        flash[:warning].should eq("Você já apoiou essa proposta hoje!")

        end 
    end

end
