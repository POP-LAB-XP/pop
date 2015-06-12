require 'rails_helper'

RSpec.describe VetosController, type: :controller do

  before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          sign_in FactoryGirl.create(:user)
  end

  describe 'show' do

    context 'quando estiver logado' do
      before(:each) do
          veto = create(:veto)
          get :show, id: veto.id
      end
      it 'o usuário pode acessar um veto' do
        response.should be_success
      end
    end

    context 'quando o veto nao existir' do
      before(:each) do
          get :show, id: 0
      end
      it 'deve dar erro 404' do
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'new' do
    let!(:proposta){ FactoryGirl.build(:proposta) }

    context 'quando estiver logado' do
      before(:each) do
          get :new, proposta_id: proposta.id
      end
      it 'o usuário pode acessar a página de criação de vetos' do
        response.should be_success
      end
      it 'a proposta escolhida deve ser exibida' do
        Proposta.stubs(:find_by_id)
                .with(proposta.id)
                .returns(proposta)
      end
    end
  end
  
  describe 'create' do
    let!(:user){ FactoryGirl.build(:user) }
    let(:current_user) { user }
    let!(:proposta){ FactoryGirl.build(:proposta) }
    let!(:veto){ FactoryGirl.build(:veto) }
    let!(:veto_incorreto){ 
      FactoryGirl.build(:veto, 
                        descricao: nil, 
                        proposta_id: -1) 
      }

    let!(:acao){ FactoryGirl.build(:acao) }
    let!(:mail){ Mail::Message.new }
       
    let!(:veto_params){
      { "descricao" => "teste controller veto", 
        "proposta_id" => "1"
      }
    }

    let!(:veto_params_incorretos){
      { "descricao" => nil, 
        "proposta_id" => -1
      }
    }
  
    before(:each) do
        Veto.stubs(:create).returns(veto)
        Acao.stubs(:create).returns(acao)
        PopMailer.stubs(:avisar_veto).returns(mail)
        mail.stubs(:deliver)
    end

    context 'quando criar veto' do

      before(:each) do
        Veto.stubs(:create).returns(veto)
        post :create, veto: veto_params
      end

      it 'é esperado que o usuário seja redirecionado para a página do veto' do
          is_expected.to redirect_to veto  
      end
    end

    context 'quando tentar criar veto com parametros incorretos' do
      before(:each) do
        Veto.stubs(:create).returns(veto_incorreto)
        post :create, veto: veto_params_incorretos
      end

      it 'é esperado que ocorra um erro' do
          expect(flash[:warning]).to be_present
          flash[:warning].should eq("Não foi possível vetar a proposta!")
      end
    end

  end

end
