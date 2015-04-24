require 'rails_helper'

describe Users::RegistrationsController, type: :controller do
=begin
	describe 'create' do
		context 'quando ainda não atingiu o limite da subprefeitura' do
			let!(:subPrefeitura){FactoryGirl.build(:sub_prefeitura)}
			let!(:codigo){'12345678'}
			before :each do
				@request.env["devise.mapping"] = Devise.mappings[:user]

				subPrefeitura.expects(:limite_usuario_atingido).returns(false)
				SubPrefeitura.expects(:find_by_codigo).with(codigo).returns(subPrefeitura)
			end
			it 'é esperado que o usuário seja cadastrado' do
				post :create, {'user'=>{"email"=>"teste@gmail.com", "password"=>"123456789", "password_confirmation"=>"123456789"}, "codigo"=>codigo}

				expect{User.count}.to change{User.count}.by(1)
			end
		end
	end
=end
end
