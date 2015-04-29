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
end
