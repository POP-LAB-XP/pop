# -*- encoding : utf-8 -*-
require 'rails_helper'

describe Users::RegistrationsController, type: :controller do
	
	before(:each) do
		@request.env["devise.mapping"] = Devise.mappings[:user]
		sign_in FactoryGirl.create(:user)
	end

	describe 'create' do
		context 'quando o limite de usuários da subprefeitura não foi atingido' do
			let!(:sub_prefeitura){ build(:sub_prefeitura) }
			let!(:codigo){'12345678'}
			before :each do
				sub_prefeitura.stubs(:limite_usuario_atingido).returns(false)
				sub_prefeitura.stubs(:find_by_codigo).with(codigo).returns(sub_prefeitura)
			end
			it 'é esperado que o usuário seja cadastrado' do
				post :create, {'user'=>{"email"=>"teste@gmail.com", "password"=>"123456789", "password_confirmation"=>"123456789"}, "codigo"=>codigo}
				is_expected.to redirect_to root_path
			end
		end

		context 'quando o limite de usuários da subprefeitura JÁ FOI atingido' do
			let!(:sub_prefeitura){ build(:sub_prefeitura) }
			let!(:codigo){'12345678'}
			before :each do
				sub_prefeitura.stubs(:limite_usuario_atingido).returns(true)
				sub_prefeitura.stubs(:find_by_codigo).with(codigo).returns(sub_prefeitura)
			end
			it 'é esperado que ocorra um erro' do
				post :create, {'user'=>{"email"=>"teste@gmail.com", "password"=>"123456789", "password_confirmation"=>"123456789"}, "codigo"=>codigo}
    			expect(flash[:alert]).to be_present
			end
		end
	end
end
