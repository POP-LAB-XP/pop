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
  
  describe 'create' do
    let!(:user){ FactoryGirl.build(:user) }
    let(:current_user) { user }
    let!(:proposta){ FactoryGirl.build(:proposta) }
    let!(:veto){ FactoryGirl.build(:veto) }
    let!(:acao){ FactoryGirl.build(:acao) }
    let!(:mail){ Mail::Message.new }
       
    let!(:veto_params){
      { "descricao" => "teste controller veto", 
        "proposta_id" => "1"
      }
    }
  
    before(:each) do
        Veto.stubs(:create).returns(veto)
        Acao.expects(:create).returns(acao)
        PopMailer.stubs(:avisar_veto).returns(mail)
        mail.stubs(:deliver)
    end

    context 'quando criar veto' do
      before(:each) do
        post :create, veto: veto_params
      end

      it 'é esperado que o usuário seja redirecionado para a página do veto' do
          is_expected.to redirect_to veto  
      end
    end
  end

end
