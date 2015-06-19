# -*- encoding : utf-8 -*-
require 'rails_helper'

describe Users::RegistrationsController, type: :controller do

	before(:each) do
		@request.env["devise.mapping"] = Devise.mappings[:user]
		sign_out :user
	end

	describe 'create' do
		context 'quando uma subprefeitura com código inválido é pesquisada' do
			let!(:codigo){nil}

			before :each do
				SubPrefeitura.expects(:find_by_codigo).with(codigo).returns(nil)
			end

			it "é esperado que a subprefeitura não exista" do
				post :create, {'user'=>{"email"=>"teste@gmail.com", "password"=>"123456789", "password_confirmation"=>"123456789"}, "codigo"=>codigo}
				expect(flash[:alert]).to be_present
				flash[:alert].should eq("Código de subprefeitura inválido!")
			end
		end

		context 'quando o limite de usuários da subprefeitura não foi atingido' do
			let!(:sub_prefeitura){ build(:sub_prefeitura) }
			let!(:codigo){'12345678'}
			before :each do
				SubPrefeitura.expects(:find_by_codigo).with(codigo).returns(sub_prefeitura)
				sub_prefeitura.stubs(:limite_usuario_atingido).returns(false)
				post :create, {'user'=>{"email"=>"teste@gmail.com", "password"=>"123456789", "password_confirmation"=>"123456789"}, "codigo"=>codigo}
			end
			it 'é esperado que o usuário seja cadastrado' do
				is_expected.to redirect_to root_path
			end
			#it 'é esperado que o usuário receba um e-mail' do
			#	PopMailer.expects(:termos_email)
			#end
		end

		context 'quando o limite de usuários da subprefeitura JÁ FOI atingido' do
			let!(:sub_prefeitura){ build(:sub_prefeitura) }
			let!(:codigo){'12345678'}
			before :each do
				SubPrefeitura.expects(:find_by_codigo).with(codigo).returns(sub_prefeitura)
				sub_prefeitura.stubs(:limite_usuario_atingido).returns(true)
			end
			it 'é esperado que ocorra um erro' do
				post :create, {'user'=>{"email"=>"teste@gmail.com", "password"=>"123456789", "password_confirmation"=>"123456789"}, "codigo"=>codigo}
    			expect(flash[:alert]).to be_present
    			flash[:alert].should eq("O limite de usuários dessa subprefeitura atingido!")
			end
		end
	end
end
